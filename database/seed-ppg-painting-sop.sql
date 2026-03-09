-- ═══════════════════════════════════════════════════════════════
-- PPG Envirobase High Performance — Painting SOP (9-Step Process)
-- Source: PPG Refinish SOP board (ca.ppgrefinish.com)
-- Run in Supabase SQL Editor
-- ═══════════════════════════════════════════════════════════════

-- ─── Document: Painting SOP ────────────────────────────────────
INSERT INTO public.documents (title, description, doc_type, tab_slug, tags, metadata) VALUES (
  'PPG SOP: Painting — 9-Step Standard Operating Procedure',
  'PPG Envirobase 9-step painting standard operating procedure covering safe colour matching, base coat mixing, primer cleaning, base coat application, flash off, clear coat application, cutting clear coat, surface temperature checking, and laminating.',
  'procedure',
  'painting',
  ARRAY['ppg', 'sop', 'painting', 'colour matching', 'base coat', 'clear coat', 'primer', 'flash off', 'laminating', 'surface temperature', 'envirobase', '3M', 'cutting', 'mixing'],
  '{"full_content": "PPG SOP: Painting — 9-Step Standard Operating Procedure (Envirobase High Performance)\n\nStep 1: Safe Colour Matching\n• Use the PPG colour tools and variant deck to identify the correct colour code.\n• Always verify the colour match against the vehicle under proper lighting conditions.\n• Select the best variant before mixing.\n\nStep 2: Mixing the Base Coat\n• Mix the base coat according to the PPG technical data sheet ratios.\n• Use the correct Envirobase High Performance mixing system.\n• Ensure thorough mixing for uniform colour consistency.\n\nStep 3: Cleaning the Primer\n• Clean the primed surface with appropriate waterborne pre-cleaner.\n• Remove all dust, debris, and contaminants.\n• Tack cloth the surface immediately before painting.\n\nStep 4: Application of Base Coat\n• Apply base coat in medium wet coats.\n• Maintain consistent spray distance and overlap pattern.\n• Apply sufficient coats for full coverage and hiding.\n• Allow proper flash time between coats.\n\nStep 5: Flash Off\n• Allow the base coat to flash completely before clear coat application.\n• Use air movement equipment to assist drying if needed.\n• Base coat must be uniformly matte/dull before proceeding.\n• Do not apply clear coat over wet or tacky base coat.\n\nStep 6: Application of Clear Coat\n• Apply clear coat in 2 medium wet coats.\n• Maintain proper spray technique for even film build.\n• Allow flash time between clear coats as per technical data sheet.\n\nStep 7: Cutting the Clear Coat\n• After full cure, wet sand with fine grit (P1500-P2000) to remove any defects.\n• Use cutting compound to restore gloss.\n• Polish to final finish.\n\nStep 8: Checking the Surface Temperature\n• Use an infrared thermometer to verify surface temperature before and during application.\n• Ensure the substrate temperature is within the recommended range for the product being applied.\n• Ambient and surface temperature affect flash times, film build, and final appearance.\n\nStep 9: Laminating\n• Apply protective laminate film to freshly painted surfaces where required.\n• Ensure no dust or debris is trapped under the laminate.\n• Follow manufacturer guidelines for laminate application and removal timing.\n\nSource: PPG Envirobase High Performance — ca.ppgrefinish.com\nPartner: 3M"}'::jsonb
);

-- Insert document chunk for vector search
INSERT INTO public.document_chunks (document_id, chunk_index, content, metadata)
SELECT id, 0,
  'PPG SOP Painting 9-Step Standard Operating Procedure: Step 1 safe colour matching - use PPG colour tools and variant deck, verify colour match under proper lighting. Step 2 mixing the base coat - mix according to PPG technical data sheet ratios using Envirobase mixing system. Step 3 cleaning the primer - clean primed surface with waterborne pre-cleaner, remove dust debris contaminants, tack cloth before painting. Step 4 application of base coat - apply in medium wet coats, maintain consistent spray distance and overlap, allow flash time between coats. Step 5 flash off - allow base coat to flash completely before clear, use air movement equipment, must be uniformly matte dull. Step 6 application of clear coat - apply 2 medium wet coats, maintain proper spray technique, allow flash time between coats. Step 7 cutting the clear coat - wet sand P1500-P2000, use cutting compound, polish to final finish. Step 8 checking surface temperature - use infrared thermometer, ensure substrate within recommended range, temperature affects flash times and film build. Step 9 laminating - apply protective laminate film, ensure no dust trapped, follow manufacturer guidelines.',
  '{"source": "PPG Envirobase", "type": "procedure", "category": "painting"}'::jsonb
