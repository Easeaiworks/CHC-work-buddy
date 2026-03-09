-- ═══════════════════════════════════════════════════════════════
-- PPG Envirobase High Performance — Reducer Selection Guide
-- Source: ETB009 Rev. 9/2020 (ppgrefinish.com)
-- Run in Supabase SQL Editor
-- ═══════════════════════════════════════════════════════════════

-- ─── Document: Reducer Selection Guide ─────────────────────────
INSERT INTO public.documents (title, description, doc_type, tab_slug, tags, metadata) VALUES (
  'PPG Envirobase Reducer Selection Guide (ETB009)',
  'PPG Envirobase High Performance reducer selection guide showing which ECR reducer to use based on temperature for both undercoats and clearcoats. Covers ECR65, ECR75, ECR85, and ECR98.',
  'tech_sheet',
  'painting',
  ARRAY['ppg', 'envirobase', 'reducer', 'ECR65', 'ECR75', 'ECR85', 'ECR98', 'clearcoat', 'undercoat', 'temperature', 'selection guide', 'ETB009', 'solvent', 'leveling'],
  '{"full_content": "PPG Envirobase High Performance — Reducer Selection Guide (ETB009 Rev. 9/2020)\n\nThese recommendations are only a general reference and should be used solely as a starting point for choosing the appropriate reducer. Your particular spray environment and job size may require slight adjustments.\n\nUNDERCOAT REDUCERS BY TEMPERATURE:\n• ECR65 — Use for undercoats at 60°F (15°C) to 75°F (24°C)\n• ECR75 — Use for undercoats at 75°F (24°C) to 85°F (29°C)\n• ECR85 — Use for undercoats at 85°F (29°C) to 95°F (35°C)\n\nCLEARCOAT REDUCERS BY TEMPERATURE:\n• ECR65 — Use for clearcoats at 60°F (15°C) to 70°F (21°C)\n• ECR75 — Use for clearcoats at 70°F (21°C) to 80°F (26°C)\n• ECR85 — Use for clearcoats at 80°F (26°C) to 90°F (32°C)\n• ECR98 — Use for clearcoats at 90°F (32°C) to 95°F (35°C)\n\nIMPORTANT TIPS:\n• A higher temp reducer in a clearcoat will allow the surface to stay open longer and provide additional leveling. These reducers used in undercoats perform differently.\n• Consider the job size when selecting the appropriate reducer. Larger jobs may require a higher temp reducer in order to maintain a wet edge.\n• Where there is excessive air flow in the spray area, a higher temp reducer should be considered to minimize the potential for solvent entrapment.\n• ECR98 SHOULD NOT BE USED IN UNDERCOATS.\n\nSource: PPG Industries, Inc. — www.ppgrefinish.com"}'::jsonb
);

-- Insert document chunk for vector search
INSERT INTO public.document_chunks (document_id, chunk_index, content, metadata)
SELECT id, 0,
  'PPG Envirobase Reducer Selection Guide ETB009: Undercoat reducers by temperature - ECR65 for 60-75°F (15-24°C), ECR75 for 75-85°F (24-29°C), ECR85 for 85-95°F (29-35°C). Clearcoat reducers by temperature - ECR65 for 60-70°F (15-21°C), ECR75 for 70-80°F (21-26°C), ECR85 for 80-90°F (26-32°C), ECR98 for 90-95°F (32-35°C). Tips: higher temp reducer in clearcoat allows surface to stay open longer and provides additional leveling. Consider job size - larger jobs may need higher temp reducer to maintain wet edge. Excessive air flow in spray area requires higher temp reducer to minimize solvent entrapment. ECR98 should NOT be used in undercoats.',
  '{"source": "PPG Envirobase ETB009", "type": "tech_sheet", "category": "reducer selection"}'::jsonb
FROM public.documents WHERE title = 'PPG Envirobase Reducer Selection Guide (ETB009)';


-- ═══════════════════════════════════════════════════════════════
-- QUIZ: Envirobase Reducer Selection
-- ═══════════════════════════════════════════════════════════════

INSERT INTO public.quizzes (title_en, title_fr, title_es, description_en, description_fr, description_es, slug, quiz_type, passing_score, is_active)
VALUES (
  'Envirobase Reducer Selection',
  'Sélection de réducteur Envirobase',
  'Selección de reductor Envirobase',
  'Test your knowledge of PPG Envirobase reducer selection — which ECR reducer to use at different temperatures for undercoats and clearcoats.',
  'Testez vos connaissances sur la sélection de réducteur PPG Envirobase.',
  'Evalúa tu conocimiento sobre la selección de reductor PPG Envirobase.',
  'envirobase-reducer-selection',
  'product-knowledge',
  70,
  true
);

