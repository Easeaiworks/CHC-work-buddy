-- Seed data: Learning tab — troubleshooting guides, quizzes, and reference documents
-- Run AFTER 003_learning_schema.sql

-- ═══════════════════════════════════════════════════════════════
-- TROUBLESHOOTING GUIDES
-- ═══════════════════════════════════════════════════════════════

INSERT INTO public.troubleshooting_guides (slug, title_en, title_fr, title_es, description_en, description_fr, description_es, category, icon, node_tree) VALUES

-- ─── Guide 1: Paint Defect Diagnosis ────────────────────────
('paint-defect-diagnosis',
 'Paint Defect Diagnosis',
 'Diagnostic des défauts de peinture',
 'Diagnóstico de defectos de pintura',
 'Identify and fix common paint defects step by step',
 'Identifiez et corrigez les défauts de peinture courants étape par étape',
 'Identifique y corrija defectos comunes de pintura paso a paso',
 'paint-defects', '🎨',
 '[
  {"id":"root","type":"question","text":{"en":"What paint defect do you see?","fr":"Quel défaut de peinture voyez-vous?","es":"¿Qué defecto de pintura ve?"},"options":[
    {"label":{"en":"Orange Peel (bumpy texture)","fr":"Peau d''orange (texture bosselée)","es":"Cáscara de naranja (textura irregular)"},"next":"orange-peel"},
    {"label":{"en":"Runs or Sags (drips)","fr":"Coulures (gouttes)","es":"Chorreos o descolgados"},"next":"runs-sags"},
    {"label":{"en":"Fish Eyes (craters)","fr":"Yeux de poisson (cratères)","es":"Ojos de pez (cráteres)"},"next":"fish-eye"},
    {"label":{"en":"Dry Spray (rough/dusty)","fr":"Pulvérisation sèche (rugueux/poussiéreux)","es":"Spray seco (áspero/polvoriento)"},"next":"dry-spray"}
  ]},
  {"id":"orange-peel","type":"question","text":{"en":"When does the orange peel appear?","fr":"Quand la peau d''orange apparaît-elle?","es":"¿Cuándo aparece la cáscara de naranja?"},"options":[
    {"label":{"en":"Immediately after spraying","fr":"Immédiatement après la pulvérisation","es":"Inmediatamente después de pulverizar"},"next":"op-immediate"},
    {"label":{"en":"After the paint dries","fr":"Après le séchage de la peinture","es":"Después de que la pintura se seca"},"next":"op-after-dry"}
  ]},
  {"id":"op-immediate","type":"diagnosis","text":{"en":"Likely caused by incorrect spray settings or environment","fr":"Probablement causé par des réglages de pulvérisation incorrects ou l''environnement","es":"Probablemente causado por ajustes de pulverización incorrectos o el entorno"},"steps":[
    {"en":"Check gun pressure — should be 26-29 PSI at the cap for HVLP","fr":"Vérifiez la pression du pistolet — devrait être 26-29 PSI au bec pour HVLP","es":"Verifique la presión de la pistola — debe ser 26-29 PSI en la tapa para HVLP"},
    {"en":"Increase fluid flow slightly","fr":"Augmentez légèrement le débit de fluide","es":"Aumente ligeramente el flujo de fluido"},
    {"en":"Slow down your pass speed — maintain 6-8 inches from surface","fr":"Ralentissez votre vitesse de passe — maintenez 15-20 cm de la surface","es":"Reduzca la velocidad de pasada — mantenga 15-20 cm de la superficie"},
    {"en":"Check booth temperature — should be 65-75°F (18-24°C)","fr":"Vérifiez la température de la cabine — devrait être 18-24°C","es":"Verifique la temperatura de la cabina — debe ser 18-24°C"},
    {"en":"Consider a slower reducer for hot conditions","fr":"Envisagez un diluant plus lent pour les conditions chaudes","es":"Considere un reductor más lento para condiciones calientes"}
  ]},
  {"id":"op-after-dry","type":"diagnosis","text":{"en":"Orange peel appearing after drying is usually a reducer or flash time issue","fr":"La peau d''orange apparaissant après séchage est généralement un problème de diluant ou de temps d''évaporation","es":"La cáscara de naranja que aparece después del secado suele ser un problema de reductor o tiempo de evaporación"},"steps":[
    {"en":"Use a slower reducer — the solvent is flashing off too quickly","fr":"Utilisez un diluant plus lent — le solvant s''évapore trop rapidement","es":"Use un reductor más lento — el solvente se evapora demasiado rápido"},
    {"en":"Allow proper flash time between coats (per TDS)","fr":"Permettez un temps d''évaporation approprié entre les couches (selon FTP)","es":"Permita el tiempo de evaporación adecuado entre capas (según FTP)"},
    {"en":"Sand with P1500-P2000, compound and polish to remove mild orange peel","fr":"Poncez avec P1500-P2000, polissez pour enlever la légère peau d''orange","es":"Lije con P1500-P2000, pula y abrillante para eliminar cáscara de naranja leve"},
    {"en":"If severe, sand back to base and respray","fr":"Si sévère, poncez jusqu''à la base et repulvérisez","es":"Si es severo, lije hasta la base y vuelva a pulverizar"}
  ]},
  {"id":"runs-sags","type":"question","text":{"en":"Where are the runs occurring?","fr":"Où les coulures se produisent-elles?","es":"¿Dónde ocurren los chorreos?"},"options":[
    {"label":{"en":"On vertical panels (doors, fenders)","fr":"Sur les panneaux verticaux (portes, ailes)","es":"En paneles verticales (puertas, guardabarros)"},"next":"runs-vertical"},
    {"label":{"en":"On edges and body lines","fr":"Sur les bords et les lignes de carrosserie","es":"En bordes y líneas de carrocería"},"next":"runs-edges"}
  ]},
  {"id":"runs-vertical","type":"diagnosis","text":{"en":"Runs on vertical panels — too much material or wrong technique","fr":"Coulures sur panneaux verticaux — trop de matériau ou mauvaise technique","es":"Chorreos en paneles verticales — demasiado material o técnica incorrecta"},"steps":[
    {"en":"Reduce fluid flow on the gun","fr":"Réduisez le débit de fluide sur le pistolet","es":"Reduzca el flujo de fluido en la pistola"},
    {"en":"Increase pass speed — you are moving too slowly","fr":"Augmentez la vitesse de passe — vous bougez trop lentement","es":"Aumente la velocidad de pasada — se mueve demasiado lento"},
    {"en":"Apply thinner coats with more flash time between","fr":"Appliquez des couches plus fines avec plus de temps d''évaporation entre elles","es":"Aplique capas más finas con más tiempo de evaporación entre ellas"},
    {"en":"To fix: let dry fully, sand with P800, and respray the area","fr":"Pour corriger: laissez sécher complètement, poncez avec P800, et repulvérisez la zone","es":"Para corregir: deje secar completamente, lije con P800 y vuelva a pulverizar el área"}
  ]},
  {"id":"runs-edges","type":"diagnosis","text":{"en":"Runs on edges — material building up at body lines","fr":"Coulures sur les bords — accumulation de matériau sur les lignes de carrosserie","es":"Chorreos en bordes — acumulación de material en líneas de carrocería"},"steps":[
    {"en":"Trigger off before reaching the edge of the panel","fr":"Relâchez la gâchette avant d''atteindre le bord du panneau","es":"Suelte el gatillo antes de llegar al borde del panel"},
    {"en":"Reduce pattern width for edges and tight areas","fr":"Réduisez la largeur du jet pour les bords et les zones étroites","es":"Reduzca el ancho del patrón para bordes y áreas estrechas"},
    {"en":"Use a 50% overlap technique, not full wet-on-wet on edges","fr":"Utilisez une technique de chevauchement de 50%, pas mouillé sur mouillé complet sur les bords","es":"Use una técnica de superposición del 50%, no húmedo sobre húmedo completo en bordes"}
  ]},
  {"id":"fish-eye","type":"diagnosis","text":{"en":"Fish eyes are caused by silicone or oil contamination on the surface","fr":"Les yeux de poisson sont causés par une contamination au silicone ou à l''huile sur la surface","es":"Los ojos de pez son causados por contaminación de silicona o aceite en la superficie"},"steps":[
    {"en":"STOP spraying immediately","fr":"ARRÊTEZ de pulvériser immédiatement","es":"DEJE de pulverizar inmediatamente"},
    {"en":"Sand the affected area back to bare substrate","fr":"Poncez la zone affectée jusqu''au substrat nu","es":"Lije el área afectada hasta el sustrato desnudo"},
    {"en":"Clean thoroughly with wax & grease remover — wipe wet, then dry","fr":"Nettoyez soigneusement avec un dégraissant — essuyez mouillé, puis sec","es":"Limpie a fondo con removedor de cera y grasa — limpie húmedo, luego seco"},
    {"en":"Check air lines for oil contamination — replace filters","fr":"Vérifiez les conduites d''air pour contamination par l''huile — remplacez les filtres","es":"Verifique las líneas de aire por contaminación de aceite — reemplace los filtros"},
    {"en":"Add fish eye eliminator to your paint as a preventive measure","fr":"Ajoutez un éliminateur d''yeux de poisson à votre peinture comme mesure préventive","es":"Agregue eliminador de ojos de pez a su pintura como medida preventiva"},
    {"en":"Ensure all rags are silicone-free","fr":"Assurez-vous que tous les chiffons sont sans silicone","es":"Asegúrese de que todos los trapos estén libres de silicona"}
  ]},
  {"id":"dry-spray","type":"diagnosis","text":{"en":"Dry spray — paint is not flowing and leveling properly","fr":"Pulvérisation sèche — la peinture ne coule pas et ne se nivelle pas correctement","es":"Spray seco — la pintura no fluye ni se nivela correctamente"},"steps":[
    {"en":"Move closer to the surface — you are likely too far (should be 6-8 inches)","fr":"Rapprochez-vous de la surface — vous êtes probablement trop loin (devrait être 15-20 cm)","es":"Acérquese a la superficie — probablemente está demasiado lejos (debe ser 15-20 cm)"},
    {"en":"Increase fluid flow on the gun","fr":"Augmentez le débit de fluide sur le pistolet","es":"Aumente el flujo de fluido en la pistola"},
    {"en":"Slow down your pass speed","fr":"Ralentissez votre vitesse de passe","es":"Reduzca la velocidad de pasada"},
    {"en":"Check that reducer ratio is correct per TDS","fr":"Vérifiez que le rapport de diluant est correct selon la FTP","es":"Verifique que la proporción de reductor sea correcta según la FTP"},
    {"en":"If booth humidity is very low (<30%), use a slower reducer","fr":"Si l''humidité de la cabine est très basse (<30%), utilisez un diluant plus lent","es":"Si la humedad de la cabina es muy baja (<30%), use un reductor más lento"}
  ]}
]'::jsonb),