FROM public.documents WHERE title = 'PPG SOP: Painting — 9-Step Standard Operating Procedure';


-- ═══════════════════════════════════════════════════════════════
-- QUIZ: PPG Painting Process
-- ═══════════════════════════════════════════════════════════════

INSERT INTO public.quizzes (title_en, title_fr, title_es, description_en, description_fr, description_es, slug, category, difficulty, pass_percentage, is_active)
VALUES (
  'PPG Painting Process',
  'Processus de peinture PPG',
  'Proceso de pintura PPG',
  'Test your knowledge of the PPG Envirobase 9-step painting standard operating procedure — from colour matching to laminating.',
  'Testez vos connaissances sur la procédure standard de peinture PPG Envirobase en 9 étapes.',
  'Evalúa tu conocimiento del procedimiento estándar de pintura PPG Envirobase de 9 pasos.',
  'ppg-painting-process',
  'painting',
  'intermediate',
  75,
  true
);

-- Q1: What is the first step in the PPG painting SOP?
INSERT INTO public.quiz_questions (quiz_id, question_text_en, question_text_fr, question_text_es, explanation_en, explanation_fr, explanation_es, order_index)
SELECT id,
  'What is the first step in the PPG 9-step painting procedure?',
  'Quelle est la première étape de la procédure de peinture PPG en 9 étapes?',
  '¿Cuál es el primer paso en el procedimiento de pintura PPG de 9 pasos?',
  'Step 1 is Safe Colour Matching — always verify the correct colour code using PPG colour tools before mixing.',
  'L''étape 1 est la correspondance sûre des couleurs.',
  'El paso 1 es la igualación segura del color.',
  1
FROM public.quizzes WHERE slug = 'ppg-painting-process';

INSERT INTO public.quiz_answers (question_id, answer_text_en, answer_text_fr, answer_text_es, is_correct)
SELECT id, 'Safe colour matching', 'Correspondance sûre des couleurs', 'Igualación segura del color', true FROM public.quiz_questions WHERE question_text_en = 'What is the first step in the PPG 9-step painting procedure?'
UNION ALL
SELECT id, 'Mixing the base coat', 'Mélange de la couche de base', 'Mezcla de la capa base', false FROM public.quiz_questions WHERE question_text_en = 'What is the first step in the PPG 9-step painting procedure?'
UNION ALL
SELECT id, 'Cleaning the primer', 'Nettoyage de l''apprêt', 'Limpieza del imprimador', false FROM public.quiz_questions WHERE question_text_en = 'What is the first step in the PPG 9-step painting procedure?'
UNION ALL
SELECT id, 'Checking the surface temperature', 'Vérification de la température de surface', 'Verificación de la temperatura superficial', false FROM public.quiz_questions WHERE question_text_en = 'What is the first step in the PPG 9-step painting procedure?';

-- Q2: What must you do before applying clear coat?
INSERT INTO public.quiz_questions (quiz_id, question_text_en, question_text_fr, question_text_es, explanation_en, explanation_fr, explanation_es, order_index)
SELECT id,
  'What must happen before you apply clear coat over the base coat?',
  'Que faut-il faire avant d''appliquer le vernis sur la couche de base?',
  '¿Qué debe suceder antes de aplicar el barniz sobre la capa base?',
  'The base coat must fully flash off and appear uniformly matte/dull before clear coat is applied. Applying clear over wet base causes defects.',
  'La couche de base doit être complètement séchée et uniformément mate.',
  'La capa base debe estar completamente seca y uniformemente mate.',
  2
