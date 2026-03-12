-- Migration 004: Update SU4902 → SU470LV
-- PPG SU470LV / SUA470LV is the current 1K Compliant Adhesion Promoter
-- Replaces the older SU4902 Plastic Adhesion Prep
-- Source: PPG Technical Data Sheet OC-35
-- Run in Supabase SQL Editor

-- ═══════════════════════════════════════════════════════════
-- 1. Update Quiz Question (Plastic & Substrate Prep — Q2)
-- ═══════════════════════════════════════════════════════════

UPDATE public.quiz_questions SET
  question_text_en = 'How long should PPG SU470LV 1K Adhesion Promoter dry before top coating at 70°F (21°C)?',
  question_text_fr = 'Combien de temps le SU470LV doit-il sécher avant d''appliquer la couche suivante à 70°F (21°C)?',
  question_text_es = '¿Cuánto tiempo debe secarse el SU470LV antes de aplicar la capa siguiente a 70°F (21°C)?',
  explanation_en = 'PPG TDS OC-35: SU470LV requires 10 minutes dry time at 70°F (21°C) before top coating. Apply 1 medium wet coat — ready to spray, no mixing required. If more than 1 hour passes, lightly sand, re-clean, and reapply.',
  explanation_fr = 'TDS PPG OC-35: Le SU470LV nécessite 10 minutes de séchage à 70°F (21°C) avant la couche suivante. Appliquer 1 couche humide moyenne — prêt à pulvériser, aucun mélange requis. Si plus d''une heure, poncer légèrement, re-nettoyer et réappliquer.',
  explanation_es = 'TDS PPG OC-35: El SU470LV requiere 10 minutos de secado a 70°F (21°C) antes de la capa siguiente. Aplicar 1 capa húmeda media — listo para rociar, sin mezcla requerida. Si pasa más de 1 hora, lijar ligeramente, limpiar y volver a aplicar.'
WHERE id = 'b1000001-0001-0001-0005-000000000002';

-- Update answer options: correct answer is now 10 minutes (not 3-5)
DELETE FROM public.quiz_answers WHERE question_id = 'b1000001-0001-0001-0005-000000000002';
INSERT INTO public.quiz_answers (question_id, answer_order, answer_text_en, answer_text_fr, answer_text_es, is_correct) VALUES
  ('b1000001-0001-0001-0005-000000000002', 1, '10 minutes', '10 minutes', '10 minutos', true),
  ('b1000001-0001-0001-0005-000000000002', 2, '3-5 minutes', '3-5 minutes', '3-5 minutos', false),
  ('b1000001-0001-0001-0005-000000000002', 3, '30 minutes', '30 minutes', '30 minutos', false),
  ('b1000001-0001-0001-0005-000000000002', 4, 'No dry time — top coat immediately', 'Pas de séchage — appliquer immédiatement', 'Sin tiempo de secado — aplicar inmediatamente', false);

-- ═══════════════════════════════════════════════════════════
-- 2. Add SU470LV Technical Data Document to Knowledge Base
-- ═══════════════════════════════════════════════════════════