-- ─── Guide 2: Spray Booth Issues ────────────────────────────
('spray-booth-issues',
 'Spray Booth Troubleshooting',
 'Dépannage de la cabine de pulvérisation',
 'Solución de problemas de cabina de pintura',
 'Diagnose and resolve common spray booth problems',
 'Diagnostiquez et résolvez les problèmes courants de la cabine de pulvérisation',
 'Diagnostique y resuelva problemas comunes de la cabina de pintura',
 'spray-booth', '🏭',
 '[
  {"id":"root","type":"question","text":{"en":"What booth issue are you experiencing?","fr":"Quel problème de cabine rencontrez-vous?","es":"¿Qué problema de cabina está experimentando?"},"options":[
    {"label":{"en":"Poor airflow / ventilation","fr":"Mauvais flux d''air / ventilation","es":"Flujo de aire deficiente / ventilación"},"next":"airflow"},
    {"label":{"en":"Contamination in finish","fr":"Contamination dans la finition","es":"Contaminación en el acabado"},"next":"contamination"},
    {"label":{"en":"Temperature problems","fr":"Problèmes de température","es":"Problemas de temperatura"},"next":"temperature"},
    {"label":{"en":"Lighting issues","fr":"Problèmes d''éclairage","es":"Problemas de iluminación"},"next":"lighting"}
  ]},
  {"id":"airflow","type":"question","text":{"en":"What is the airflow symptom?","fr":"Quel est le symptôme du flux d''air?","es":"¿Cuál es el síntoma del flujo de aire?"},"options":[
    {"label":{"en":"Overspray not clearing","fr":"La surpulvérisation ne se dissipe pas","es":"La sobreaspersión no se disipa"},"next":"airflow-overspray"},
    {"label":{"en":"Dust settling on wet paint","fr":"Poussière se déposant sur la peinture humide","es":"Polvo asentándose en pintura húmeda"},"next":"airflow-dust"}
  ]},
  {"id":"airflow-overspray","type":"diagnosis","text":{"en":"Overspray not clearing indicates insufficient exhaust or intake imbalance","fr":"La surpulvérisation qui ne se dissipe pas indique un échappement insuffisant ou un déséquilibre d''admission","es":"La sobreaspersión que no se disipa indica escape insuficiente o desequilibrio de admisión"},"steps":[
    {"en":"Check exhaust filters — replace if clogged (should be replaced every 50-100 spray hours)","fr":"Vérifiez les filtres d''échappement — remplacez si bouchés (à remplacer toutes les 50-100 heures de pulvérisation)","es":"Verifique los filtros de escape — reemplace si están obstruidos (reemplazar cada 50-100 horas de pulverización)"},
    {"en":"Check intake filters — dirty intake reduces positive pressure","fr":"Vérifiez les filtres d''admission — une admission sale réduit la pression positive","es":"Verifique los filtros de admisión — la admisión sucia reduce la presión positiva"},
    {"en":"Verify exhaust fan belt tension and motor operation","fr":"Vérifiez la tension de la courroie du ventilateur d''échappement et le fonctionnement du moteur","es":"Verifique la tensión de la correa del ventilador de escape y el funcionamiento del motor"},
    {"en":"Check for booth door seal leaks — door gaskets wear over time","fr":"Vérifiez les fuites des joints de porte de cabine — les joints de porte s''usent avec le temps","es":"Verifique fugas en los sellos de la puerta de la cabina — los empaques se desgastan con el tiempo"}
  ]},
  {"id":"airflow-dust","type":"diagnosis","text":{"en":"Dust in wet paint means contaminated air entering the booth","fr":"La poussière dans la peinture humide signifie que de l''air contaminé entre dans la cabine","es":"Polvo en pintura húmeda significa que aire contaminado entra en la cabina"},"steps":[
    {"en":"Replace ceiling intake filters immediately","fr":"Remplacez immédiatement les filtres d''admission du plafond","es":"Reemplace los filtros de admisión del techo inmediatamente"},
    {"en":"Check for gaps or tears in ceiling filter media","fr":"Vérifiez les espaces ou déchirures dans le média du filtre de plafond","es":"Verifique espacios o rasgaduras en el medio filtrante del techo"},
    {"en":"Clean the booth thoroughly before next job — walls, floor, grates","fr":"Nettoyez la cabine à fond avant le prochain travail — murs, sol, grilles","es":"Limpie la cabina a fondo antes del próximo trabajo — paredes, piso, rejillas"},
    {"en":"Blow off the vehicle with clean compressed air before painting","fr":"Soufflez le véhicule avec de l''air comprimé propre avant de peindre","es":"Sople el vehículo con aire comprimido limpio antes de pintar"},
    {"en":"Wear a lint-free paint suit and use a tack cloth on the surface","fr":"Portez une combinaison de peinture sans peluches et utilisez un chiffon collant sur la surface","es":"Use un traje de pintura sin pelusa y use un paño adherente en la superficie"}
  ]},
  {"id":"contamination","type":"diagnosis","text":{"en":"Contamination in the finish can come from multiple sources","fr":"La contamination dans la finition peut provenir de plusieurs sources","es":"La contaminación en el acabado puede provenir de múltiples fuentes"},"steps":[
    {"en":"Check compressed air supply — drain the water trap and test with a white cloth","fr":"Vérifiez l''alimentation en air comprimé — vidangez le piège à eau et testez avec un chiffon blanc","es":"Verifique el suministro de aire comprimido — drene la trampa de agua y pruebe con un paño blanco"},
    {"en":"Inspect air line filters and replace desiccant if needed","fr":"Inspectez les filtres de la ligne d''air et remplacez le dessiccant si nécessaire","es":"Inspeccione los filtros de la línea de aire y reemplace el desecante si es necesario"},
    {"en":"Wax and grease remove the entire panel — wipe on, wipe off while still wet","fr":"Dégraissez tout le panneau — appliquez, essuyez pendant que c''est encore humide","es":"Remueva cera y grasa de todo el panel — aplique, limpie mientras aún está húmedo"},
    {"en":"Check for silicone sources: hand lotion, certain shop rags, tire dressing","fr":"Vérifiez les sources de silicone: lotion pour les mains, certains chiffons d''atelier, dressing de pneus","es":"Verifique fuentes de silicona: loción de manos, ciertos trapos de taller, abrillantador de llantas"}
  ]},
  {"id":"temperature","type":"diagnosis","text":{"en":"Temperature issues affect paint flow, flash times, and cure","fr":"Les problèmes de température affectent l''écoulement de la peinture, les temps d''évaporation et le durcissement","es":"Los problemas de temperatura afectan el flujo de pintura, tiempos de evaporación y curado"},"steps":[
    {"en":"Ideal spray temperature: 65-75°F (18-24°C)","fr":"Température de pulvérisation idéale: 18-24°C","es":"Temperatura ideal de pulverización: 18-24°C"},
    {"en":"Too hot (>80°F): Use slower reducer, may get dry spray or orange peel","fr":"Trop chaud (>27°C): Utilisez un diluant plus lent, peut causer pulvérisation sèche ou peau d''orange","es":"Demasiado caliente (>27°C): Use reductor más lento, puede causar spray seco o cáscara de naranja"},
    {"en":"Too cold (<60°F): Paint won''t flow properly, longer dry times, risk of solvent pop","fr":"Trop froid (<16°C): La peinture ne coulera pas correctement, temps de séchage plus longs, risque d''éclatement de solvant","es":"Demasiado frío (<16°C): La pintura no fluirá correctamente, tiempos de secado más largos, riesgo de estallido de solvente"},
    {"en":"Allow paint materials to acclimate to booth temperature before mixing","fr":"Laissez les matériaux de peinture s''acclimater à la température de la cabine avant le mélange","es":"Permita que los materiales de pintura se aclimaten a la temperatura de la cabina antes de mezclar"},
    {"en":"Check booth heater thermostat calibration if temperature is inconsistent","fr":"Vérifiez la calibration du thermostat du chauffage de la cabine si la température est incohérente","es":"Verifique la calibración del termostato del calentador de la cabina si la temperatura es inconsistente"}
  ]},
  {"id":"lighting","type":"diagnosis","text":{"en":"Proper booth lighting is critical for defect detection","fr":"Un éclairage de cabine adéquat est essentiel pour la détection des défauts","es":"La iluminación adecuada de la cabina es crítica para la detección de defectos"},"steps":[
    {"en":"Minimum 100 foot-candles at the work surface per OSHA","fr":"Minimum 100 pieds-bougies à la surface de travail selon l''OSHA","es":"Mínimo 100 pies-candela en la superficie de trabajo según OSHA"},
    {"en":"Use explosion-proof LED fixtures rated for Class I, Division 1","fr":"Utilisez des luminaires LED antidéflagrants classés pour Classe I, Division 1","es":"Use luminarias LED a prueba de explosión clasificadas para Clase I, División 1"},
    {"en":"Replace any flickering or dim tubes — color accuracy matters","fr":"Remplacez tout tube clignotant ou faible — la précision des couleurs compte","es":"Reemplace cualquier tubo parpadeante o tenue — la precisión del color importa"},
    {"en":"Clean light covers regularly — overspray buildup reduces output significantly","fr":"Nettoyez régulièrement les couvercles des lumières — l''accumulation de surpulvérisation réduit significativement la sortie","es":"Limpie las cubiertas de luz regularmente — la acumulación de sobreaspersión reduce significativamente la salida"}
  ]}
]'::jsonb),