FROM public.quizzes WHERE slug = 'ppg-painting-process';

INSERT INTO public.quiz_answers (question_id, answer_text_en, answer_text_fr, answer_text_es, is_correct)
SELECT id, 'The base coat must flash off completely and appear uniformly matte', 'La couche de base doit sécher complètement et apparaître uniformément mate', 'La capa base debe secarse por completo y verse uniformemente mate', true FROM public.quiz_questions WHERE question_text_en = 'What must happen before you apply clear coat over the base coat?'
UNION ALL
SELECT id, 'The base coat should still be slightly wet for adhesion', 'La couche de base doit être encore légèrement humide', 'La capa base debe estar todavía ligeramente húmeda', false FROM public.quiz_questions WHERE question_text_en = 'What must happen before you apply clear coat over the base coat?'
UNION ALL
SELECT id, 'Apply a tack coat of primer first', 'Appliquer d''abord une couche d''apprêt', 'Aplicar primero una capa de imprimador', false FROM public.quiz_questions WHERE question_text_en = 'What must happen before you apply clear coat over the base coat?'
UNION ALL
SELECT id, 'Sand the base coat with P80 grit', 'Poncer la couche de base avec du P80', 'Lijar la capa base con grano P80', false FROM public.quiz_questions WHERE question_text_en = 'What must happen before you apply clear coat over the base coat?';

-- Q3: What grit is used when cutting the clear coat?
INSERT INTO public.quiz_questions (quiz_id, question_text_en, question_text_fr, question_text_es, explanation_en, explanation_fr, explanation_es, order_index)
SELECT id,
  'What grit range is used for wet sanding when cutting the clear coat?',
  'Quelle gamme de grain est utilisée pour le ponçage humide du vernis?',
  '¿Qué rango de grano se usa para lijar en húmedo el barniz?',
  'P1500-P2000 grit is used for wet sanding the clear coat to remove defects before cutting compound and polishing.',
  'Le grain P1500-P2000 est utilisé pour le ponçage humide du vernis.',
  'Se usa grano P1500-P2000 para lijar en húmedo el barniz.',
  3
FROM public.quizzes WHERE slug = 'ppg-painting-process';

INSERT INTO public.quiz_answers (question_id, answer_text_en, answer_text_fr, answer_text_es, is_correct)
SELECT id, 'P1500-P2000', 'P1500-P2000', 'P1500-P2000', true FROM public.quiz_questions WHERE question_text_en = 'What grit range is used for wet sanding when cutting the clear coat?'
UNION ALL
SELECT id, 'P80-P120', 'P80-P120', 'P80-P120', false FROM public.quiz_questions WHERE question_text_en = 'What grit range is used for wet sanding when cutting the clear coat?'
UNION ALL
SELECT id, 'P320-P400', 'P320-P400', 'P320-P400', false FROM public.quiz_questions WHERE question_text_en = 'What grit range is used for wet sanding when cutting the clear coat?'
UNION ALL
SELECT id, 'P600-P800', 'P600-P800', 'P600-P800', false FROM public.quiz_questions WHERE question_text_en = 'What grit range is used for wet sanding when cutting the clear coat?';

-- Q4: What tool is used to check surface temperature?
INSERT INTO public.quiz_questions (quiz_id, question_text_en, question_text_fr, question_text_es, explanation_en, explanation_fr, explanation_es, order_index)
SELECT id,
  'What tool should be used to check surface temperature during the painting process?',
  'Quel outil doit être utilisé pour vérifier la température de surface pendant la peinture?',
  '¿Qué herramienta debe usarse para verificar la temperatura superficial durante la pintura?',
  'An infrared thermometer is used to verify the substrate temperature is within the recommended range for the product being applied.',
  'Un thermomètre infrarouge est utilisé pour vérifier la température du substrat.',
  'Se usa un termómetro infrarrojo para verificar la temperatura del sustrato.',
  4
