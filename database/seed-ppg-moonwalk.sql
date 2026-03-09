-- ═══════════════════════════════════════════════════════════════
-- PPG MoonWalk — Automated Paint Mixing System
-- Run in Supabase SQL Editor
-- ═══════════════════════════════════════════════════════════════

INSERT INTO public.documents (title, description, doc_type, tab_slug, tags, metadata) VALUES (
  'PPG MoonWalk — Automated Paint Mixing System',
  'PPG MoonWalk semi-automated waterborne paint mixing system for collision repair. Compact split cabinet (2+1m), 82 toner storage spaces, 13-position dispensing rack, ultra-precise 0.01g scale, barcode scanning, fully integrated with PPG Linq digital ecosystem. Eliminates waste, maximizes accuracy to near 100% color match, automates mixing process.',
  'tech_sheet',
  'painting',
  ARRAY['ppg', 'MoonWalk', 'automated mixing', 'paint mixing', 'semi-automatic', 'dispensing', 'Linq', 'barcode', 'toner storage', 'scale', 'mixing room', 'MoonWipes', 'COROB', 'Collision Services', 'waste reduction', 'color accuracy', 'productivity'],
  '{"full_content": "PPG MoonWalk — Setting a New Standard in Paint Mixing for Collision Repair\n\nELIMINATE WASTE: Minimize material consumption waste with a revolutionary self-contained system suitable for all mixing rooms.\n\nMAXIMISE ACCURACY: Ultra precision from automating the mixing process. Mixes to within 0.01 of a litre, color accuracy near 100%.\n\nAUTOMATED PROCESS: Greater productivity with innovative software, reduces labor costs, increases efficiency, limits human error.\n\nGENERATE PROFIT: Maximize revenue with efficient mixing technology that saves labor costs, streamlines bodyshop processes, creates greater workroom capacity.\n\nFEATURES:\n\nSelf-contained solution:\n• Compact split cabinet (2+1m), single power plug\n• 82 storage spaces for toners + 13 positions in dispensing rack\n• 1 scale + touchscreen computer + label printer\n\nBottle scanning system with ultra-precise moving scale, fully integrated with PPG Linq digital ecosystem and smart onboard software.\n\nSemi-automatic dispenser process:\n1. PPG Linq Color displays formula\n2. User loads products in dispensing rack\n3. MoonWalk checks products with barcode\n4. MoonWalk dispenses the amount automatically\n5. MoonWalk communicates results to PPG Linq Color\n\nDispensing group: 80+ toners have dedicated pumping group, designed to fit PPG standard bottles only.\n\nDispensing rack: 13 positions (10 toners + 1 additive + 1 thinner + 1 free). Ready-to-spray mix in one click. Rack loaded before and locked during dispensing. Easy to clean components with drop catchers.\n\nUltra-precise moving scale: 0.01g precision, 2.2 Kg capacity — 10 times more precise than standard scale. Scale rack moves under each dispensing group and activates the pump.\n\nFull integration with PPG Linq Digital Ecosystem: Linq Color, Collision Services, DigiMatch, MoonWalk Smart Software, Vantage Point connection, customer data utilization, teleservice from PPG and COROB, Collision Services Analytics, KPIs, and automatic replenishment.\n\nSmart onboard software: intuitive user interface, simple default modes for basic users or highly configurable for advanced users, auto-adaptive toner calibration, warning on bottle levels, smart re-use of loaded bottles, receives formulas from and communicates results to Linq Color.\n\nMoonWipes: Dedicated cleaning wipes compatible with all machine components. Developed and tested to ensure no damage or scratching.\n\nSource: PPG Industries — ppgrefinish.com"}'::jsonb
);

-- Chunk 1: Overview and benefits
INSERT INTO public.document_chunks (document_id, chunk_index, content, metadata)
SELECT id, 0,
  'PPG MoonWalk automated paint mixing system for collision repair. Semi-automatic waterborne paint mixing. Eliminates waste minimizes material consumption. Maximizes accuracy with ultra precision, mixes to within 0.01 of a litre, color accuracy near 100%. Automates mixing process reduces labor costs increases efficiency limits human error. Generates profit saves labor costs streamlines bodyshop processes creates workroom capacity. Deskills mixing process freeing up painters to paint. Parts department can mix paint instead of paint technicians. Compact split cabinet 2+1 meters single power plug. 82 storage spaces for toners plus 13 positions in dispensing rack.',
  '{"source": "PPG MoonWalk", "type": "tech_sheet", "category": "mixing system"}'::jsonb
FROM public.documents WHERE title = 'PPG MoonWalk — Automated Paint Mixing System';

-- Chunk 2: Technical features and Linq integration
INSERT INTO public.document_chunks (document_id, chunk_index, content, metadata)
SELECT id, 1,
  'MoonWalk technical features: semi-automatic dispenser process - Linq Color displays formula, user loads products in dispensing rack, MoonWalk checks products with barcode, dispenses amount automatically, communicates results to Linq Color. 80+ toners with dedicated pumping groups for PPG standard bottles. Dispensing rack 13 positions 10 toners 1 additive 1 thinner 1 free, ready-to-spray mix one click. Ultra-precise moving scale 0.01g precision 2.2kg capacity 10 times more precise than standard. Full integration PPG Linq ecosystem: Linq Color Collision Services DigiMatch Vantage Point customer data teleservice analytics KPIs automatic replenishment. Smart software auto-adaptive toner calibration bottle level warnings re-use loaded bottles. MoonWipes cleaning wipes safe for all components.',
  '{"source": "PPG MoonWalk", "type": "tech_sheet", "category": "mixing system"}'::jsonb
FROM public.documents WHERE title = 'PPG MoonWalk — Automated Paint Mixing System';

-- VERIFY
SELECT 'MoonWalk document: ' || COUNT(*) FROM public.documents WHERE title LIKE '%MoonWalk%';
SELECT 'MoonWalk chunks: ' || COUNT(*) FROM public.document_chunks dc JOIN public.documents d ON dc.document_id = d.id WHERE d.title LIKE '%MoonWalk%';