-- ─── Guide 3: Mixing & Product Handling ─────────────────────
('mixing-product-handling',
 'Mixing Ratios & Product Handling',
 'Ratios de mélange et manipulation des produits',
 'Proporciones de mezcla y manejo de productos',
 'Quick reference for mixing ratios, pot life, and flash times',
 'Référence rapide pour les ratios de mélange, la durée de vie en pot et les temps d''évaporation',
 'Referencia rápida para proporciones de mezcla, vida útil y tiempos de evaporación',
 'mixing', '⚗️',
 '[
  {"id":"root","type":"question","text":{"en":"What product are you working with?","fr":"Avec quel produit travaillez-vous?","es":"¿Con qué producto está trabajando?"},"options":[
    {"label":{"en":"Primer / Primer Surfacer","fr":"Apprêt / Apprêt surfacer","es":"Imprimación / Aparejo"},"next":"primer"},
    {"label":{"en":"Base Coat (color)","fr":"Couche de base (couleur)","es":"Capa base (color)"},"next":"basecoat"},
    {"label":{"en":"Clear Coat","fr":"Vernis","es":"Barniz transparente"},"next":"clearcoat"},
    {"label":{"en":"Body Filler / Bondo","fr":"Mastic / Bondo","es":"Masilla / Bondo"},"next":"filler"}
  ]},
  {"id":"primer","type":"diagnosis","text":{"en":"Primer / Primer Surfacer — typical mixing and application guide","fr":"Apprêt / Apprêt surfacer — guide de mélange et d''application typique","es":"Imprimación / Aparejo — guía típica de mezcla y aplicación"},"steps":[
    {"en":"Mixing ratio: 4:1:1 (primer : hardener : reducer) — always check your TDS","fr":"Ratio de mélange: 4:1:1 (apprêt : durcisseur : diluant) — vérifiez toujours votre FTP","es":"Proporción de mezcla: 4:1:1 (imprimación : endurecedor : reductor) — siempre verifique su FTP"},
    {"en":"Pot life: 30-45 minutes once mixed","fr":"Durée de vie en pot: 30-45 minutes une fois mélangé","es":"Vida útil: 30-45 minutos una vez mezclado"},
    {"en":"Apply 2-3 medium wet coats","fr":"Appliquez 2-3 couches moyennement humides","es":"Aplique 2-3 capas medio húmedas"},
    {"en":"Flash time between coats: 5-10 minutes","fr":"Temps d''évaporation entre les couches: 5-10 minutes","es":"Tiempo de evaporación entre capas: 5-10 minutos"},
    {"en":"Dry to sand: 30-60 min air dry, or 15-20 min bake at 140°F (60°C)","fr":"Sec à poncer: 30-60 min séchage à l''air, ou 15-20 min cuisson à 60°C","es":"Seco para lijar: 30-60 min secado al aire, o 15-20 min horneado a 60°C"},
    {"en":"Sand with P320-P400 before base coat application","fr":"Poncez avec P320-P400 avant l''application de la couche de base","es":"Lije con P320-P400 antes de aplicar la capa base"}
  ]},
  {"id":"basecoat","type":"diagnosis","text":{"en":"Base Coat — mixing and application guide","fr":"Couche de base — guide de mélange et d''application","es":"Capa base — guía de mezcla y aplicación"},"steps":[
    {"en":"Mixing ratio: varies by manufacturer — typically ready-to-spray or add reducer per TDS","fr":"Ratio de mélange: varie selon le fabricant — généralement prêt à pulvériser ou ajouter du diluant selon FTP","es":"Proporción de mezcla: varía según fabricante — típicamente listo para pulverizar o agregar reductor según FTP"},
    {"en":"Apply 2-3 coats for full coverage and hide","fr":"Appliquez 2-3 couches pour une couverture et une opacité complètes","es":"Aplique 2-3 capas para cobertura completa y ocultación"},
    {"en":"Flash time: 5-15 minutes between coats (until matte/dull appearance)","fr":"Temps d''évaporation: 5-15 minutes entre les couches (jusqu''à apparence mate/terne)","es":"Tiempo de evaporación: 5-15 minutos entre capas (hasta apariencia mate/opaca)"},
    {"en":"Check for full hide under booth lights before clearing","fr":"Vérifiez la couverture complète sous les lumières de la cabine avant de vernir","es":"Verifique la cobertura completa bajo las luces de la cabina antes de barnizar"},
    {"en":"Apply clear coat within the recoat window (usually 30-90 min)","fr":"Appliquez le vernis dans la fenêtre de recouvrement (généralement 30-90 min)","es":"Aplique barniz dentro de la ventana de repintado (generalmente 30-90 min)"}
  ]},
  {"id":"clearcoat","type":"diagnosis","text":{"en":"Clear Coat — mixing and application guide","fr":"Vernis — guide de mélange et d''application","es":"Barniz transparente — guía de mezcla y aplicación"},"steps":[
    {"en":"Mixing ratio: 2:1 (clear : hardener) — some products require reducer","fr":"Ratio de mélange: 2:1 (vernis : durcisseur) — certains produits nécessitent du diluant","es":"Proporción de mezcla: 2:1 (barniz : endurecedor) — algunos productos requieren reductor"},
    {"en":"Pot life: 20-30 minutes — mix only what you need","fr":"Durée de vie en pot: 20-30 minutes — mélangez uniquement ce dont vous avez besoin","es":"Vida útil: 20-30 minutos — mezcle solo lo que necesite"},
    {"en":"Apply 2 medium wet coats for gloss and protection","fr":"Appliquez 2 couches moyennement humides pour le brillant et la protection","es":"Aplique 2 capas medio húmedas para brillo y protección"},
    {"en":"Flash time: 10-15 minutes between coats","fr":"Temps d''évaporation: 10-15 minutes entre les couches","es":"Tiempo de evaporación: 10-15 minutos entre capas"},
    {"en":"Do NOT sand between clear coats unless defect repair needed","fr":"Ne poncez PAS entre les couches de vernis sauf si une réparation de défaut est nécessaire","es":"NO lije entre capas de barniz a menos que se necesite reparación de defectos"},
    {"en":"Bake cure: 140°F (60°C) for 30-40 min, or air dry 6-8 hours","fr":"Cuisson: 60°C pendant 30-40 min, ou séchage à l''air 6-8 heures","es":"Horneado: 60°C durante 30-40 min, o secado al aire 6-8 horas"}
  ]},
  {"id":"filler","type":"diagnosis","text":{"en":"Body Filler / Bondo — mixing and application guide","fr":"Mastic / Bondo — guide de mélange et d''application","es":"Masilla / Bondo — guía de mezcla y aplicación"},"steps":[
    {"en":"Mixing: ribbon of hardener across a golf-ball sized amount of filler (2-3% hardener)","fr":"Mélange: ruban de durcisseur sur une quantité de mastic de la taille d''une balle de golf (2-3% de durcisseur)","es":"Mezcla: cinta de endurecedor sobre una cantidad de masilla del tamaño de una pelota de golf (2-3% endurecedor)"},
    {"en":"Do NOT over-catalyze — causes pinholes, staining, and premature hardening","fr":"Ne surcatalysez PAS — cause des trous d''épingle, des taches et un durcissement prématuré","es":"NO sobre-catalice — causa poros, manchas y endurecimiento prematuro"},
    {"en":"Working time: 3-5 minutes — work quickly and in one direction","fr":"Temps de travail: 3-5 minutes — travaillez rapidement et dans une direction","es":"Tiempo de trabajo: 3-5 minutos — trabaje rápidamente y en una dirección"},
    {"en":"Apply thin layers — max 1/4 inch per application","fr":"Appliquez des couches fines — max 6mm par application","es":"Aplique capas delgadas — máximo 6mm por aplicación"},
    {"en":"Sand progression: P80 → P150 → P220 → P320 before primer","fr":"Progression de ponçage: P80 → P150 → P220 → P320 avant l''apprêt","es":"Progresión de lijado: P80 → P150 → P220 → P320 antes de la imprimación"}
  ]}
]'::jsonb);

-- ═══════════════════════════════════════════════════════════════
-- QUIZZES
-- ═══════════════════════════════════════════════════════════════

