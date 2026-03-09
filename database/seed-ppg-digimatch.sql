-- ═══════════════════════════════════════════════════════════════
-- PPG DigiMatch — Advanced Color Matching Spectrophotometer
-- Run in Supabase SQL Editor
-- ═══════════════════════════════════════════════════════════════

INSERT INTO public.documents (title, description, doc_type, tab_slug, tags, metadata) VALUES (
  'PPG DigiMatch — Advanced Color Matching Spectrophotometer',
  'PPG DigiMatch compact spectrophotometer with 6 reflectance and 6 imaging angles, digital color camera, 2.8-inch touchscreen, WiFi/USB connectivity. Compatible with PaintManager XI, Linq Color, and PPG VisualizID. Under 30 seconds per reading, 160-job storage capacity.',
  'tech_sheet',
  'painting',
  ARRAY['ppg', 'DigiMatch', 'spectrophotometer', 'color matching', 'color camera', 'PaintManager XI', 'Linq', 'VisualizID', 'WiFi', 'touchscreen', 'docking station', 'reflectance angles', 'imaging angles', 'formula matching'],
  '{"full_content": "PPG DigiMatch — Advanced Color Matching Tool\n\nCompact, fast, easy-to-use spectrophotometer.\n\nThe PPG spectrophotometer combines small design with enhanced technology. PPG DigiMatch has a functional ergonomic design that is lightweight and can be used with one hand, while also boasting a digital color camera packed with technology. The camera''s 6 imaging angles, with additional 6 reflectance angles, provide texture information to help retrieve the correct formula matches quickly and efficiently.\n\nFEATURES:\n• Intuitive 2.8-inch high-resolution touchscreen with large icons for easy navigation\n• Docking station to charge and store spectro safely and dust free, holding the calibration tiles as well\n• Portable, ergonomic and lightweight — small form allows users to maneuver into difficult areas on vehicles\n• Multi-angle color spectrophotometer featuring 6 reflectance and 6 imaging angles, providing a magnified image to avoid defects when taking a reading\n• Exclusive appearance and coloring with option to connect via WiFi or USB cable\n• Seamless compatibility with PaintManager XI, Linq Color and the perfect companion for PPG VisualizID\n\nBENEFITS:\n• Improve performance — With three pressure sensors around the measurement port, PPG DigiMatch takes less than 30 seconds for a car to be read even on curved surfaces, significantly improving body shop and individual painter performance\n• Save time — Reduce repair costs and time spent doing spray outs. Users can compare color differences of two adjacent parts\n• Go mobile — Completely mobile with WiFi connectivity. Lightweight, one-hand operation. Large storage capacity equating to 160 jobs\n• Easy to use — Incredibly intuitive for painters without training due to high-quality touchscreen and large user-friendly icons. Seamlessly connects to PPG VisualizID for quicker color identification\n\nSource: PPG Industries — ppgrefinish.com"}'::jsonb
);

INSERT INTO public.document_chunks (document_id, chunk_index, content, metadata)
SELECT id, 0,
  'PPG DigiMatch advanced color matching spectrophotometer. Compact lightweight ergonomic one-hand operation. Digital color camera with 6 imaging angles and 6 reflectance angles provides texture information for correct formula matches. 2.8-inch high-resolution touchscreen with large icons. Docking station charges and stores safely with calibration tiles. Connect via WiFi or USB cable. Compatible with PaintManager XI, Linq Color, and PPG VisualizID. Three pressure sensors around measurement port, reads car in under 30 seconds even on curved surfaces. Can compare color differences of two adjacent parts. Storage capacity 160 jobs. Intuitive for painters without training.',
  '{"source": "PPG DigiMatch", "type": "tech_sheet", "category": "color matching"}'::jsonb
FROM public.documents WHERE title = 'PPG DigiMatch — Advanced Color Matching Spectrophotometer';

-- VERIFY
SELECT 'DigiMatch document: ' || COUNT(*) FROM public.documents WHERE title LIKE '%DigiMatch%';
SELECT 'DigiMatch chunks: ' || COUNT(*) FROM public.document_chunks dc JOIN public.documents d ON dc.document_id = d.id WHERE d.title LIKE '%DigiMatch%';