FROM public.quizzes WHERE slug = 'ppg-painting-process';

INSERT INTO public.quiz_answers (question_id, answer_text_en, answer_text_fr, answer_text_es, is_correct)
SELECT id, 'Infrared thermometer', 'Thermomètre infrarouge', 'Termómetro infrarrojo', true FROM public.quiz_questions WHERE question_text_en = 'What tool should be used to check surface temperature during the painting process?'
UNION ALL
SELECT id, 'Touch test by hand', 'Test tactile à la main', 'Prueba táctil a mano', false FROM public.quiz_questions WHERE question_text_en = 'What tool should be used to check surface temperature during the painting process?'
UNION ALL
SELECT id, 'Moisture meter', 'Hygromètre', 'Medidor de humedad', false FROM public.quiz_questions WHERE question_text_en = 'What tool should be used to check surface temperature during the painting process?'
UNION ALL
SELECT id, 'Paint thickness gauge', 'Jauge d''épaisseur de peinture', 'Medidor de espesor de pintura', false FROM public.quiz_questions WHERE question_text_en = 'What tool should be used to check surface temperature during the painting process?';

-- Q5: What step comes immediately after base coat application?
INSERT INTO public.quiz_questions (quiz_id, question_text_en, question_text_fr, question_text_es, explanation_en, explanation_fr, explanation_es, order_index)
SELECT id,
  'In the PPG painting SOP, what step comes immediately after application of the base coat?',
  'Dans la procédure PPG, quelle étape vient immédiatement après l''application de la couche de base?',
  'En el procedimiento PPG, ¿qué paso viene inmediatamente después de aplicar la capa base?',
  'Step 5 is Flash Off — the base coat must flash completely before the clear coat is applied in Step 6.',
  'L''étape 5 est le séchage — la couche de base doit sécher complètement.',
  'El paso 5 es el secado — la capa base debe secarse completamente.',
  5
FROM public.quizzes WHERE slug = 'ppg-painting-process';

INSERT INTO public.quiz_answers (question_id, answer_text_en, answer_text_fr, answer_text_es, is_correct)
SELECT id, 'Flash off', 'Séchage', 'Secado', true FROM public.quiz_questions WHERE question_text_en = 'In the PPG painting SOP, what step comes immediately after application of the base coat?'
UNION ALL
SELECT id, 'Application of clear coat', 'Application du vernis', 'Aplicación del barniz', false FROM public.quiz_questions WHERE question_text_en = 'In the PPG painting SOP, what step comes immediately after application of the base coat?'
UNION ALL
SELECT id, 'Cutting the clear coat', 'Coupe du vernis', 'Corte del barniz', false FROM public.quiz_questions WHERE question_text_en = 'In the PPG painting SOP, what step comes immediately after application of the base coat?'
UNION ALL
SELECT id, 'Laminating', 'Laminage', 'Laminado', false FROM public.quiz_questions WHERE question_text_en = 'In the PPG painting SOP, what step comes immediately after application of the base coat?';

-- Q6: Why is surface temperature important?
INSERT INTO public.quiz_questions (quiz_id, question_text_en, question_text_fr, question_text_es, explanation_en, explanation_fr, explanation_es, order_index)
SELECT id,
  'Why is checking surface temperature important in the painting process?',
  'Pourquoi la vérification de la température de surface est-elle importante?',
  '¿Por qué es importante verificar la temperatura superficial en el proceso de pintura?',
  'Surface temperature affects flash times, film build, and final appearance. Painting outside the recommended range can cause defects like runs, sags, or poor adhesion.',
  'La température affecte les temps de séchage, l''épaisseur du film et l''apparence finale.',
  'La temperatura afecta los tiempos de secado, el espesor de la película y la apariencia final.',
  6
FROM public.quizzes WHERE slug = 'ppg-painting-process';

