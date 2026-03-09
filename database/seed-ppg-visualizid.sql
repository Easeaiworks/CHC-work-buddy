-- ═══════════════════════════════════════════════════════════════
-- PPG VisualizID — Digital Color Visualization Technology
-- Run in Supabase SQL Editor
-- ═══════════════════════════════════════════════════════════════

INSERT INTO public.documents (title, description, doc_type, tab_slug, tags, metadata) VALUES (
  'PPG VisualizID — Digital Color Visualization Technology',
  'PPG VisualizID digital color visualization tool that connects with PPG camera-equipped spectrophotometers (RapidMatch XI and DigiMatch) to help find the best color variant. Features advanced 3D rendering, virtual blend and edge views, and access to PPG''s color match library.',
  'tech_sheet',
  'painting',
  ARRAY['ppg', 'VisualizID', 'color visualization', 'spectrophotometer', 'RapidMatch XI', 'DigiMatch', '3D rendering', 'color matching', 'variant', 'digital', 'spray out', 'color library', 'Linq'],
  '{"full_content": "PPG VisualizID — Exceptional Color Visualization Technology\n\nVisualizing Color Has Never Been Easier.\n\nPPG''s unprecedented digital color visualization tool, when connected with PPG''s camera-equipped spectrophotometers (RapidMatch XI and DigiMatch), helps users find the best color variant from PPG''s extensive color match library.\n\nFEATURES:\n• Advanced 3D rendering, including virtual blend and edge views\n• Manipulate shape orientation and light source\n• Realistic visualization for variants that would require spray out\n• No additional computer hardware required\n• Removes need for physical color tools\n• Access to PPG''s immense color match library\n• Intuitive and easy to use\n\nBENEFITS:\n• Increase match quality — Using advanced rendering technology, users receive realistic visuals to select the best match every time, reducing dependency on physical color tools\n• Save time — Reduce painting costs and time spent making spray outs to support the decision in choosing the right formula, saving time and increasing productivity\n• Reduce inefficiencies — With less room for human error, reduced repetitions, and the ability to make quicker matches and share them immediately, body shops can easily improve their overall efficiency\n• Boost profitability — Increase body shop profits with time and paint savings\n\nSource: PPG Industries — ppgrefinish.com"}'::jsonb
);

INSERT INTO public.document_chunks (document_id, chunk_index, content, metadata)
SELECT id, 0,
  'PPG VisualizID digital color visualization technology. Connects with PPG camera-equipped spectrophotometers RapidMatch XI and DigiMatch to find best color variant from PPG color match library. Features: advanced 3D rendering including virtual blend and edge views, manipulate shape orientation and light source, realistic visualization for variants that would require spray out, no additional computer hardware required, removes need for physical color tools, access to PPG immense color match library. Benefits: increase match quality with realistic visuals reducing dependency on physical color tools, save time by reducing spray outs and painting costs, reduce inefficiencies with less human error and quicker matches shared immediately, boost profitability with time and paint savings.',
  '{"source": "PPG VisualizID", "type": "tech_sheet", "category": "color matching"}'::jsonb
FROM public.documents WHERE title = 'PPG VisualizID — Digital Color Visualization Technology';

-- VERIFY
SELECT 'VisualizID document: ' || COUNT(*) FROM public.documents WHERE title LIKE '%VisualizID%';
SELECT 'VisualizID chunks: ' || COUNT(*) FROM public.document_chunks dc JOIN public.documents d ON dc.document_id = d.id WHERE d.title LIKE '%VisualizID%';