-- ─── Quiz 1: Safety Certification ───────────────────────────
DO $$
DECLARE q1_id UUID; qn_id UUID;
BEGIN
  INSERT INTO public.quizzes (slug, title_en, title_fr, title_es, description_en, description_fr, description_es, quiz_type, passing_score, icon)
  VALUES ('safety-certification',
    'Safety Certification', 'Certification de sécurité', 'Certificación de seguridad',
    'Test your knowledge of body shop safety procedures, PPE requirements, and OSHA compliance',
    'Testez vos connaissances des procédures de sécurité, des exigences EPI et de la conformité OSHA',
    'Pruebe su conocimiento de procedimientos de seguridad, requisitos de EPP y cumplimiento de OSHA',
    'safety-certification', 70, '🛡️')
  RETURNING id INTO q1_id;

  -- Q1
  INSERT INTO public.quiz_questions (quiz_id, question_order, question_text_en, question_text_fr, question_text_es, question_type, explanation_en, explanation_fr, explanation_es)
  VALUES (q1_id, 1,
    'What PPE is required when working in a spray booth?',
    'Quels EPI sont requis pour travailler dans une cabine de pulvérisation?',
    '¿Qué EPP se requiere al trabajar en una cabina de pintura?',
    'multiple-choice',
    'A supplied-air or NIOSH-approved organic vapor respirator, paint suit, gloves, and eye protection are all required per OSHA standards when spraying.',
    'Un respirateur à air fourni ou un respirateur à vapeurs organiques approuvé par NIOSH, une combinaison de peinture, des gants et une protection oculaire sont tous requis selon les normes OSHA lors de la pulvérisation.',
    'Un respirador de aire suministrado o un respirador de vapores orgánicos aprobado por NIOSH, traje de pintura, guantes y protección ocular son todos requeridos según las normas de OSHA al pulverizar.')
  RETURNING id INTO qn_id;
  INSERT INTO public.quiz_answers (question_id, answer_order, answer_text_en, answer_text_fr, answer_text_es, is_correct) VALUES
    (qn_id, 1, 'Respirator, paint suit, gloves, and eye protection', 'Respirateur, combinaison de peinture, gants et protection oculaire', 'Respirador, traje de pintura, guantes y protección ocular', true),
    (qn_id, 2, 'Just a dust mask and gloves', 'Juste un masque anti-poussière et des gants', 'Solo una mascarilla de polvo y guantes', false),
    (qn_id, 3, 'Safety glasses only', 'Lunettes de sécurité uniquement', 'Solo gafas de seguridad', false),
    (qn_id, 4, 'No PPE needed if booth ventilation is on', 'Pas d''EPI nécessaire si la ventilation de la cabine est activée', 'No se necesita EPP si la ventilación de la cabina está encendida', false);

  -- Q2
  INSERT INTO public.quiz_questions (quiz_id, question_order, question_text_en, question_text_fr, question_text_es, question_type, explanation_en, explanation_fr, explanation_es)
  VALUES (q1_id, 2,
    'Where should Safety Data Sheets (SDS) be stored in the shop?',
    'Où les fiches de données de sécurité (FDS) doivent-elles être stockées dans l''atelier?',
    '¿Dónde deben almacenarse las Hojas de Datos de Seguridad (HDS) en el taller?',
    'multiple-choice',
    'SDS must be readily accessible to all employees during their work shift. A clearly marked binder or digital station near the work area is the OSHA requirement.',
    'Les FDS doivent être facilement accessibles à tous les employés pendant leur quart de travail. Un classeur clairement marqué ou un poste numérique près de la zone de travail est l''exigence OSHA.',
    'Las HDS deben estar fácilmente accesibles para todos los empleados durante su turno de trabajo. Una carpeta claramente marcada o una estación digital cerca del área de trabajo es el requisito de OSHA.')
  RETURNING id INTO qn_id;
  INSERT INTO public.quiz_answers (question_id, answer_order, answer_text_en, answer_text_fr, answer_text_es, is_correct) VALUES
    (qn_id, 1, 'In a clearly marked, accessible location near the work area', 'Dans un endroit clairement marqué et accessible près de la zone de travail', 'En un lugar claramente marcado y accesible cerca del área de trabajo', true),
    (qn_id, 2, 'Locked in the manager''s office', 'Verrouillées dans le bureau du directeur', 'Guardadas con llave en la oficina del gerente', false),
    (qn_id, 3, 'In the employee break room only', 'Dans la salle de pause des employés uniquement', 'Solo en la sala de descanso de los empleados', false),
    (qn_id, 4, 'They don''t need to be stored — just check online when needed', 'Elles n''ont pas besoin d''être stockées — vérifiez en ligne quand nécessaire', 'No necesitan almacenarse — solo verifique en línea cuando sea necesario', false);

  -- Q3
  INSERT INTO public.quiz_questions (quiz_id, question_order, question_text_en, question_text_fr, question_text_es, question_type, explanation_en, explanation_fr, explanation_es)
  VALUES (q1_id, 3,
    'What is the first thing to do if a chemical splashes in your eyes?',
    'Quelle est la première chose à faire si un produit chimique éclabousse vos yeux?',
    '¿Qué es lo primero que debe hacer si un químico salpica sus ojos?',
    'multiple-choice',
    'Immediately flush eyes with water for at least 15 minutes at the nearest eyewash station. Then seek medical attention. Speed is critical to prevent permanent damage.',
    'Rincez immédiatement les yeux avec de l''eau pendant au moins 15 minutes à la station de lavage oculaire la plus proche. Puis consultez un médecin. La rapidité est essentielle pour prévenir des dommages permanents.',
    'Enjuague inmediatamente los ojos con agua durante al menos 15 minutos en la estación de lavaojos más cercana. Luego busque atención médica. La rapidez es crítica para prevenir daños permanentes.')
  RETURNING id INTO qn_id;
  INSERT INTO public.quiz_answers (question_id, answer_order, answer_text_en, answer_text_fr, answer_text_es, is_correct) VALUES
    (qn_id, 1, 'Flush eyes with water for at least 15 minutes', 'Rincez les yeux avec de l''eau pendant au moins 15 minutes', 'Enjuague los ojos con agua durante al menos 15 minutos', true),
    (qn_id, 2, 'Rub your eyes to remove the chemical', 'Frottez vos yeux pour enlever le produit chimique', 'Frote sus ojos para remover el químico', false),
    (qn_id, 3, 'Wait to see if it gets better on its own', 'Attendez pour voir si ça s''améliore tout seul', 'Espere a ver si mejora por sí solo', false),
    (qn_id, 4, 'Apply eye drops from the first aid kit', 'Appliquez des gouttes pour les yeux de la trousse de premiers soins', 'Aplique gotas para los ojos del botiquín de primeros auxilios', false);

  -- Q4
  INSERT INTO public.quiz_questions (quiz_id, question_order, question_text_en, question_text_fr, question_text_es, question_type, explanation_en, explanation_fr, explanation_es)
  VALUES (q1_id, 4,
    'Flammable materials like solvents and reducers must be stored in a fire-rated cabinet.',
    'Les matériaux inflammables comme les solvants et les diluants doivent être stockés dans une armoire coupe-feu.',
    'Los materiales inflamables como solventes y reductores deben almacenarse en un gabinete clasificado contra incendios.',
    'true-false',
    'Per OSHA 29 CFR 1910.106, flammable liquids must be stored in approved flammable storage cabinets. This prevents fire spread and keeps chemicals organized.',
    'Selon OSHA 29 CFR 1910.106, les liquides inflammables doivent être stockés dans des armoires de stockage inflammables approuvées.',
    'Según OSHA 29 CFR 1910.106, los líquidos inflamables deben almacenarse en gabinetes de almacenamiento de inflamables aprobados.')
  RETURNING id INTO qn_id;
  INSERT INTO public.quiz_answers (question_id, answer_order, answer_text_en, answer_text_fr, answer_text_es, is_correct) VALUES
    (qn_id, 1, 'True', 'Vrai', 'Verdadero', true),
    (qn_id, 2, 'False', 'Faux', 'Falso', false);

  -- Q5
  INSERT INTO public.quiz_questions (quiz_id, question_order, question_text_en, question_text_fr, question_text_es, question_type, explanation_en, explanation_fr, explanation_es)
  VALUES (q1_id, 5,
    'What must be done BEFORE entering a spray booth to paint?',
    'Que doit-on faire AVANT d''entrer dans une cabine de pulvérisation pour peindre?',
    '¿Qué se debe hacer ANTES de entrar a una cabina de pintura para pintar?',
    'multiple-choice',
    'You must verify ventilation is operating, put on full PPE, and ensure no ignition sources are present. This is a mandatory pre-spray safety check.',
    'Vous devez vérifier que la ventilation fonctionne, mettre tous les EPI et vous assurer qu''aucune source d''ignition n''est présente.',
    'Debe verificar que la ventilación esté funcionando, ponerse todo el EPP y asegurar que no haya fuentes de ignición presentes.')
  RETURNING id INTO qn_id;
  INSERT INTO public.quiz_answers (question_id, answer_order, answer_text_en, answer_text_fr, answer_text_es, is_correct) VALUES
    (qn_id, 1, 'Verify ventilation, put on PPE, check for ignition sources', 'Vérifier la ventilation, mettre les EPI, vérifier les sources d''ignition', 'Verificar ventilación, ponerse EPP, verificar fuentes de ignición', true),
    (qn_id, 2, 'Just turn on the lights and start spraying', 'Allumez simplement les lumières et commencez à pulvériser', 'Solo encienda las luces y comience a pulverizar', false),
    (qn_id, 3, 'Check your phone for paint codes', 'Vérifiez votre téléphone pour les codes de peinture', 'Revise su teléfono para códigos de pintura', false),
    (qn_id, 4, 'Open the booth doors for extra ventilation', 'Ouvrez les portes de la cabine pour une ventilation supplémentaire', 'Abra las puertas de la cabina para ventilación adicional', false);

  -- Q6
  INSERT INTO public.quiz_questions (quiz_id, question_order, question_text_en, question_text_fr, question_text_es, question_type, explanation_en, explanation_fr, explanation_es)
  VALUES (q1_id, 6,
    'How often should fire extinguishers be inspected in the shop?',
    'À quelle fréquence les extincteurs doivent-ils être inspectés dans l''atelier?',
    '¿Con qué frecuencia deben inspeccionarse los extintores en el taller?',
    'multiple-choice',
    'OSHA requires monthly visual inspections and annual professional maintenance. The monthly check verifies the gauge, pin, and physical condition.',
    'L''OSHA exige des inspections visuelles mensuelles et un entretien professionnel annuel.',
    'OSHA requiere inspecciones visuales mensuales y mantenimiento profesional anual.')
  RETURNING id INTO qn_id;
  INSERT INTO public.quiz_answers (question_id, answer_order, answer_text_en, answer_text_fr, answer_text_es, is_correct) VALUES
    (qn_id, 1, 'Monthly visual inspection, annual professional service', 'Inspection visuelle mensuelle, service professionnel annuel', 'Inspección visual mensual, servicio profesional anual', true),
    (qn_id, 2, 'Only when they look damaged', 'Uniquement quand ils semblent endommagés', 'Solo cuando se ven dañados', false),
    (qn_id, 3, 'Once every 5 years', 'Une fois tous les 5 ans', 'Una vez cada 5 años', false),
    (qn_id, 4, 'Never — they are maintenance-free', 'Jamais — ils ne nécessitent aucun entretien', 'Nunca — no requieren mantenimiento', false);

  -- Q7
  INSERT INTO public.quiz_questions (quiz_id, question_order, question_text_en, question_text_fr, question_text_es, question_type, explanation_en, explanation_fr, explanation_es)
  VALUES (q1_id, 7,
    'It is safe to use a cell phone inside an active spray booth.',
    'Il est sûr d''utiliser un téléphone portable dans une cabine de pulvérisation active.',
    'Es seguro usar un teléfono celular dentro de una cabina de pintura activa.',
    'true-false',
    'FALSE. Cell phones are potential ignition sources. Spray booths contain flammable vapors, and any spark can cause an explosion. All non-essential electronics must stay outside.',
    'FAUX. Les téléphones portables sont des sources d''ignition potentielles. Les cabines de pulvérisation contiennent des vapeurs inflammables.',
    'FALSO. Los teléfonos celulares son fuentes de ignición potenciales. Las cabinas de pintura contienen vapores inflamables.')
  RETURNING id INTO qn_id;
  INSERT INTO public.quiz_answers (question_id, answer_order, answer_text_en, answer_text_fr, answer_text_es, is_correct) VALUES
    (qn_id, 1, 'True', 'Vrai', 'Verdadero', false),
    (qn_id, 2, 'False', 'Faux', 'Falso', true);

  -- Q8
  INSERT INTO public.quiz_questions (quiz_id, question_order, question_text_en, question_text_fr, question_text_es, question_type, explanation_en, explanation_fr, explanation_es)
  VALUES (q1_id, 8,
    'What type of respirator is required for isocyanate-containing products (hardeners, 2K clears)?',
    'Quel type de respirateur est requis pour les produits contenant des isocyanates (durcisseurs, vernis 2K)?',
    '¿Qué tipo de respirador se requiere para productos que contienen isocianatos (endurecedores, barnices 2K)?',
    'multiple-choice',
    'Isocyanates are extremely hazardous. A supplied-air respirator (SAR) or PAPR with organic vapor/P100 cartridges is required. A standard dust mask provides zero protection against isocyanates.',
    'Les isocyanates sont extrêmement dangereux. Un respirateur à air fourni (SAR) ou PAPR avec des cartouches vapeurs organiques/P100 est requis.',
    'Los isocianatos son extremadamente peligrosos. Se requiere un respirador de aire suministrado (SAR) o PAPR con cartuchos de vapores orgánicos/P100.')
  RETURNING id INTO qn_id;
  INSERT INTO public.quiz_answers (question_id, answer_order, answer_text_en, answer_text_fr, answer_text_es, is_correct) VALUES
    (qn_id, 1, 'Supplied-air respirator or PAPR with OV/P100 cartridges', 'Respirateur à air fourni ou PAPR avec cartouches OV/P100', 'Respirador de aire suministrado o PAPR con cartuchos OV/P100', true),
    (qn_id, 2, 'Standard N95 dust mask', 'Masque anti-poussière N95 standard', 'Mascarilla N95 estándar', false),
    (qn_id, 3, 'Half-face respirator with particulate filters only', 'Demi-masque avec filtres à particules uniquement', 'Medio rostro con filtros de partículas solamente', false),
    (qn_id, 4, 'No respirator needed if the booth ventilation is running', 'Pas de respirateur nécessaire si la ventilation de la cabine fonctionne', 'No se necesita respirador si la ventilación de la cabina funciona', false);