-- Q1: Which reducer for undercoats at 65°F?
INSERT INTO public.quiz_questions (quiz_id, question_text_en, question_text_fr, question_text_es, question_type, explanation_en, explanation_fr, explanation_es, question_order)
SELECT id,
  'Which PPG reducer should you use for undercoats when the temperature is 65°F (18°C)?',
  'Quel réducteur PPG devez-vous utiliser pour les sous-couches à 65°F (18°C)?',
  '¿Qué reductor PPG debe usar para subcapas a 65°F (18°C)?',
  'multiple-choice',
  'ECR65 is used for undercoats in the 60°F–75°F (15°C–24°C) temperature range.',
  'ECR65 est utilisé pour les sous-couches dans la plage de 60°F–75°F.',
  'ECR65 se usa para subcapas en el rango de 60°F–75°F.',
  1
FROM public.quizzes WHERE slug = 'envirobase-reducer-selection';

INSERT INTO public.quiz_answers (question_id, answer_text_en, answer_text_fr, answer_text_es, is_correct, answer_order)
SELECT id, 'ECR65', 'ECR65', 'ECR65', true, 1 FROM public.quiz_questions WHERE question_text_en = 'Which PPG reducer should you use for undercoats when the temperature is 65°F (18°C)?'
UNION ALL
SELECT id, 'ECR75', 'ECR75', 'ECR75', false, 2 FROM public.quiz_questions WHERE question_text_en = 'Which PPG reducer should you use for undercoats when the temperature is 65°F (18°C)?'
UNION ALL
SELECT id, 'ECR85', 'ECR85', 'ECR85', false, 3 FROM public.quiz_questions WHERE question_text_en = 'Which PPG reducer should you use for undercoats when the temperature is 65°F (18°C)?'
UNION ALL
SELECT id, 'ECR98', 'ECR98', 'ECR98', false, 4 FROM public.quiz_questions WHERE question_text_en = 'Which PPG reducer should you use for undercoats when the temperature is 65°F (18°C)?';

-- Q2: Which reducer should NEVER be used in undercoats?
INSERT INTO public.quiz_questions (quiz_id, question_text_en, question_text_fr, question_text_es, question_type, explanation_en, explanation_fr, explanation_es, question_order)
SELECT id,
  'Which PPG reducer should NEVER be used in undercoats?',
  'Quel réducteur PPG ne doit JAMAIS être utilisé dans les sous-couches?',
  '¿Qué reductor PPG NUNCA debe usarse en subcapas?',
  'multiple-choice',
  'ECR98 should NOT be used in undercoats — it is only for clearcoat applications at high temperatures (90°F–95°F).',
  'ECR98 ne doit PAS être utilisé dans les sous-couches.',
  'ECR98 NO debe usarse en subcapas.',
  2
FROM public.quizzes WHERE slug = 'envirobase-reducer-selection';

INSERT INTO public.quiz_answers (question_id, answer_text_en, answer_text_fr, answer_text_es, is_correct, answer_order)
SELECT id, 'ECR98', 'ECR98', 'ECR98', true, 1 FROM public.quiz_questions WHERE question_text_en = 'Which PPG reducer should NEVER be used in undercoats?'
UNION ALL
SELECT id, 'ECR65', 'ECR65', 'ECR65', false, 2 FROM public.quiz_questions WHERE question_text_en = 'Which PPG reducer should NEVER be used in undercoats?'
UNION ALL
SELECT id, 'ECR75', 'ECR75', 'ECR75', false, 3 FROM public.quiz_questions WHERE question_text_en = 'Which PPG reducer should NEVER be used in undercoats?'
UNION ALL
SELECT id, 'ECR85', 'ECR85', 'ECR85', false, 4 FROM public.quiz_questions WHERE question_text_en = 'Which PPG reducer should NEVER be used in undercoats?';

-- Q3: Clearcoat at 85°F?
INSERT INTO public.quiz_questions (quiz_id, question_text_en, question_text_fr, question_text_es, question_type, explanation_en, explanation_fr, explanation_es, question_order)
SELECT id,
  'Which reducer is recommended for clearcoat application at 85°F (29°C)?',
  'Quel réducteur est recommandé pour le vernis à 85°F (29°C)?',
  '¿Qué reductor se recomienda para barniz a 85°F (29°C)?',
  'multiple-choice',
  'ECR85 is used for clearcoats in the 80°F–90°F (26°C–32°C) range.',
  'ECR85 est utilisé pour les vernis dans la plage de 80°F–90°F.',
  'ECR85 se usa para barniz en el rango de 80°F–90°F.',
  3