INSERT INTO public.documents (title, description, doc_type, tab_slug, tags, metadata) VALUES (
  'PPG SU470LV / SUA470LV — OneChoice 1K Compliant Adhesion Promoter (TDS OC-35)',
  'PPG OneChoice SU470LV (National Rule) and SUA470LV (SCAQMD Compliant) single-component 1K adhesion promoter for TPO, PP, EPDM, Noryl, ABS, SMC, fiberglass. Ready to spray, no mixing. Replaces older SU4902. 10 min dry time at 70°F. Source: PPG TDS OC-35.',
  'tech_sheet',
  'painting',
  ARRAY['ppg', 'SU470LV', 'SUA470LV', 'adhesion promoter', '1K', 'plastic prep', 'TPO', 'PP', 'EPDM', 'ABS', 'SMC', 'fiberglass', 'SU4902', 'OneChoice', 'OC-35'],
  '{"full_content": "PPG OneChoice SU470LV / SUA470LV — 1K Compliant Adhesion Promoter\n\nProduct Description:\nSU470LV (National Rule) and SUA470LV (SCAQMD Compliant) are single-component (1K) adhesion promoters for use on properly prepared OEM and aftermarket plastic parts including TPO, PP, EPDM, Noryl, ABS, SMC, and fiberglass. Replaces the older two-component SU4902 system.\n\nKey Advantages:\n• Ready to spray — no mixing, reducing, or catalyst required\n• Indefinite pot life (single component)\n• 1K formula reduces waste and simplifies inventory\n• VOC Compliant: SU470LV ≤4.4 lbs/gal, SUA470LV ≤2.1 lbs/gal\n\nSurface Preparation:\n1. Clean surface with SWX350, SX103/SXA103, or SX394\n2. Scuff with SU4901 Clean & Scuff Pad or SX1002 Sanding Paste\n3. Re-clean with SWX350 or SX103/SXA103\n4. Blow off with filtered compressed air or tack cloth\n\nApplication:\n• Apply 1 medium wet coat\n• Spray gun setup: Fluid tip 1.3–1.5 mm\n• HVLP pressure: 8–10 PSI at the cap\n• Compliant gun pressure: 29–40 PSI\n• Coverage: approx. 700 sq ft per gallon\n\nDry Time:\n• 10 minutes at 70°F (21°C) before applying topcoat\n• If more than 1 hour has passed, lightly sand, re-clean, and reapply\n\nCritical Notes:\n• Do NOT directly topcoat with Envirobase HP or Aquabase Plus waterborne basecoats — a sealer coat is required first\n• Compatible topcoat systems: Deltron 2000, Envirobase HP (with sealer), Global Refinish System, Aquabase Plus (with sealer), Concept, Nexa Autocolor\n• Store at 60–80°F (16–27°C). Do not freeze.\n\nPackaging: SU470LV and SUA470LV available in Quart and Gallon\n\nSource: PPG Industries — TDS OC-35", "source": "PPG TDS OC-35", "product_code": "SU470LV", "replaces": "SU4902", "type": "tech_sheet", "manufacturer": "PPG Industries"}'::jsonb
);

-- Chunk 1: Product overview, advantages, and surface prep
INSERT INTO public.document_chunks (document_id, chunk_index, content, metadata)
SELECT id, 0,
  'PPG OneChoice SU470LV SUA470LV 1K Compliant Adhesion Promoter. Single-component 1K adhesion promoter for OEM and aftermarket plastic parts: TPO PP EPDM Noryl ABS SMC fiberglass. Replaces older two-component SU4902 system. Ready to spray no mixing reducing or catalyst required. Indefinite pot life. VOC compliant SU470LV 4.4 lbs/gal SUA470LV 2.1 lbs/gal. Surface prep: clean with SWX350 SX103 SXA103 or SX394, scuff with SU4901 Clean and Scuff Pad or SX1002 Sanding Paste, re-clean, blow off with filtered compressed air or tack cloth.',
  '{"source": "PPG TDS OC-35", "type": "tech_sheet", "category": "adhesion-promoter", "product_code": "SU470LV"}'::jsonb
FROM public.documents WHERE title = 'PPG SU470LV / SUA470LV — OneChoice 1K Compliant Adhesion Promoter (TDS OC-35)';

-- Chunk 2: Application, dry time, and critical compatibility notes
INSERT INTO public.document_chunks (document_id, chunk_index, content, metadata)
SELECT id, 1,
  'SU470LV application: Apply 1 medium wet coat. Fluid tip 1.3-1.5 mm. HVLP 8-10 PSI at cap. Compliant gun 29-40 PSI. Coverage approx 700 sq ft per gallon. Dry time 10 minutes at 70°F 21°C before top coating. If more than 1 hour has passed lightly sand re-clean and reapply. CRITICAL: Do NOT directly topcoat with Envirobase HP or Aquabase Plus waterborne basecoats — must apply sealer coat first. Compatible systems: Deltron 2000, Envirobase HP with sealer, Global Refinish System, Aquabase Plus with sealer, Concept, Nexa Autocolor. Store 60-80°F 16-27°C do not freeze. Available in quart and gallon.',
  '{"source": "PPG TDS OC-35", "type": "tech_sheet", "category": "application", "product_code": "SU470LV"}'::jsonb
FROM public.documents WHERE title = 'PPG SU470LV / SUA470LV — OneChoice 1K Compliant Adhesion Promoter (TDS OC-35)';