END $$;

-- ─── Quiz 2: Product Knowledge ──────────────────────────────
DO $$
DECLARE q2_id UUID; qn_id UUID;
BEGIN
  INSERT INTO public.quizzes (slug, title_en, title_fr, title_es, description_en, description_fr, description_es, quiz_type, passing_score, icon)
  VALUES ('product-knowledge',
    'Product Knowledge', 'Connaissance des produits', 'Conocimiento de productos',
    'Test your understanding of mixing ratios, application techniques, and product handling',
    'Testez votre compréhension des ratios de mélange, techniques d''application et manipulation des produits',
    'Pruebe su comprensión de proporciones de mezcla, técnicas de aplicación y manejo de productos',
    'product-knowledge', 80, '🧪')
  RETURNING id INTO q2_id;

  -- Q1
  INSERT INTO public.quiz_questions (quiz_id, question_order, question_text_en, question_text_fr, question_text_es, question_type, explanation_en, explanation_fr, explanation_es)
  VALUES (q2_id, 1,
    'What is the typical mixing ratio for 2K clear coat?',
    'Quel est le ratio de mélange typique pour un vernis 2K?',
    '¿Cuál es la proporción de mezcla típica para barniz 2K?',
    'multiple-choice',
    'Most 2K clear coats mix at a 2:1 ratio (clear to hardener). Some systems may add reducer. Always refer to the product TDS for exact ratios.',
    'La plupart des vernis 2K se mélangent dans un ratio de 2:1 (vernis pour durcisseur). Certains systèmes peuvent ajouter du diluant.',
    'La mayoría de barnices 2K se mezclan en proporción 2:1 (barniz a endurecedor). Algunos sistemas pueden agregar reductor.')
  RETURNING id INTO qn_id;
  INSERT INTO public.quiz_answers (question_id, answer_order, answer_text_en, answer_text_fr, answer_text_es, is_correct) VALUES
    (qn_id, 1, '2:1 (clear : hardener)', '2:1 (vernis : durcisseur)', '2:1 (barniz : endurecedor)', true),
    (qn_id, 2, '1:1 (clear : hardener)', '1:1 (vernis : durcisseur)', '1:1 (barniz : endurecedor)', false),
    (qn_id, 3, '4:1 (clear : hardener)', '4:1 (vernis : durcisseur)', '4:1 (barniz : endurecedor)', false),
    (qn_id, 4, 'No mixing needed — spray straight from the can', 'Pas de mélange nécessaire — pulvérisez directement de la boîte', 'No se necesita mezcla — pulverice directamente de la lata', false);

  -- Q2
  INSERT INTO public.quiz_questions (quiz_id, question_order, question_text_en, question_text_fr, question_text_es, question_type, explanation_en, explanation_fr, explanation_es)
  VALUES (q2_id, 2,
    'What happens if you add too much hardener to body filler?',
    'Que se passe-t-il si vous ajoutez trop de durcisseur au mastic?',
    '¿Qué pasa si agrega demasiado endurecedor a la masilla?',
    'multiple-choice',
    'Over-catalyzing body filler causes pinholes (air pockets), staining through paint, and can make the filler set too quickly to work properly.',
    'La surcatalyse du mastic cause des trous d''épingle (poches d''air), des taches à travers la peinture, et peut faire durcir le mastic trop rapidement.',
    'Sobre-catalizar la masilla causa poros (bolsas de aire), manchas a través de la pintura, y puede hacer que la masilla endurezca demasiado rápido.')
  RETURNING id INTO qn_id;
  INSERT INTO public.quiz_answers (question_id, answer_order, answer_text_en, answer_text_fr, answer_text_es, is_correct) VALUES
    (qn_id, 1, 'Pinholes, staining, and premature hardening', 'Trous d''épingle, taches et durcissement prématuré', 'Poros, manchas y endurecimiento prematuro', true),
    (qn_id, 2, 'It makes the filler stronger and better', 'Ça rend le mastic plus fort et meilleur', 'Hace que la masilla sea más fuerte y mejor', false),
    (qn_id, 3, 'Nothing — more hardener is always better', 'Rien — plus de durcisseur c''est toujours mieux', 'Nada — más endurecedor siempre es mejor', false),
    (qn_id, 4, 'The filler won''t cure at all', 'Le mastic ne durcira pas du tout', 'La masilla no curará en absoluto', false);

  -- Q3
  INSERT INTO public.quiz_questions (quiz_id, question_order, question_text_en, question_text_fr, question_text_es, question_type, explanation_en, explanation_fr, explanation_es)
  VALUES (q2_id, 3,
    'What is "flash time" in painting?',
    'Qu''est-ce que le "temps d''évaporation" en peinture?',
    '¿Qué es el "tiempo de evaporación" en pintura?',
    'multiple-choice',
    'Flash time is the waiting period between coats that allows solvents to evaporate. Insufficient flash time causes solvent pop, lifting, and poor adhesion.',
    'Le temps d''évaporation est la période d''attente entre les couches qui permet aux solvants de s''évaporer.',
    'El tiempo de evaporación es el período de espera entre capas que permite que los solventes se evaporen.')
  RETURNING id INTO qn_id;
  INSERT INTO public.quiz_answers (question_id, answer_order, answer_text_en, answer_text_fr, answer_text_es, is_correct) VALUES
    (qn_id, 1, 'Time between coats for solvents to evaporate', 'Temps entre les couches pour que les solvants s''évaporent', 'Tiempo entre capas para que los solventes se evaporen', true),
    (qn_id, 2, 'The speed at which you spray', 'La vitesse à laquelle vous pulvérisez', 'La velocidad a la que pulveriza', false),
    (qn_id, 3, 'How quickly paint dries in the oven', 'À quelle vitesse la peinture sèche dans le four', 'Qué tan rápido se seca la pintura en el horno', false),
    (qn_id, 4, 'The time to clean the spray gun', 'Le temps pour nettoyer le pistolet', 'El tiempo para limpiar la pistola', false);

  -- Q4
  INSERT INTO public.quiz_questions (quiz_id, question_order, question_text_en, question_text_fr, question_text_es, question_type, explanation_en, explanation_fr, explanation_es)
  VALUES (q2_id, 4,
    'A slower reducer should be used in hot weather conditions.',
    'Un diluant plus lent devrait être utilisé dans des conditions de temps chaud.',
    'Se debe usar un reductor más lento en condiciones de clima caliente.',
    'true-false',
    'TRUE. In hot conditions, fast reducers evaporate too quickly causing dry spray and orange peel. Slower reducers allow proper flow and leveling.',
    'VRAI. Dans des conditions chaudes, les diluants rapides s''évaporent trop vite causant pulvérisation sèche et peau d''orange.',
    'VERDADERO. En condiciones calientes, los reductores rápidos se evaporan demasiado rápido causando spray seco y cáscara de naranja.')
  RETURNING id INTO qn_id;
  INSERT INTO public.quiz_answers (question_id, answer_order, answer_text_en, answer_text_fr, answer_text_es, is_correct) VALUES
    (qn_id, 1, 'True', 'Vrai', 'Verdadero', true),
    (qn_id, 2, 'False', 'Faux', 'Falso', false);

  -- Q5
  INSERT INTO public.quiz_questions (quiz_id, question_order, question_text_en, question_text_fr, question_text_es, question_type, explanation_en, explanation_fr, explanation_es)
  VALUES (q2_id, 5,
    'What grit sandpaper is used for final sanding of primer before base coat?',
    'Quel grain de papier de verre est utilisé pour le ponçage final de l''apprêt avant la couche de base?',
    '¿Qué grano de lija se usa para el lijado final de imprimación antes de la capa base?',
    'multiple-choice',
    'P320-P400 provides the ideal surface profile for base coat adhesion. Coarser grits leave visible scratches; finer grits don''t give enough tooth for adhesion.',
    'P320-P400 fournit le profil de surface idéal pour l''adhérence de la couche de base.',
    'P320-P400 proporciona el perfil de superficie ideal para la adhesión de la capa base.')
  RETURNING id INTO qn_id;
  INSERT INTO public.quiz_answers (question_id, answer_order, answer_text_en, answer_text_fr, answer_text_es, is_correct) VALUES
    (qn_id, 1, 'P320-P400', 'P320-P400', 'P320-P400', true),
    (qn_id, 2, 'P80-P120', 'P80-P120', 'P80-P120', false),
    (qn_id, 3, 'P1500-P2000', 'P1500-P2000', 'P1500-P2000', false),
    (qn_id, 4, 'P40-P60', 'P40-P60', 'P40-P60', false);

  -- Q6
  INSERT INTO public.quiz_questions (quiz_id, question_order, question_text_en, question_text_fr, question_text_es, question_type, explanation_en, explanation_fr, explanation_es)
  VALUES (q2_id, 6,
    'What is the recommended spray gun distance from the surface for HVLP application?',
    'Quelle est la distance recommandée du pistolet de pulvérisation à la surface pour l''application HVLP?',
    '¿Cuál es la distancia recomendada de la pistola de pulverización a la superficie para aplicación HVLP?',
    'multiple-choice',
    '6-8 inches (15-20 cm) is the standard HVLP spray distance. Too close causes runs; too far causes dry spray and excessive overspray.',
    '15-20 cm est la distance de pulvérisation HVLP standard. Trop proche cause des coulures; trop loin cause pulvérisation sèche.',
    '15-20 cm es la distancia estándar de pulverización HVLP. Muy cerca causa chorreos; muy lejos causa spray seco.')
  RETURNING id INTO qn_id;
  INSERT INTO public.quiz_answers (question_id, answer_order, answer_text_en, answer_text_fr, answer_text_es, is_correct) VALUES
    (qn_id, 1, '6-8 inches (15-20 cm)', '15-20 cm', '15-20 cm', true),
    (qn_id, 2, '2-3 inches (5-8 cm)', '5-8 cm', '5-8 cm', false),
    (qn_id, 3, '12-18 inches (30-45 cm)', '30-45 cm', '30-45 cm', false),
    (qn_id, 4, 'Distance doesn''t matter', 'La distance n''a pas d''importance', 'La distancia no importa', false);

  -- Q7
  INSERT INTO public.quiz_questions (quiz_id, question_order, question_text_en, question_text_fr, question_text_es, question_type, explanation_en, explanation_fr, explanation_es)
  VALUES (q2_id, 7,
    'What causes "solvent pop" (tiny bubbles/craters in the clear coat)?',
    'Qu''est-ce qui cause l''"éclatement de solvant" (minuscules bulles/cratères dans le vernis)?',
    '¿Qué causa el "estallido de solvente" (pequeñas burbujas/cráteres en el barniz)?',
    'multiple-choice',
    'Solvent pop occurs when solvents are trapped under the surface film. This happens from insufficient flash time, coats applied too heavy, or baking too soon.',
    'L''éclatement de solvant se produit lorsque les solvants sont piégés sous le film de surface.',
    'El estallido de solvente ocurre cuando los solventes quedan atrapados debajo de la película superficial.')
  RETURNING id INTO qn_id;
  INSERT INTO public.quiz_answers (question_id, answer_order, answer_text_en, answer_text_fr, answer_text_es, is_correct) VALUES
    (qn_id, 1, 'Insufficient flash time or coats too heavy', 'Temps d''évaporation insuffisant ou couches trop épaisses', 'Tiempo de evaporación insuficiente o capas demasiado gruesas', true),
    (qn_id, 2, 'Using too much reducer', 'Utiliser trop de diluant', 'Usar demasiado reductor', false),
    (qn_id, 3, 'Spraying in cold conditions', 'Pulvérisation dans des conditions froides', 'Pulverizar en condiciones frías', false),
    (qn_id, 4, 'Contaminated spray gun', 'Pistolet de pulvérisation contaminé', 'Pistola de pulverización contaminada', false);

  -- Q8
  INSERT INTO public.quiz_questions (quiz_id, question_order, question_text_en, question_text_fr, question_text_es, question_type, explanation_en, explanation_fr, explanation_es)
  VALUES (q2_id, 8,
    'You should always use a tack cloth on the surface just before spraying.',
    'Vous devriez toujours utiliser un chiffon collant sur la surface juste avant de pulvériser.',
    'Siempre debe usar un paño adherente en la superficie justo antes de pulverizar.',
    'true-false',
    'TRUE. A tack cloth picks up fine dust particles that remain after sanding and cleaning. Skipping this step is a common cause of contamination in the finish.',
    'VRAI. Un chiffon collant ramasse les fines particules de poussière qui restent après le ponçage et le nettoyage.',
    'VERDADERO. Un paño adherente recoge partículas finas de polvo que quedan después del lijado y limpieza.')
  RETURNING id INTO qn_id;
  INSERT INTO public.quiz_answers (question_id, answer_order, answer_text_en, answer_text_fr, answer_text_es, is_correct) VALUES
    (qn_id, 1, 'True', 'Vrai', 'Verdadero', true),
    (qn_id, 2, 'False', 'Faux', 'Falso', false);