FROM public.quizzes WHERE slug = 'envirobase-reducer-selection';

INSERT INTO public.quiz_answers (question_id, answer_text_en, answer_text_fr, answer_text_es, is_correct, answer_order)
SELECT id, 'ECR85', 'ECR85', 'ECR85', true, 1 FROM public.quiz_questions WHERE question_text_en = 'Which reducer is recommended for clearcoat application at 85°F (29°C)?'
UNION ALL
SELECT id, 'ECR65', 'ECR65', 'ECR65', false, 2 FROM public.quiz_questions WHERE question_text_en = 'Which reducer is recommended for clearcoat application at 85°F (29°C)?'
UNION ALL
SELECT id, 'ECR75', 'ECR75', 'ECR75', false, 3 FROM public.quiz_questions WHERE question_text_en = 'Which reducer is recommended for clearcoat application at 85°F (29°C)?'
UNION ALL
SELECT id, 'ECR98', 'ECR98', 'ECR98', false, 4 FROM public.quiz_questions WHERE question_text_en = 'Which reducer is recommended for clearcoat application at 85°F (29°C)?';

-- Q4: Why use a higher temp reducer?
INSERT INTO public.quiz_questions (quiz_id, question_text_en, question_text_fr, question_text_es, question_type, explanation_en, explanation_fr, explanation_es, question_order)
SELECT id,
  'What is the benefit of using a higher temperature reducer in clearcoat?',
  'Quel est l''avantage d''utiliser un réducteur à plus haute température dans le vernis?',
  '¿Cuál es el beneficio de usar un reductor de mayor temperatura en el barniz?',
  'multiple-choice',
  'A higher temp reducer in a clearcoat allows the surface to stay open longer and provides additional leveling for a smoother finish.',
  'Un réducteur à plus haute température permet à la surface de rester ouverte plus longtemps et offre un meilleur nivellement.',
  'Un reductor de mayor temperatura permite que la superficie permanezca abierta más tiempo y proporciona un mejor nivelado.',
  4
FROM public.quizzes WHERE slug = 'envirobase-reducer-selection';

INSERT INTO public.quiz_answers (question_id, answer_text_en, answer_text_fr, answer_text_es, is_correct, answer_order)
SELECT id, 'It allows the surface to stay open longer and provides additional leveling', 'Il permet à la surface de rester ouverte plus longtemps et offre un meilleur nivellement', 'Permite que la superficie permanezca abierta más tiempo y proporciona mejor nivelado', true, 1 FROM public.quiz_questions WHERE question_text_en = 'What is the benefit of using a higher temperature reducer in clearcoat?'
UNION ALL
SELECT id, 'It makes the clearcoat dry faster', 'Il fait sécher le vernis plus rapidement', 'Hace que el barniz seque más rápido', false, 2 FROM public.quiz_questions WHERE question_text_en = 'What is the benefit of using a higher temperature reducer in clearcoat?'
UNION ALL
SELECT id, 'It reduces the amount of clearcoat needed', 'Il réduit la quantité de vernis nécessaire', 'Reduce la cantidad de barniz necesaria', false, 3 FROM public.quiz_questions WHERE question_text_en = 'What is the benefit of using a higher temperature reducer in clearcoat?'
UNION ALL
SELECT id, 'It changes the color of the clearcoat', 'Il change la couleur du vernis', 'Cambia el color del barniz', false, 4 FROM public.quiz_questions WHERE question_text_en = 'What is the benefit of using a higher temperature reducer in clearcoat?';

-- Q5: Larger jobs require what?
INSERT INTO public.quiz_questions (quiz_id, question_text_en, question_text_fr, question_text_es, question_type, explanation_en, explanation_fr, explanation_es, question_order)
SELECT id,
  'When spraying a larger job, what adjustment should you consider for reducer selection?',
  'Lors de la pulvérisation d''un travail plus important, quel ajustement devez-vous considérer?',
  '¿Qué ajuste debe considerar al pulverizar un trabajo más grande?',
  'multiple-choice',
  'Larger jobs may require a higher temp reducer in order to maintain a "wet" edge across the larger surface area.',
  'Les travaux plus importants peuvent nécessiter un réducteur à plus haute température pour maintenir un bord humide.',
  'Los trabajos más grandes pueden requerir un reductor de mayor temperatura para mantener un borde húmedo.',
  5
FROM public.quizzes WHERE slug = 'envirobase-reducer-selection';

