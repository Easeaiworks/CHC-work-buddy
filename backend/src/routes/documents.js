// routes/documents.js — Document CRUD

import { Router } from 'express';
import { supabase } from '../index.js';

export const documentsRouter = Router();

// GET /api/documents — List documents (optionally filtered by tab)
documentsRouter.get('/', async (req, res) => {
  const { tab, type, limit = 50, offset = 0 } = req.query;

  let query = supabase
    .from('documents')
    .select('*')
    .eq('is_active', true)
    .order('created_at', { ascending: false })
    .range(offset, offset + limit - 1);

  if (tab) query = query.eq('tab_slug', tab);
  if (type) query = query.eq('doc_type', type);

  const { data, error, count } = await query;
  if (error) return res.status(500).json({ error: error.message });

  res.json({ documents: data, total: count });
});

// GET /api/documents/:id — Single document
documentsRouter.get('/:id', async (req, res) => {
  const { data, error } = await supabase
    .from('documents')
    .select('*')
    .eq('id', req.params.id)
    .eq('is_active', true)
    .single();

  if (error || !data) return res.status(404).json({ error: 'Document not found' });
  res.json({ document: data });
});

// routes/search.js — Search endpoint
import { Router as SearchRouter } from 'express';
import { hybridSearch } from '../services/rag.js';

export const searchRouter = SearchRouter();

// GET /api/search?q=...&tab=...
searchRouter.get('/', async (req, res) => {
  const { q, tab } = req.query;
  if (!q?.trim()) return res.status(400).json({ error: 'Query required' });

  try {
    const results = await hybridSearch(q, { tabFilter: tab || null });
    res.json({ results, query: q });
  } catch (err) {
    res.status(500).json({ error: 'Search failed' });
  }
});

// routes/media.js — Media items
import { Router as MediaRouter } from 'express';

export const mediaRouter = MediaRouter();

// GET /api/media — List media items
mediaRouter.get('/', async (req, res) => {
  const { tab, type, limit = 20 } = req.query;

  let query = supabase
    .from('media_items')
    .select('*')
    .eq('is_active', true)
    .order('created_at', { ascending: false })
    .limit(limit);

  if (tab) query = query.eq('tab_slug', tab);
  if (type) query = query.eq('media_type', type);

  const { data, error } = await query;
  if (error) return res.status(500).json({ error: error.message });
  res.json({ media: data });
});