END $$;

-- ─── Quiz 3: Process & Troubleshooting ──────────────────────
DO $$
DECLARE q3_id UUID; qn_id UUID;
BEGIN
  INSERT INTO public.quizzes (slug, title_en, title_fr, title_es, description_en, description_fr, description_es, quiz_type, passing_score, icon)
  VALUES ('process-troubleshooting',
    'Process & Troubleshooting', 'Processus et dépannage', 'Proceso y solución de problemas',
    'Test your ability to identify defects, follow correct repair sequences, and troubleshoot common issues',
    'Testez votre capacité à identifier les défauts, suivre les séquences de réparation et résoudre les problèmes courants',
    'Pruebe su capacidad para identificar defectos, seguir secuencias de reparación y resolver problemas comunes',
    'skill-check', 75, '🔧')
  RETURNING id INTO q3_id;

  -- Q1
  INSERT INTO public.quiz_questions (quiz_id, question_order, question_text_en, question_text_fr, question_text_es, question_type, explanation_en, explanation_fr, explanation_es)
  VALUES (q3_id, 1,
    'What is the correct sanding progression for body filler before primer?',
    'Quelle est la progression de ponçage correcte pour le mastic avant l''apprêt?',
    '¿Cuál es la progresión de lijado correcta para masilla antes de la imprimación?',
    'multiple-choice',
    'Start coarse (P80) to shape, then progressively finer (P150 → P220 → P320) to refine. Skipping grits leaves deep scratches that show through paint.',
    'Commencez gros (P80) pour façonner, puis progressivement plus fin (P150 → P220 → P320) pour affiner.',
    'Comience grueso (P80) para dar forma, luego progresivamente más fino (P150 → P220 → P320) para refinar.')
  RETURNING id INTO qn_id;
  INSERT INTO public.quiz_answers (question_id, answer_order, answer_text_en, answer_text_fr, answer_text_es, is_correct) VALUES
    (qn_id, 1, 'P80 → P150 → P220 → P320', 'P80 → P150 → P220 → P320', 'P80 → P150 → P220 → P320', true),
    (qn_id, 2, 'P320 → P220 → P150 → P80', 'P320 → P220 → P150 → P80', 'P320 → P220 → P150 → P80', false),
    (qn_id, 3, 'P400 only', 'P400 uniquement', 'Solo P400', false),
    (qn_id, 4, 'P40 → P800', 'P40 → P800', 'P40 → P800', false);

  -- Q2
  INSERT INTO public.quiz_questions (quiz_id, question_order, question_text_en, question_text_fr, question_text_es, question_type, explanation_en, explanation_fr, explanation_es)
  VALUES (q3_id, 2,
    'You notice fish eyes appearing as you spray clear coat. What should you do FIRST?',
    'Vous remarquez des yeux de poisson apparaissant en pulvérisant le vernis. Que devez-vous faire EN PREMIER?',
    'Nota ojos de pez apareciendo al pulverizar barniz. ¿Qué debe hacer PRIMERO?',
    'multiple-choice',
    'Stop spraying immediately. Continuing will only make the problem worse. You need to identify and eliminate the contamination source before repainting.',
    'Arrêtez de pulvériser immédiatement. Continuer ne fera qu''aggraver le problème.',
    'Deje de pulverizar inmediatamente. Continuar solo empeorará el problema.')
  RETURNING id INTO qn_id;
  INSERT INTO public.quiz_answers (question_id, answer_order, answer_text_en, answer_text_fr, answer_text_es, is_correct) VALUES
    (qn_id, 1, 'Stop spraying immediately', 'Arrêtez de pulvériser immédiatement', 'Deje de pulverizar inmediatamente', true),
    (qn_id, 2, 'Apply more clear coat to fill in the craters', 'Appliquer plus de vernis pour remplir les cratères', 'Aplicar más barniz para rellenar los cráteres', false),
    (qn_id, 3, 'Increase the air pressure', 'Augmenter la pression d''air', 'Aumentar la presión de aire', false),
    (qn_id, 4, 'Switch to a faster reducer', 'Passer à un diluant plus rapide', 'Cambiar a un reductor más rápido', false);

  -- Q3
  INSERT INTO public.quiz_questions (quiz_id, question_order, question_text_en, question_text_fr, question_text_es, question_type, explanation_en, explanation_fr, explanation_es)
  VALUES (q3_id, 3,
    'What is the correct order for a complete paint repair?',
    'Quel est l''ordre correct pour une réparation de peinture complète?',
    '¿Cuál es el orden correcto para una reparación completa de pintura?',
    'multiple-choice',
    'The correct sequence ensures each layer has proper adhesion and the correct surface profile for the next step.',
    'La séquence correcte garantit que chaque couche a une adhérence appropriée et le profil de surface correct pour l''étape suivante.',
    'La secuencia correcta asegura que cada capa tenga adhesión adecuada y el perfil de superficie correcto para el siguiente paso.')
  RETURNING id INTO qn_id;
  INSERT INTO public.quiz_answers (question_id, answer_order, answer_text_en, answer_text_fr, answer_text_es, is_correct) VALUES
    (qn_id, 1, 'Clean → Sand → Filler → Prime → Sand → Base → Clear', 'Nettoyer → Poncer → Mastic → Apprêt → Poncer → Base → Vernis', 'Limpiar → Lijar → Masilla → Imprimar → Lijar → Base → Barniz', true),
    (qn_id, 2, 'Sand → Base → Clear → Filler → Prime', 'Poncer → Base → Vernis → Mastic → Apprêt', 'Lijar → Base → Barniz → Masilla → Imprimar', false),
    (qn_id, 3, 'Prime → Sand → Base → Clear → Filler', 'Apprêt → Poncer → Base → Vernis → Mastic', 'Imprimar → Lijar → Base → Barniz → Masilla', false),
    (qn_id, 4, 'Filler → Base → Sand → Prime → Clear', 'Mastic → Base → Poncer → Apprêt → Vernis', 'Masilla → Base → Lijar → Imprimar → Barniz', false);

  -- Q4
  INSERT INTO public.quiz_questions (quiz_id, question_order, question_text_en, question_text_fr, question_text_es, question_type, explanation_en, explanation_fr, explanation_es)
  VALUES (q3_id, 4,
    'You can apply clear coat over base coat that has been sitting for 24 hours without scuffing.',
    'Vous pouvez appliquer du vernis sur une couche de base qui a reposé pendant 24 heures sans poncer.',
    'Puede aplicar barniz sobre capa base que ha estado reposando por 24 horas sin lijar.',
    'true-false',
    'FALSE. Most base coats have a recoat window (30-90 minutes). After that, the clear coat won''t bond properly. You must lightly scuff with P600-P800 and re-apply base before clearing.',
    'FAUX. La plupart des couches de base ont une fenêtre de recouvrement (30-90 minutes).',
    'FALSO. La mayoría de capas base tienen una ventana de repintado (30-90 minutos).')
  RETURNING id INTO qn_id;
  INSERT INTO public.quiz_answers (question_id, answer_order, answer_text_en, answer_text_fr, answer_text_es, is_correct) VALUES
    (qn_id, 1, 'True', 'Vrai', 'Verdadero', false),
    (qn_id, 2, 'False', 'Faux', 'Falso', true);

  -- Q5
  INSERT INTO public.quiz_questions (quiz_id, question_order, question_text_en, question_text_fr, question_text_es, question_type, explanation_en, explanation_fr, explanation_es)
  VALUES (q3_id, 5,
    'A customer complains about a cloudy appearance in the clear coat. What is the most likely cause?',
    'Un client se plaint d''une apparence trouble dans le vernis. Quelle est la cause la plus probable?',
    'Un cliente se queja de una apariencia nublada en el barniz. ¿Cuál es la causa más probable?',
    'multiple-choice',
    'Moisture trapped in the clear coat (blushing) is caused by high humidity and/or fast reducer. The moisture gets trapped as solvents evaporate too quickly.',
    'L''humidité piégée dans le vernis (voile) est causée par une humidité élevée et/ou un diluant rapide.',
    'La humedad atrapada en el barniz (velo) es causada por alta humedad y/o reductor rápido.')
  RETURNING id INTO qn_id;
  INSERT INTO public.quiz_answers (question_id, answer_order, answer_text_en, answer_text_fr, answer_text_es, is_correct) VALUES
    (qn_id, 1, 'Moisture trapped (high humidity + fast reducer)', 'Humidité piégée (haute humidité + diluant rapide)', 'Humedad atrapada (alta humedad + reductor rápido)', true),
    (qn_id, 2, 'Wrong color base coat', 'Mauvaise couleur de couche de base', 'Color incorrecto de capa base', false),
    (qn_id, 3, 'Too many coats of clear', 'Trop de couches de vernis', 'Demasiadas capas de barniz', false),
    (qn_id, 4, 'Old sandpaper used in prep', 'Vieux papier de verre utilisé en préparation', 'Lija vieja usada en preparación', false);

  -- Q6
  INSERT INTO public.quiz_questions (quiz_id, question_order, question_text_en, question_text_fr, question_text_es, question_type, explanation_en, explanation_fr, explanation_es)
  VALUES (q3_id, 6,
    'After compounding a clear coat to remove orange peel, what should you do next?',
    'Après avoir poli un vernis pour enlever la peau d''orange, que devez-vous faire ensuite?',
    'Después de pulir un barniz para eliminar cáscara de naranja, ¿qué debe hacer después?',
    'multiple-choice',
    'After compounding, you must polish to remove swirl marks and restore full gloss. Compounding alone leaves a hazy finish with micro-scratches.',
    'Après le polissage grossier, vous devez polir pour enlever les marques tourbillonnantes et restaurer le plein brillant.',
    'Después del pulido grueso, debe pulir para eliminar marcas de remolino y restaurar el brillo completo.')
  RETURNING id INTO qn_id;
  INSERT INTO public.quiz_answers (question_id, answer_order, answer_text_en, answer_text_fr, answer_text_es, is_correct) VALUES
    (qn_id, 1, 'Polish with a finishing polish to restore full gloss', 'Polir avec un polish de finition pour restaurer le plein brillant', 'Pulir con un pulimento de acabado para restaurar el brillo completo', true),
    (qn_id, 2, 'Wax it and deliver to the customer', 'Cirez-le et livrez au client', 'Encérelo y entréguelo al cliente', false),
    (qn_id, 3, 'Apply another coat of clear', 'Appliquer une autre couche de vernis', 'Aplicar otra capa de barniz', false),
    (qn_id, 4, 'Sand with P80 to prepare for more paint', 'Poncer avec P80 pour préparer pour plus de peinture', 'Lijar con P80 para preparar para más pintura', false);