INSERT INTO public.quiz_answers (question_id, answer_text_en, answer_text_fr, answer_text_es, is_correct, answer_order)
SELECT id, 'Use a higher temp reducer to maintain a wet edge', 'Utiliser un réducteur à plus haute température pour maintenir un bord humide', 'Usar un reductor de mayor temperatura para mantener un borde húmedo', true, 1 FROM public.quiz_questions WHERE question_text_en = 'When spraying a larger job, what adjustment should you consider for reducer selection?'
UNION ALL
SELECT id, 'Use a lower temp reducer to speed up drying', 'Utiliser un réducteur à plus basse température pour accélérer le séchage', 'Usar un reductor de menor temperatura para acelerar el secado', false, 2 FROM public.quiz_questions WHERE question_text_en = 'When spraying a larger job, what adjustment should you consider for reducer selection?'
UNION ALL
SELECT id, 'Use no reducer at all', 'N''utiliser aucun réducteur', 'No usar ningún reductor', false, 3 FROM public.quiz_questions WHERE question_text_en = 'When spraying a larger job, what adjustment should you consider for reducer selection?'
UNION ALL
SELECT id, 'Mix two different reducers together', 'Mélanger deux réducteurs différents', 'Mezclar dos reductores diferentes', false, 4 FROM public.quiz_questions WHERE question_text_en = 'When spraying a larger job, what adjustment should you consider for reducer selection?';

-- Q6: Excessive air flow?
INSERT INTO public.quiz_questions (quiz_id, question_text_en, question_text_fr, question_text_es, question_type, explanation_en, explanation_fr, explanation_es, question_order)
SELECT id,
  'When there is excessive air flow in the spray area, what should you do with reducer selection?',
  'Lorsqu''il y a un flux d''air excessif dans la zone de pulvérisation, que devez-vous faire?',
  '¿Qué debe hacer con la selección de reductor cuando hay flujo de aire excesivo?',
  'multiple-choice',
  'A higher temp reducer should be considered to minimize the potential for solvent entrapment when there is excessive air flow.',
  'Un réducteur à plus haute température doit être envisagé pour minimiser le risque de piégeage de solvant.',
  'Se debe considerar un reductor de mayor temperatura para minimizar el riesgo de atrapamiento de solvente.',
  6
FROM public.quizzes WHERE slug = 'envirobase-reducer-selection';

INSERT INTO public.quiz_answers (question_id, answer_text_en, answer_text_fr, answer_text_es, is_correct, answer_order)
SELECT id, 'Use a higher temp reducer to minimize solvent entrapment', 'Utiliser un réducteur à plus haute température pour minimiser le piégeage de solvant', 'Usar un reductor de mayor temperatura para minimizar atrapamiento de solvente', true, 1 FROM public.quiz_questions WHERE question_text_en = 'When there is excessive air flow in the spray area, what should you do with reducer selection?'
UNION ALL
SELECT id, 'Use a lower temp reducer to compensate', 'Utiliser un réducteur à plus basse température pour compenser', 'Usar un reductor de menor temperatura para compensar', false, 2 FROM public.quiz_questions WHERE question_text_en = 'When there is excessive air flow in the spray area, what should you do with reducer selection?'
UNION ALL
SELECT id, 'Turn off all ventilation before spraying', 'Éteindre toute ventilation avant la pulvérisation', 'Apagar toda la ventilación antes de pulverizar', false, 3 FROM public.quiz_questions WHERE question_text_en = 'When there is excessive air flow in the spray area, what should you do with reducer selection?'
UNION ALL
SELECT id, 'Add extra hardener instead', 'Ajouter du durcisseur supplémentaire', 'Agregar endurecedor adicional', false, 4 FROM public.quiz_questions WHERE question_text_en = 'When there is excessive air flow in the spray area, what should you do with reducer selection?';


-- ═══════════════════════════════════════════════════════════════
-- VERIFY
-- ═══════════════════════════════════════════════════════════════
SELECT 'Reducer guide document: ' || COUNT(*) FROM public.documents WHERE title LIKE '%Reducer Selection Guide%';
SELECT 'Reducer guide chunks: ' || COUNT(*) FROM public.document_chunks dc JOIN public.documents d ON dc.document_id = d.id WHERE d.title LIKE '%Reducer Selection Guide%';
SELECT 'Reducer quiz: ' || COUNT(*) FROM public.quizzes WHERE slug = 'envirobase-reducer-selection';
SELECT 'Reducer quiz questions: ' || COUNT(*) FROM public.quiz_questions qq JOIN public.quizzes q ON qq.quiz_id = q.id WHERE q.slug = 'envirobase-reducer-selection';
SELECT 'Reducer quiz answers: ' || COUNT(*) FROM public.quiz_answers qa JOIN public.quiz_questions qq ON qa.question_id = qq.id JOIN public.quizzes q ON qq.quiz_id = q.id WHERE q.slug = 'envirobase-reducer-selection';
