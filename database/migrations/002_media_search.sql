-- BodyShop AI — Migration: Media Search Enhancement
-- Run this in Supabase SQL Editor AFTER the initial schema.sql

-- ─────────────────────────────────────────
-- 1. Add transcript + keywords columns to media_items
--    (transcript holds spoken content for richer search)
-- ─────────────────────────────────────────

ALTER TABLE public.media_items
  ADD COLUMN IF NOT EXISTS transcript TEXT,
  ADD COLUMN IF NOT EXISTS keywords TEXT[] DEFAULT '{}',
  ADD COLUMN IF NOT EXISTS search_vector tsvector
    GENERATED ALWAYS AS (
      setweight(to_tsvector('english', COALESCE(title, '')), 'A') ||
      setweight(to_tsvector('english', COALESCE(description, '')), 'B') ||
      setweight(to_tsvector('english', COALESCE(array_to_string(tags, ' '), '')), 'B') ||
      setweight(to_tsvector('english', COALESCE(array_to_string(keywords, ' '), '')), 'B') ||
      setweight(to_tsvector('english', COALESCE(transcript, '')), 'C')
    ) STORED;

-- GIN index on the generated search_vector for fast FTS
CREATE INDEX IF NOT EXISTS media_items_search_idx
  ON public.media_items USING GIN(search_vector);

-- GIN index on tags array for exact tag lookup
CREATE INDEX IF NOT EXISTS media_items_tags_idx
  ON public.media_items USING GIN(tags);

-- GIN index on keywords array
CREATE INDEX IF NOT EXISTS media_items_keywords_idx
  ON public.media_items USING GIN(keywords);

-- pg_trgm index for fuzzy partial-word matching (catches typos, partial words)
CREATE INDEX IF NOT EXISTS media_items_title_trgm_idx
  ON public.media_items USING GIN(title gin_trgm_ops);

-- ─────────────────────────────────────────
-- 2. search_media() — Full-text + tag + fuzzy search function
--    Returns ranked results combining all search strategies
-- ─────────────────────────────────────────

CREATE OR REPLACE FUNCTION public.search_media(
  search_query    TEXT,
  tab_filter      TEXT    DEFAULT NULL,
  media_type_filter TEXT  DEFAULT NULL,
  language_filter TEXT    DEFAULT NULL,
  result_limit    INT     DEFAULT 12
)
RETURNS TABLE (
  id              UUID,
  title           TEXT,
  description     TEXT,
  media_type      TEXT,
  tab_slug        TEXT,
  language        TEXT,
  file_url        TEXT,
  thumbnail_url   TEXT,
  duration_seconds INTEGER,
  tags            TEXT[],
  keywords        TEXT[],
  transcript      TEXT,
  rank            FLOAT
)
LANGUAGE plpgsql
AS $$
DECLARE
  tsq tsquery;
BEGIN
  -- Build tsquery safely — fall back to plain if query is unusual
  BEGIN
    tsq := websearch_to_tsquery('english', search_query);
  EXCEPTION WHEN OTHERS THEN
    tsq := plainto_tsquery('english', search_query);
  END;

  RETURN QUERY
  SELECT
    m.id,
    m.title,
    m.description,
    m.media_type,
    m.tab_slug,
    m.language,
    m.file_url,
    m.thumbnail_url,
    m.duration_seconds,
    m.tags,
    m.keywords,
    m.transcript,
    -- Composite rank: FTS rank + tag exact match bonus + trigram similarity bonus
    (
      ts_rank_cd(m.search_vector, tsq, 32)  -- FTS rank (normalised by doc length)
      + CASE WHEN m.tags && string_to_array(lower(search_query), ' ') THEN 0.3 ELSE 0 END
      + CASE WHEN m.keywords && string_to_array(lower(search_query), ' ') THEN 0.2 ELSE 0 END
      + (similarity(m.title, search_query) * 0.4)  -- trigram similarity on title
    )::FLOAT AS rank
  FROM public.media_items m
  WHERE m.is_active = true
    AND (tab_filter       IS NULL OR m.tab_slug   = tab_filter)
    AND (media_type_filter IS NULL OR m.media_type = media_type_filter)
    AND (language_filter  IS NULL OR m.language   = language_filter)
    AND (
      -- Primary: full-text match on generated vector
      m.search_vector @@ tsq
      -- Fallback: trigram similarity on title (catches partial matches)
      OR similarity(m.title, search_query) > 0.2
      -- Exact tag match
      OR m.tags && string_to_array(lower(search_query), ' ')
      -- Exact keyword match
      OR m.keywords && string_to_array(lower(search_query), ' ')
    )
  ORDER BY rank DESC
  LIMIT result_limit;
END;
$$;

-- ─────────────────────────────────────────
-- 3. Quick-lookup by single tag (used by tag-click UI)
-- ─────────────────────────────────────────

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

-- ─────────────────────────────────────────
-- 4. Update the media RLS policy to allow reads by all authenticated users
--    (already set in schema.sql, but keeping here for completeness)
-- ─────────────────────────────────────────

-- If you see RLS errors on media search, run:
-- ALTER TABLE public.media_items ENABLE ROW LEVEL SECURITY;
-- DROP POLICY IF EXISTS "media_select" ON public.media_items;
-- CREATE POLICY "media_select" ON public.media_items FOR SELECT TO authenticated USING (is_active = true);
