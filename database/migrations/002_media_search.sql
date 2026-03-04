-- BodyShop AI — Migration: Media Search Enhancement
-- Run this in Supabase SQL Editor AFTER the initial schema.sql
-- Note: Uses trigger-based approach instead of GENERATED ALWAYS AS
-- because Supabase/Postgres requires immutable expressions for generated columns.

-- 1. Add transcript + keywords + search_vector columns
ALTER TABLE public.media_items
  ADD COLUMN IF NOT EXISTS transcript TEXT,
  ADD COLUMN IF NOT EXISTS keywords TEXT[] DEFAULT '{}',
  ADD COLUMN IF NOT EXISTS search_vector tsvector;

-- 2. Trigger function to auto-update search_vector on insert/update
CREATE OR REPLACE FUNCTION public.media_search_vector_update()
RETURNS TRIGGER AS $$
BEGIN
  NEW.search_vector :=
    setweight(to_tsvector('english', COALESCE(NEW.title, '')), 'A') ||
    setweight(to_tsvector('english', COALESCE(NEW.description, '')), 'B') ||
    setweight(to_tsvector('english', COALESCE(array_to_string(NEW.tags, ' '), '')), 'B') ||
    setweight(to_tsvector('english', COALESCE(array_to_string(NEW.keywords, ' '), '')), 'B') ||
    setweight(to_tsvector('english', COALESCE(NEW.transcript, '')), 'C');
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER media_search_vector_trigger
  BEFORE INSERT OR UPDATE ON public.media_items
  FOR EACH ROW EXECUTE FUNCTION public.media_search_vector_update();

-- 3. Backfill search_vector for any existing rows
UPDATE public.media_items SET search_vector =
  setweight(to_tsvector('english', COALESCE(title, '')), 'A') ||
  setweight(to_tsvector('english', COALESCE(description, '')), 'B') ||
  setweight(to_tsvector('english', COALESCE(array_to_string(tags, ' '), '')), 'B') ||
  setweight(to_tsvector('english', COALESCE(array_to_string(keywords, ' '), '')), 'B') ||
  setweight(to_tsvector('english', COALESCE(transcript, '')), 'C');

-- 4. Indexes
CREATE INDEX IF NOT EXISTS media_items_search_idx
  ON public.media_items USING GIN(search_vector);

CREATE INDEX IF NOT EXISTS media_items_tags_idx
  ON public.media_items USING GIN(tags);

CREATE INDEX IF NOT EXISTS media_items_keywords_idx
  ON public.media_items USING GIN(keywords);

CREATE INDEX IF NOT EXISTS media_items_title_trgm_idx
  ON public.media_items USING GIN(title gin_trgm_ops);

-- 5. search_media() — Full-text + tag + fuzzy search function
CREATE OR REPLACE FUNCTION public.search_media(
  search_query TEXT,
  tab_filter TEXT DEFAULT NULL,
  media_type_filter TEXT DEFAULT NULL,
  language_filter TEXT DEFAULT NULL,
  result_limit INT DEFAULT 12
)
RETURNS TABLE (
  id UUID,
  title TEXT,
  description TEXT,
  media_type TEXT,
  tab_slug TEXT,
  language TEXT,
  file_url TEXT,
  thumbnail_url TEXT,
  duration_seconds INTEGER,
  tags TEXT[],
  keywords TEXT[],
  transcript TEXT,
  rank FLOAT
)
LANGUAGE plpgsql
AS $$
DECLARE
  tsq tsquery;
BEGIN
  BEGIN
    tsq := websearch_to_tsquery('english', search_query);
  EXCEPTION WHEN OTHERS THEN
    tsq := plainto_tsquery('english', search_query);
  END;
  RETURN QUERY
  SELECT
    m.id, m.title, m.description, m.media_type, m.tab_slug,
    m.language, m.file_url, m.thumbnail_url, m.duration_seconds,
    m.tags, m.keywords, m.transcript,
    (
      ts_rank_cd(m.search_vector, tsq, 32)
      + CASE WHEN m.tags && string_to_array(lower(search_query), ' ') THEN 0.3 ELSE 0 END
      + CASE WHEN m.keywords && string_to_array(lower(search_query), ' ') THEN 0.2 ELSE 0 END
      + (similarity(m.title, search_query) * 0.4)
    )::FLOAT AS rank
  FROM public.media_items m
  WHERE m.is_active = true
    AND (tab_filter IS NULL OR m.tab_slug = tab_filter)
    AND (media_type_filter IS NULL OR m.media_type = media_type_filter)
    AND (language_filter IS NULL OR m.language = language_filter)
    AND (
      m.search_vector @@ tsq
      OR similarity(m.title, search_query) > 0.2
      OR m.tags && string_to_array(lower(search_query), ' ')
      OR m.keywords && string_to_array(lower(search_query), ' ')
    )
  ORDER BY rank DESC
  LIMIT result_limit;
END;
$$;

-- 6. Quick-lookup by single tag (used by tag-click UI)
CREATE OR REPLACE FUNCTION public.media_by_tag(
  tag_value TEXT,
  result_limit INT DEFAULT 20
)
RETURNS SETOF public.media_items
LANGUAGE sql STABLE
AS $$
  SELECT * FROM public.media_items
  WHERE is_active = true
    AND (tags @> ARRAY[lower(tag_value)] OR keywords @> ARRAY[lower(tag_value)])
  ORDER BY created_at DESC
  LIMIT result_limit;
$$;