INSERT INTO public.quiz_answers (question_id, answer_text_en, answer_text_fr, answer_text_es, is_correct)
SELECT id, 'It affects flash times, film build, and final appearance', 'Elle affecte les temps de séchage, l''épaisseur du film et l''apparence finale', 'Afecta los tiempos de secado, el espesor de la película y la apariencia final', true FROM public.quiz_questions WHERE question_text_en = 'Why is checking surface temperature important in the painting process?'
UNION ALL
SELECT id, 'It determines the colour shade to use', 'Elle détermine la teinte à utiliser', 'Determina el tono de color a usar', false FROM public.quiz_questions WHERE question_text_en = 'Why is checking surface temperature important in the painting process?'
UNION ALL
SELECT id, 'It is only required for insurance documentation', 'C''est uniquement requis pour la documentation d''assurance', 'Solo se requiere para documentación de seguros', false FROM public.quiz_questions WHERE question_text_en = 'Why is checking surface temperature important in the painting process?'
UNION ALL
SELECT id, 'It has no real effect on the paint job', 'Cela n''a aucun effet réel sur la peinture', 'No tiene efecto real en el trabajo de pintura', false FROM public.quiz_questions WHERE question_text_en = 'Why is checking surface temperature important in the painting process?';

-- Q7: What is the final step in the painting SOP?
INSERT INTO public.quiz_questions (quiz_id, question_text_en, question_text_fr, question_text_es, explanation_en, explanation_fr, explanation_es, order_index)
SELECT id,
  'What is the 9th and final step in the PPG painting SOP?',
  'Quelle est la 9e et dernière étape de la procédure de peinture PPG?',
  '¿Cuál es el noveno y último paso en el procedimiento de pintura PPG?',
  'Step 9 is Laminating — applying protective laminate film to freshly painted surfaces where required.',
  'L''étape 9 est le laminage — application d''un film protecteur sur les surfaces fraîchement peintes.',
  'El paso 9 es el laminado — aplicación de película protectora en superficies recién pintadas.',
  7
FROM public.quizzes WHERE slug = 'ppg-painting-process';

INSERT INTO public.quiz_answers (question_id, answer_text_en, answer_text_fr, answer_text_es, is_correct)
SELECT id, 'Laminating', 'Laminage', 'Laminado', true FROM public.quiz_questions WHERE question_text_en = 'What is the 9th and final step in the PPG painting SOP?'
UNION ALL
SELECT id, 'Cutting the clear coat', 'Coupe du vernis', 'Corte del barniz', false FROM public.quiz_questions WHERE question_text_en = 'What is the 9th and final step in the PPG painting SOP?'
UNION ALL
SELECT id, 'Checking the surface temperature', 'Vérification de la température de surface', 'Verificación de la temperatura superficial', false FROM public.quiz_questions WHERE question_text_en = 'What is the 9th and final step in the PPG painting SOP?'
UNION ALL
SELECT id, 'Application of clear coat', 'Application du vernis', 'Aplicación del barniz', false FROM public.quiz_questions WHERE question_text_en = 'What is the 9th and final step in the PPG painting SOP?';


-- ═══════════════════════════════════════════════════════════════
-- VERIFY
-- ═══════════════════════════════════════════════════════════════
SELECT 'Painting SOP document: ' || COUNT(*) FROM public.documents WHERE title LIKE 'PPG SOP: Painting%';
SELECT 'Painting SOP chunks: ' || COUNT(*) FROM public.document_chunks dc JOIN public.documents d ON dc.document_id = d.id WHERE d.title LIKE 'PPG SOP: Painting%';
SELECT 'Painting quiz: ' || COUNT(*) FROM public.quizzes WHERE slug = 'ppg-painting-process';
SELECT 'Painting quiz questions: ' || COUNT(*) FROM public.quiz_questions qq JOIN public.quizzes q ON qq.quiz_id = q.id WHERE q.slug = 'ppg-painting-process';
SELECT 'Painting quiz answers: ' || COUNT(*) FROM public.quiz_answers qa JOIN public.quiz_questions qq ON qa.question_id = qq.id JOIN public.quizzes q ON qq.quiz_id = q.id WHERE q.slug = 'ppg-painting-process';