END $$;

-- ═══════════════════════════════════════════════════════════════
-- REFERENCE DOCUMENTS (seeded into documents table for Max to search)
-- ═══════════════════════════════════════════════════════════════

INSERT INTO public.documents (title, description, doc_type, tab_slug, language, tags, is_active, metadata) VALUES
('OSHA Body Shop Safety Compliance Guide',
 'Comprehensive guide to OSHA compliance for automotive collision repair shops. Covers hazard communication, PPE requirements, ventilation standards, flammable storage, and emergency procedures.',
 'manual', NULL, 'en',
 ARRAY['osha', 'safety', 'compliance', 'hazard-communication', 'ppe', 'ventilation', 'flammable-storage'],
 true, '{"source": "seed-learning"}'),

('PPE Requirements for Collision Repair',
 'Personal Protective Equipment requirements for each body shop task: spray painting, sanding, welding, chemical handling, and general shop work. Includes respirator selection guide.',
 'procedure', NULL, 'en',
 ARRAY['ppe', 'safety', 'respirator', 'gloves', 'eye-protection', 'paint-suit', 'isocyanate'],
 true, '{"source": "seed-learning"}'),

('Spray Booth Safety & Ventilation Procedures',
 'Standard operating procedures for spray booth use including pre-spray checklist, ventilation verification, filter maintenance schedule, and emergency shutdown procedure.',
 'procedure', 'painting', 'en',
 ARRAY['spray-booth', 'ventilation', 'safety', 'filters', 'airflow', 'osha'],
 true, '{"source": "seed-learning"}'),

('Chemical Storage & SDS Handling Best Practices',
 'Best practices for organizing and maintaining Safety Data Sheets, proper chemical storage in fire-rated cabinets, and hazard communication program requirements.',
 'manual', NULL, 'en',
 ARRAY['sds', 'chemical-storage', 'hazard-communication', 'flammable', 'osha', 'fire-cabinet'],
 true, '{"source": "seed-learning"}'),

('Paint Defect Identification & Repair Reference',
 'Visual identification guide for common paint defects: orange peel, runs, fish eye, solvent pop, blushing, mapping, and die-back. Includes causes and corrective actions for each.',
 'tech_sheet', 'painting', 'en',
 ARRAY['paint-defects', 'orange-peel', 'fish-eye', 'runs', 'solvent-pop', 'troubleshooting', 'clear-coat'],
 true, '{"source": "seed-learning"}');

-- Insert corresponding document chunks for the reference docs so they appear in search
DO $$
DECLARE doc_id UUID;
BEGIN
  -- OSHA Guide chunks
  SELECT id INTO doc_id FROM public.documents WHERE title = 'OSHA Body Shop Safety Compliance Guide' LIMIT 1;
  IF doc_id IS NOT NULL THEN
    INSERT INTO public.document_chunks (document_id, chunk_index, content, token_count) VALUES
    (doc_id, 0, 'OSHA Body Shop Safety Compliance Guide. Every collision repair shop must comply with OSHA standards to protect workers from hazards including chemical exposure, fire risks, noise, and physical injury. Key OSHA standards for body shops include: 29 CFR 1910.1200 Hazard Communication (HazCom) — requires a written program, Safety Data Sheets for all chemicals, container labeling, and employee training. 29 CFR 1910.134 Respiratory Protection — requires a written respiratory protection program including medical evaluations, fit testing, and training for all employees who wear respirators. 29 CFR 1910.106 Flammable Liquids — requires proper storage in approved fire-rated cabinets, grounding and bonding of containers, and adequate ventilation.', 120),
    (doc_id, 1, 'OSHA compliance checklist for body shops: 1. Written Hazard Communication program posted and accessible. 2. SDS sheets organized and available within the work area during all shifts. 3. All chemical containers properly labeled with product name and hazard warnings. 4. Fire extinguishers inspected monthly, serviced annually, and appropriate class for spray operations (Class B). 5. Emergency eyewash stations within 10 seconds travel time from chemical use areas. 6. Spray booths meet NFPA 33 and OSHA 1910.107 for ventilation, electrical, and fire suppression. 7. Respiratory protection program in place with documented fit testing. 8. PPE provided at no cost to employees and in good condition. 9. First aid kit stocked and accessible. 10. Emergency action plan posted with evacuation routes and meeting points.', 130),
    (doc_id, 2, 'Employee training requirements under OSHA for body shops: All employees must receive initial training and annual refresher training on: hazard communication and SDS usage, proper use of PPE including respirator fit and maintenance, fire extinguisher operation and evacuation procedures, safe handling of flammable liquids and compressed gases, lockout/tagout procedures for equipment maintenance, and specific hazards of isocyanate-containing products. Training must be documented with dates, topics covered, and employee signatures. Records must be maintained for the duration of employment plus 30 years for exposure records.', 100);
  END IF;

  -- PPE Guide chunks
  SELECT id INTO doc_id FROM public.documents WHERE title = 'PPE Requirements for Collision Repair' LIMIT 1;
  IF doc_id IS NOT NULL THEN
    INSERT INTO public.document_chunks (document_id, chunk_index, content, token_count) VALUES
    (doc_id, 0, 'PPE Requirements by Task in Collision Repair. SPRAY PAINTING: Supplied-air respirator (SAR) or PAPR with OV/P100 cartridges required for isocyanate-containing products (2K clears, hardeners). Full paint suit (lint-free), chemical-resistant gloves (nitrile), safety glasses or goggles, and hearing protection if spray gun exceeds 85 dB. SANDING: P100 particulate respirator or dust mask, safety glasses with side shields, hearing protection for power sanders, leather or nitrile gloves. WELDING: Auto-darkening welding helmet (shade 10-13), leather welding jacket and gloves, steel-toe boots, fire-resistant clothing, welding curtains to protect nearby workers.', 120),
    (doc_id, 1, 'CHEMICAL HANDLING: Nitrile gloves (not latex — many shop chemicals degrade latex), splash-proof safety goggles when pouring or mixing, chemical-resistant apron for large volume handling, respiratory protection per SDS recommendations for each specific product. GENERAL SHOP: Safety glasses at all times in the shop area, steel-toe boots recommended, hearing protection when noise exceeds 85 dB (grinders, air tools, compressors). Respirator Selection Guide: Dust/particulate only (sanding) = N95 or P100. Organic vapors (solvent wiping) = half-face with OV cartridges. Isocyanates (2K painting) = supplied-air respirator or PAPR with OV/P100. Always check the SDS Section 8 for specific PPE recommendations for each product.', 120);
  END IF;

  -- Spray Booth chunks
  SELECT id INTO doc_id FROM public.documents WHERE title = 'Spray Booth Safety & Ventilation Procedures' LIMIT 1;
  IF doc_id IS NOT NULL THEN
    INSERT INTO public.document_chunks (document_id, chunk_index, content, token_count) VALUES
    (doc_id, 0, 'Spray Booth Pre-Spray Safety Checklist: 1. Verify booth ventilation system is operating — check airflow indicator or manometer. Minimum 100 FPM downdraft or crossdraft at the work surface. 2. Inspect ceiling intake filters — replace if discolored or clogged. Replace exhaust filters when pressure differential exceeds manufacturer spec. 3. Check booth temperature — ideal range 65-75°F (18-24°C) for most products. 4. Verify fire suppression system is armed and indicator light is green. 5. Remove all ignition sources — no cell phones, standard flashlights, or non-explosion-proof tools inside booth during spray operations. 6. Don full PPE before entering booth with mixed paint. 7. Ensure booth doors seal properly — gaps allow contamination and reduce airflow efficiency.', 130),
    (doc_id, 1, 'Spray Booth Maintenance Schedule: DAILY: Clean booth floor, wipe down walls if overspray present, check manometer reading. WEEKLY: Inspect intake and exhaust filters, clean light covers, verify door seals. MONTHLY: Check fan belt tension, lubricate fan bearings, test fire suppression system, verify electrical connections in explosion-proof fixtures. QUARTERLY: Professional HVAC inspection, deep clean ductwork, replace all filters, calibrate temperature controls. ANNUALLY: Full system inspection per NFPA 33, fire suppression system recertification, booth integrity test. Filter Replacement Guide: Ceiling intake filters — replace when airflow drops below spec or filters are visibly loaded. Exhaust filters — replace when manometer shows excessive pressure drop. Paint arrest filters — replace after every 50-100 spray hours or when loaded with overspray.', 140);
  END IF;

  -- Chemical Storage chunks
  SELECT id INTO doc_id FROM public.documents WHERE title = 'Chemical Storage & SDS Handling Best Practices' LIMIT 1;
  IF doc_id IS NOT NULL THEN
    INSERT INTO public.document_chunks (document_id, chunk_index, content, token_count) VALUES
    (doc_id, 0, 'Chemical Storage Best Practices for Body Shops. All flammable liquids (solvents, reducers, thinners, paints) must be stored in OSHA/NFPA-approved fire-rated cabinets. Maximum 60 gallons of Class I and II flammables per cabinet. Cabinets must have self-closing doors, liquid-tight sill, and proper ventilation. Keep incompatible chemicals separated — oxidizers away from flammables, acids away from bases. All containers must be labeled with product name, hazard warnings, and date opened. Opened containers should be used within the manufacturer recommended timeframe. Store materials away from heat sources, direct sunlight, and ignition sources. Keep a minimum 3-foot clearance around fire-rated cabinets.', 120),
    (doc_id, 1, 'SDS Organization and Management. Maintain a complete SDS binder or digital system for EVERY chemical product in the shop. SDS must be available during all work shifts — employees must be able to access them within their work area. Organize SDS alphabetically by product name or by manufacturer for easy lookup. When new products arrive, add the SDS before the product is used. Review SDS Section 2 (Hazard Identification) and Section 8 (Exposure Controls/PPE) before using any new product. Key SDS sections for technicians: Section 2 — hazards and precautions, Section 4 — first aid measures, Section 5 — fire-fighting measures, Section 7 — handling and storage, Section 8 — PPE requirements. Dispose of expired or discontinued product SDS only after 30 years per OSHA record retention requirements.', 130);
  END IF;

  -- Paint Defect chunks
  SELECT id INTO doc_id FROM public.documents WHERE title = 'Paint Defect Identification & Repair Reference' LIMIT 1;
  IF doc_id IS NOT NULL THEN
    INSERT INTO public.document_chunks (document_id, chunk_index, content, token_count) VALUES
    (doc_id, 0, 'Common Paint Defects — Identification and Causes. ORANGE PEEL: Bumpy texture resembling an orange skin. Causes: gun too far from surface, air pressure too high, reducer evaporating too fast, booth temperature too high. RUNS/SAGS: Paint dripping or sagging on vertical surfaces. Causes: too much material applied, gun too close, moving too slowly, reducer too slow for conditions. FISH EYES: Small craters or circles in the paint film. Causes: silicone or oil contamination on the surface — from hand lotion, tire dressing, silicone-based products, or contaminated air lines. DRY SPRAY: Rough, dusty texture with poor gloss. Causes: gun too far away, air pressure too high, insufficient material flow, low humidity.', 130),
    (doc_id, 1, 'SOLVENT POP: Tiny pinholes or craters in clear coat. Causes: insufficient flash time between coats, coats applied too heavy, bake temperature too high too soon. BLUSHING/CLOUDING: Milky or cloudy appearance in clear coat. Causes: high humidity trapping moisture, reducer evaporating too fast in humid conditions. MAPPING/SAND SCRATCH SWELLING: Visible scratches showing through the paint. Causes: sanding scratches too deep for the paint system to fill, insufficient primer thickness, wrong grit progression. DIEBACK: Loss of gloss days or weeks after painting. Causes: solvent trapped in film from insufficient dry time before polishing, or from re-coating outside the recoat window. Repair Methods: Minor defects (orange peel, light runs) — sand with P1500-P2000, compound, and polish. Major defects (fish eye, heavy runs, solvent pop) — sand back to the affected layer and respray.', 140);
  END IF;
END $$;
