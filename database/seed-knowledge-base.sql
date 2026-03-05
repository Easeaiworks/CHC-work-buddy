-- Seed: Comprehensive Knowledge Base for Max
-- Sources: OSHA (public domain), EPA (public domain), NIOSH (public domain), Manufacturer links (reference)
-- Run AFTER schema and initial seeds are in place
-- ═══════════════════════════════════════════════════════════════
-- SECTION 1: OSHA AUTOBODY SAFETY STANDARDS (Public Domain)
-- ═══════════════════════════════════════════════════════════════

-- ─── Doc 1: OSHA Autobody Hazards & Solutions ─────────────────
INSERT INTO public.documents (title, description, doc_type, tab_slug, language, tags, is_active) VALUES
('OSHA Autobody Hazards & Solutions Guide',
 'Comprehensive guide to OSHA-identified hazards in auto body repair and refinishing shops, including chemical exposure, physical hazards, and required controls. Source: osha.gov/autobody/hazards-solutions (public domain).',
 'manual', 'painting', 'en',
 ARRAY['osha', 'safety', 'hazards', 'chemical exposure', 'ppe', 'ventilation', 'spray painting', 'sanding', 'welding', 'isocyanates', 'regulations', 'compliance'],
 true);

INSERT INTO public.document_chunks (document_id, content, chunk_index) VALUES
((SELECT id FROM public.documents WHERE title = 'OSHA Autobody Hazards & Solutions Guide'),
'OSHA AUTOBODY REPAIR AND REFINISHING — HAZARDS AND SOLUTIONS

CHEMICAL HAZARDS IN AUTO BODY SHOPS:

Workers in autobody shops are potentially exposed to a wide variety of chemical and physical hazards including:

1. VOLATILE ORGANIC COMPOUNDS (VOCs): From paints, primers, fillers, clearcoats, and solvents. These can cause respiratory irritation, headaches, dizziness, and long-term organ damage. Common VOCs include toluene, xylene, methyl ethyl ketone (MEK), and acetone.

2. ISOCYANATES AND POLYISOCYANATES: Present in two-component (2K) clearcoats, primers, and hardeners. Isocyanates are one of the leading causes of occupational asthma. Even low-level exposure can cause severe respiratory sensitization. Once sensitized, a worker may react to extremely small exposures. Diisocyanates include HDI (hexamethylene diisocyanate) and TDI (toluene diisocyanate).

3. HEXAVALENT CHROMIUM: Found in some primers and coatings, especially on aerospace and specialty finishes. Hexavalent chromium is a known carcinogen (OSHA PEL: 5 μg/m³). Requires air monitoring and medical surveillance if exposure is possible.

4. SILICA DUST: Generated during sandblasting operations. Respirable crystalline silica causes silicosis, lung cancer, and kidney disease. OSHA PEL is 50 μg/m³ as an 8-hour TWA.

5. SANDING DUSTS: From body filler (Bondo), old paint, primer surfacer, and fiberglass. May contain lead, chromium, or other hazardous metals from older coatings. Fine particles penetrate deep into lungs.

6. METAL FUMES: From welding and cutting operations (MIG, TIG, plasma, oxy-fuel). Fumes contain iron oxide, manganese, chromium, nickel, and zinc depending on metals being welded. Can cause metal fume fever, manganism, and respiratory damage.

7. LEAD: Still present in older vehicles and some specialty coatings. Sanding, grinding, or welding on lead-containing surfaces releases lead dust and fumes. OSHA PEL: 50 μg/m³. Blood lead monitoring required above Action Level (30 μg/m³).

Source: OSHA Autobody Repair and Refinishing — Hazards and Solutions (osha.gov/autobody/hazards-solutions). Public domain.', 0),

((SELECT id FROM public.documents WHERE title = 'OSHA Autobody Hazards & Solutions Guide'),
'PHYSICAL HAZARDS IN AUTO BODY SHOPS:

1. NOISE: From air tools (grinders, sanders, impact wrenches), spray guns, compressors, and hammering. Prolonged exposure above 85 dBA causes permanent hearing loss. OSHA requires hearing conservation program at 85 dBA (Action Level) and hearing protection at 90 dBA (PEL).

2. ERGONOMIC HAZARDS: Repetitive motions from sanding, grinding, and spraying. Awkward postures when working under vehicles, inside engine bays, or reaching overhead. Heavy lifting of body panels, bumpers, and assemblies. Can cause carpal tunnel syndrome, rotator cuff injuries, and back injuries.

3. SLIPS, TRIPS, AND FALLS: Oil, grease, coolant, and paint on walking surfaces. Air hoses, power cords, and parts on floor. Poor lighting in work areas.

4. CUTS AND LACERATIONS: From sharp sheet metal edges, broken glass, cutting tools, and grinding discs. Flying debris from grinding, welding, and sanding.

5. BURNS: From welding, cutting, and hot surfaces. Chemical burns from solvents, acids (rust treatment), and hardeners.

6. COMPRESSED AIR HAZARDS: Compressed air used for cleaning at pressures above 30 psi can cause serious injury. Air can enter the bloodstream through cuts or puncture the skin. OSHA requires compressed air for cleaning to be reduced to below 30 psi with chip guarding and eye protection.

7. VEHICLE LIFTING HAZARDS: Improper use of lifts, jacks, and jack stands. Vehicle falling from improperly secured lifting equipment. All vehicle lifts must be inspected regularly per ANSI/ALI ALOIM standard.

Source: OSHA Autobody Repair and Refinishing (osha.gov/autobody). Public domain.', 1),

((SELECT id FROM public.documents WHERE title = 'OSHA Autobody Hazards & Solutions Guide'),
'OSHA REQUIRED CONTROLS AND SOLUTIONS FOR AUTO BODY SHOPS:

HIERARCHY OF CONTROLS (most effective to least effective):

1. ELIMINATION/SUBSTITUTION:
   - Use water-based paints instead of solvent-based where possible
   - Use HVLP spray guns instead of conventional high-pressure guns (reduces overspray 30-50%)
   - Substitute less toxic solvents when available
   - Use dustless sanding systems with vacuum extraction

2. ENGINEERING CONTROLS:
   - Spray booth ventilation: Downdraft booths are preferred over crossdraft. Must maintain minimum face velocity of 100 fpm (crossdraft) or adequate downdraft velocity
   - Local exhaust ventilation on sanding stations and welding areas
   - Dust collection systems with HEPA filtration
   - Prep station ventilation for sanding and masking
   - Airflow indicators or audible alarms on spray booths (required per 1910.94)

3. ADMINISTRATIVE CONTROLS:
   - Written Hazard Communication Program (HazCom/GHS)
   - Safety Data Sheets (SDS) readily accessible for all chemicals
   - Worker training on chemical hazards, PPE use, and emergency procedures
   - Job rotation to reduce repetitive motion exposure
   - Regular housekeeping to prevent slips and fires

4. PERSONAL PROTECTIVE EQUIPMENT (PPE):
   - Respiratory protection: Supplied-air respirator (SAR) for isocyanate spraying; half-face APR with OV/P100 for sanding and mixing
   - Eye/face protection: Safety glasses, goggles, or face shields per operation
   - Hearing protection: When noise exceeds 85 dBA
   - Chemical-resistant gloves: Nitrile for most solvents; check SDS for specific recommendations
   - Protective coveralls: Tyvek or similar for spray operations
   - Steel-toe boots: For all shop floor work

Source: OSHA Autobody Repair and Refinishing — Hazards and Solutions (osha.gov/autobody/hazards-solutions). Public domain.', 2);


-- ─── Doc 2: OSHA Applicable Standards for Auto Body Shops ────
INSERT INTO public.documents (title, description, doc_type, tab_slug, language, tags, is_active) VALUES
('OSHA Standards Applicable to Auto Body Shops',
 'Complete list of OSHA standards (29 CFR 1910) that apply to automotive body repair and refinishing operations. Source: osha.gov/autobody/standards (public domain).',
 'manual', NULL, 'en',
 ARRAY['osha', 'standards', 'regulations', '29 cfr', '1910', 'compliance', 'legal', 'requirements', 'inspection'],
 true);

INSERT INTO public.document_chunks (document_id, content, chunk_index) VALUES
((SELECT id FROM public.documents WHERE title = 'OSHA Standards Applicable to Auto Body Shops'),
'OSHA STANDARDS APPLICABLE TO AUTO BODY SHOPS (29 CFR 1910):

SPRAY FINISHING AND PAINTING:
- 29 CFR 1910.94(c) — Spray Finishing Operations: Requires spray areas to be ventilated with adequate air velocity. Spray booths must have airflow indicators or audible alarms. Defines construction requirements for spray booths including fire resistance ratings.

HAZARD COMMUNICATION:
- 29 CFR 1910.1200 — Hazard Communication Standard (HazCom 2012/GHS): Requires written hazard communication program, Safety Data Sheets (SDS) for all hazardous chemicals, container labeling with GHS pictograms, signal words, and hazard statements, and employee training on chemical hazards.

SDS 16-Section Format (GHS):
Section 1: Identification | Section 2: Hazard(s) Identification | Section 3: Composition/Ingredients | Section 4: First-Aid Measures | Section 5: Fire-Fighting Measures | Section 6: Accidental Release | Section 7: Handling and Storage | Section 8: Exposure Controls/PPE | Section 9: Physical/Chemical Properties | Section 10: Stability and Reactivity | Section 11: Toxicological Info | Section 12: Ecological Info | Section 13: Disposal | Section 14: Transport | Section 15: Regulatory Info | Section 16: Other Info

RESPIRATORY PROTECTION:
- 29 CFR 1910.134 — Respiratory Protection Standard: Requires written respiratory protection program, medical evaluation before fit testing, annual fit testing for tight-fitting respirators, training on use/maintenance/limitations, proper storage and maintenance, and NIOSH-approved respirators only.

For isocyanate exposure (2K clearcoats, primers, hardeners): OSHA mandates supplied-air respirators (SAR) due to poor warning properties of isocyanates. Half-face air-purifying respirators with OV cartridges + P100 particulate filters may be acceptable for mixing and limited spraying if proper training and fit testing are completed.

Source: OSHA Autobody Repair and Refinishing — Standards (osha.gov/autobody/standards). Public domain.', 0),

((SELECT id FROM public.documents WHERE title = 'OSHA Standards Applicable to Auto Body Shops'),
'ADDITIONAL OSHA STANDARDS FOR AUTO BODY SHOPS:

PERSONAL PROTECTIVE EQUIPMENT:
- 29 CFR 1910.132 — General PPE Requirements: Employer must perform hazard assessment to determine required PPE for each task. PPE must be provided at no cost to employees.
- 29 CFR 1910.133 — Eye and Face Protection: Safety glasses, goggles, or face shields required based on hazard. Must meet ANSI Z87.1 standard.
- 29 CFR 1910.135 — Head Protection: Hard hats where overhead hazards exist.
- 29 CFR 1910.136 — Foot Protection: Safety-toe footwear in areas with crushing/penetration hazards.
- 29 CFR 1910.137 — Electrical Protective Equipment
- 29 CFR 1910.138 — Hand Protection: Appropriate gloves for chemical, cut, abrasion, and heat hazards.

FLAMMABLE AND COMBUSTIBLE LIQUIDS:
- 29 CFR 1910.106 — Flammable Liquids: Storage requirements (flammable cabinets, quantities), dispensing requirements, ventilation requirements, grounding and bonding to prevent static discharge, and fire safety.

WELDING, CUTTING, AND BRAZING:
- 29 CFR 1910.252 — General Welding Requirements: Fire prevention (fire watch, 35-ft clear radius from combustibles), ventilation requirements for confined spaces, and PPE (welding helmet, gloves, jacket).
- 29 CFR 1910.253 — Oxygen-Fuel Gas Welding/Cutting
- 29 CFR 1910.254 — Arc Welding and Cutting

ELECTRICAL SAFETY:
- 29 CFR 1910.301-.399 — Electrical Standards: Proper grounding of equipment, GFCI protection in wet areas, lockout/tagout for electrical maintenance, and no damaged cords or exposed wiring.

NOISE:
- 29 CFR 1910.95 — Occupational Noise Exposure: 90 dBA PEL (8-hour TWA), 85 dBA Action Level triggers hearing conservation program, annual audiometric testing required above Action Level.

WALKING/WORKING SURFACES:
- 29 CFR 1910.22 — General Housekeeping: Floors must be clean, dry, and free of hazards. Aisles and passageways must be clear and properly marked.

FIRE SAFETY:
- 29 CFR 1910.157 — Portable Fire Extinguishers: Must be accessible and properly maintained. Employees must be trained annually on fire extinguisher use.
- 29 CFR 1910.38 — Emergency Action Plans: Written plan for fire, chemical spill, and evacuation. Annual training and drills.

Source: OSHA Autobody Repair and Refinishing — Standards (osha.gov/autobody/standards). Public domain.', 1);


-- ─── Doc 3: OSHA Respiratory Protection for Auto Painters ─────
INSERT INTO public.documents (title, description, doc_type, tab_slug, language, tags, is_active) VALUES
('Respiratory Protection for Auto Body Painters',
 'Detailed guide on OSHA respiratory protection requirements for spray painting operations in collision repair, with focus on isocyanate exposure from 2K products. Source: OSHA 29 CFR 1910.134 (public domain).',
 'procedure', 'painting', 'en',
 ARRAY['respiratory', 'respirator', 'ppe', 'isocyanate', 'spray painting', 'supplied air', 'fit test', '2k', 'clearcoat', 'osha', 'safety'],
 true);

INSERT INTO public.document_chunks (document_id, content, chunk_index) VALUES
((SELECT id FROM public.documents WHERE title = 'Respiratory Protection for Auto Body Painters'),
'RESPIRATORY PROTECTION FOR AUTO BODY PAINTERS

WHY RESPIRATORY PROTECTION IS CRITICAL:
Auto body painters face some of the highest chemical exposure risks in the collision repair industry. The primary hazard is isocyanate exposure from 2K (two-component) clearcoats, primers, and hardeners. Isocyanates (HDI, TDI) are the leading cause of occupational asthma and can cause permanent respiratory sensitization.

WHEN RESPIRATORY PROTECTION IS REQUIRED:
- Spray painting with any 2K products (clearcoats, primers, hardeners containing isocyanates)
- Mixing paints, reducers, and hardeners
- Sanding cured 2K products (dust may contain unreacted isocyanates)
- Working in or near spray booths during active spraying
- Any operation where ventilation alone cannot reduce exposure below OSHA PELs

TYPES OF RESPIRATORS FOR AUTO BODY PAINTING:

1. SUPPLIED-AIR RESPIRATOR (SAR) — REQUIRED FOR ISOCYANATE SPRAYING:
   - Full-face or hood/helmet style connected to Grade D breathing air
   - Provides the highest level of protection for spray painting
   - OSHA mandates SAR for isocyanate spraying due to poor warning properties
   - Air supply must meet Grade D quality: 19.5-23.5% oxygen, CO below 10 ppm, CO₂ below 1000 ppm, oil below 5 mg/m³, no detectable odor
   - Airline length typically 50-300 feet; must have proper fittings and air filtration

2. HALF-FACE AIR-PURIFYING RESPIRATOR (APR):
   - Acceptable for: mixing operations, touch-up spraying, sanding, grinding
   - Must use organic vapor (OV) cartridges + P100 particulate pre-filters
   - Change cartridges per manufacturer schedule or when breakthrough detected
   - NOT recommended for full isocyanate spray painting operations
   - Must be NIOSH-approved

3. N95 DISPOSABLE RESPIRATOR:
   - Only acceptable for nuisance dust during light sanding (non-isocyanate surfaces)
   - NOT acceptable for any chemical vapor exposure
   - NOT acceptable for isocyanate dust

Source: OSHA 29 CFR 1910.134 and OSHA interpretations on isocyanate respiratory protection. Public domain.', 0),

((SELECT id FROM public.documents WHERE title = 'Respiratory Protection for Auto Body Painters'),
'RESPIRATORY PROTECTION PROGRAM REQUIREMENTS (29 CFR 1910.134):

Every auto body shop using respirators MUST have a written Respiratory Protection Program that includes:

1. WRITTEN PROCEDURES: Specific to your shop covering respirator selection, use, cleaning, storage, and maintenance.

2. MEDICAL EVALUATION: Before any employee can be fit tested or use a respirator, they must complete the OSHA Respirator Medical Evaluation Questionnaire (Appendix C of 1910.134). A physician or licensed health care professional (PLHCP) must review and approve the employee for respirator use. Must be repeated if health conditions change.

3. FIT TESTING: Required annually for all tight-fitting respirators (half-face and full-face). Qualitative fit test (Bitrex, saccharin, irritant smoke) or quantitative fit test. Employee must use the same make/model/size respirator they were tested with. Must be repeated if employee has facial changes (weight gain/loss, dental work, scarring).

4. TRAINING: Initial and annual training covering: why the respirator is necessary, limitations and capabilities of the respirator, proper donning/doffing and seal check procedures, maintenance and storage, and how to recognize medical signs that may limit use.

5. SEAL CHECK: User must perform positive and negative pressure seal checks every time the respirator is donned. Positive: exhale gently, face piece should bulge slightly without leaking. Negative: inhale, face piece should collapse slightly toward face.

6. CLEANING AND STORAGE: Respirators must be cleaned and disinfected after each use (or daily for exclusive-use respirators). Stored in sealed bag away from dust, chemicals, and sunlight. Inspect before each use for cracks, tears, and valve condition.

7. CARTRIDGE CHANGE SCHEDULE: Must have documented change schedule based on: manufacturer recommendations, type of chemicals in use, concentration levels, humidity, and breathing rate. When in doubt, change more frequently. If you smell chemicals through the respirator, STOP WORK and change cartridges immediately.

IMPORTANT: Facial hair (beards, stubble) prevents a proper seal and makes tight-fitting respirators ineffective. Employees with facial hair must use loose-fitting powered air-purifying respirators (PAPR) or supplied-air hoods.

Source: OSHA 29 CFR 1910.134 — Respiratory Protection. Public domain.', 1);


-- ═══════════════════════════════════════════════════════════════
-- SECTION 2: EPA REGULATIONS FOR COLLISION REPAIR (Public Domain)
-- ═══════════════════════════════════════════════════════════════

-- ─── Doc 4: EPA VOC Limits for Auto Refinish Coatings ─────────
INSERT INTO public.documents (title, description, doc_type, tab_slug, language, tags, is_active) VALUES
('EPA VOC Limits for Automobile Refinish Coatings',
 'Federal VOC content limits for automotive refinishing coatings under 40 CFR 59 Subpart B. Includes limits for primers, topcoats, clearcoats, and specialty coatings. Source: ecfr.gov (public domain).',
 'manual', 'painting', 'en',
 ARRAY['epa', 'voc', 'volatile organic compounds', 'emissions', 'paint', 'primer', 'clearcoat', 'topcoat', 'regulations', 'compliance', '40 cfr 59', 'environmental'],
 true);

INSERT INTO public.document_chunks (document_id, content, chunk_index) VALUES
((SELECT id FROM public.documents WHERE title = 'EPA VOC Limits for Automobile Refinish Coatings'),
'EPA VOC LIMITS FOR AUTOMOBILE REFINISH COATINGS (40 CFR 59, SUBPART B)

OVERVIEW:
The EPA regulates the volatile organic compound (VOC) content of automobile refinish coatings under the National Volatile Organic Compound Emission Standards. These limits apply to manufacturers, importers, and distributors — but as a body shop, you must use compliant products and maintain proper records.

MAXIMUM VOC CONTENT LIMITS BY COATING CATEGORY:

| Coating Category                | g/L of coating | lb/gal |
|--------------------------------|----------------|--------|
| Pretreatment Wash Primers       | 780            | 6.5    |
| Primers / Primer Surfacers      | 580            | 4.8    |
| Primer Sealers                  | 550            | 4.6    |
| Single-Stage / Two-Stage Topcoats| 600           | 5.0    |
| Multi-Stage Topcoats (3+ stages)| 630            | 5.2    |
| Multi-Colored Topcoats          | 680            | 5.7    |

NOTE: These are FEDERAL minimums. Many states (California, New York, New Jersey, etc.) have STRICTER VOC limits through their own regulations. Always check your state and local air quality district requirements.

WHAT THIS MEANS FOR YOUR SHOP:
- Only use automotive refinish coatings that meet or beat these VOC limits
- Check product TDS (Technical Data Sheets) for VOC content in g/L
- Keep records of coatings purchased (invoices showing product names and quantities)
- Some states require annual reporting of coating and solvent usage
- Water-based basecoats typically have much lower VOC than solvent-based
- VOC content is measured "as applied" (after mixing with reducers/hardeners)

CALCULATING VOC CONTENT:
VOC (g/L) = (Weight of VOC per liter of coating) / (Volume of coating minus water and exempt solvents)
Your paint supplier should provide VOC content on the TDS for each product in its ready-to-spray formulation.

Source: 40 CFR 59 Subpart B — National Volatile Organic Compound Emission Standards for Automobile Refinish Coatings (ecfr.gov). Public domain.', 0);


-- ─── Doc 5: EPA 6H Rule — Spray Booth Requirements ───────────
INSERT INTO public.documents (title, description, doc_type, tab_slug, language, tags, is_active) VALUES
('EPA 6H Rule — Spray Booth Compliance for Auto Body Shops',
 'EPA National Emission Standards (NESHAP) for auto body refinishing under 40 CFR 63 Subpart HHHHHH (6H Rule). Covers spray booth requirements, HVLP guns, recordkeeping. Source: ecfr.gov (public domain).',
 'manual', 'painting', 'en',
 ARRAY['epa', '6h rule', 'neshap', 'spray booth', 'hvlp', 'emissions', 'hap', 'ventilation', 'compliance', 'regulations', '40 cfr 63', 'environmental'],
 true);

INSERT INTO public.document_chunks (document_id, content, chunk_index) VALUES
((SELECT id FROM public.documents WHERE title = 'EPA 6H Rule — Spray Booth Compliance for Auto Body Shops'),
'EPA 6H RULE — NESHAP FOR AUTO BODY REFINISHING (40 CFR 63, SUBPART HHHHHH)

WHAT IS THE 6H RULE?
The National Emission Standards for Hazardous Air Pollutants (NESHAP) Subpart HHHHHH (commonly called the "6H Rule") regulates hazardous air pollutant (HAP) emissions from paint stripping and miscellaneous surface coating operations at area sources, including auto body refinishing shops.

WHO DOES IT APPLY TO?
Any auto body shop that spray applies coatings containing compounds of chromium (Cr), lead (Pb), manganese (Mn), nickel (Ni), or cadmium (Cd) to motor vehicles or mobile equipment. In practice, this covers most collision repair shops.

SPRAY BOOTH REQUIREMENTS:
1. Spray booths and preparation stations must be FULLY ENCLOSED with a full roof, four complete walls or side curtains
2. Must be ventilated at NEGATIVE PRESSURE so air flows inward
3. Exhaust must be filtered to capture paint overspray particulate
4. Exception: Water-wash spray booths operated per manufacturer specifications are exempt from the enclosure requirement

SPRAY GUN REQUIREMENTS:
1. Must use one of the following spray gun technologies:
   - HVLP (High Volume Low Pressure) — most common in body shops
   - Electrostatic application
   - Airless spray
   - Air-assisted airless spray
   - Any technology with transfer efficiency equivalent to or better than HVLP
2. Conventional high-pressure spray guns are NOT compliant with the 6H rule

PAINTER TRAINING REQUIREMENTS:
1. All painters must complete training in the proper spray application of coatings
2. Training must cover: spray gun setup and optimization, proper spray technique to minimize overspray, equipment cleaning procedures, and environmental compliance
3. Training must be completed before initial coating application and refreshed as needed
4. Training records must be maintained and available for inspection

RECORDKEEPING:
- Maintain records of all coatings containing target HAP metals
- Maintain painter training certifications
- Keep spray gun equipment documentation (type, manufacturer)
- Records must be kept for a minimum of 5 years
- Must be available for EPA or state inspector review

Source: 40 CFR 63 Subpart HHHHHH — Paint Stripping and Miscellaneous Surface Coating Operations at Area Sources (ecfr.gov). Public domain.', 0);


-- ═══════════════════════════════════════════════════════════════
-- SECTION 3: NIOSH BODY SHOP SAFETY GUIDES (Public Domain)
-- ═══════════════════════════════════════════════════════════════

-- ─── Doc 6: NIOSH — Sanding Dust Control in Body Shops ───────
INSERT INTO public.documents (title, description, doc_type, tab_slug, language, tags, is_active) VALUES
('NIOSH Guide — Sanding Dust Control in Auto Body Shops',
 'NIOSH hazard control guide (Publication 96-105) on controlling dust exposure from sanding operations in auto body repair shops. Covers ventilated sanders, dust collection, and exposure reduction. Source: CDC/NIOSH (public domain).',
 'procedure', 'auto-body-repairs', 'en',
 ARRAY['niosh', 'sanding', 'dust', 'body filler', 'bondo', 'ventilation', 'hvlv', 'dust collection', 'exposure', 'health', 'safety', 'lead', 'chromium'],
 true);

INSERT INTO public.document_chunks (document_id, content, chunk_index) VALUES
((SELECT id FROM public.documents WHERE title = 'NIOSH Guide — Sanding Dust Control in Auto Body Shops'),
'NIOSH: CONTROL OF DUSTS FROM SANDING IN AUTO BODY REPAIR SHOPS (Publication 96-105)

THE HAZARD:
Sanding operations in auto body shops generate fine airborne dust containing hazardous substances including:
- Polyester body filler (Bondo) particles
- Old paint residue (may contain lead, chromium, or other heavy metals)
- Primer surfacer dust
- Fiberglass dust from composite panels
- Aluminum dust from aluminum body panels (increasingly common)

Fine dust particles (respirable fraction, under 10 micrometers) penetrate deep into the lungs and can cause:
- Respiratory irritation and chronic bronchitis
- Lead poisoning (from older vehicle coatings)
- Chromium-related lung disease and cancer
- Pulmonary fibrosis from prolonged exposure

RECOMMENDED ENGINEERING CONTROLS:

1. VENTILATED MECHANICAL SANDERS (HVLV — High Velocity Low Volume):
   - Use rotary/orbital sanders and straight-line/reciprocating sanders equipped with built-in local exhaust ventilation
   - The HVLV system uses high air velocity at the sanding pad holes to capture dust at the source
   - Connected to a portable or central vacuum/dust collection unit with HEPA filtration
   - Reduces airborne dust concentrations by 80-95% compared to unventilated sanding
   - Brands commonly used: Festool, Mirka (DEROS/DEOS), 3M (Clean Sanding), Dynabrade

2. VENTILATED PREP STATIONS:
   - Dedicated sanding/prep areas with downdraft or crossdraft ventilation
   - Floor grates or wall-mounted exhaust remove dust from the breathing zone
   - Minimum recommended airflow: 50-100 fpm across the work area
   - Keeps dust contained and away from other shop areas

3. CENTRAL DUST COLLECTION:
   - Ducted vacuum system serving multiple sanding stations
   - HEPA-filtered exhaust (99.97% efficiency at 0.3 microns)
   - Regular filter replacement schedule based on use
   - Automatic filter cleaning (pulse-jet) systems reduce maintenance

4. WET SANDING:
   - Use wet sanding techniques where feasible (finish sanding, color sanding)
   - Virtually eliminates airborne dust
   - Requires waterproof sandpaper (silicon carbide) and water supply
   - Limitation: not practical for heavy body filler shaping or large areas

PERSONAL PROTECTIVE EQUIPMENT FOR SANDING:
- Half-face APR with P100 particulate filters (minimum)
- Safety glasses or goggles
- Hearing protection (sanders can exceed 85 dBA)
- Disposable coveralls to prevent take-home contamination
- Gloves appropriate for the surface being sanded

Source: NIOSH Publication No. 96-105 — Control of Dusts From Sanding in Autobody Repair Shops (cdc.gov/niosh). Public domain.', 0);


-- ─── Doc 7: NIOSH — Paint Overspray Control ──────────────────
INSERT INTO public.documents (title, description, doc_type, tab_slug, language, tags, is_active) VALUES
('NIOSH Guide — Paint Overspray Control in Auto Body Shops',
 'NIOSH hazard control guide (Publication 96-106) on controlling paint overspray exposure in auto body repair shops. Covers HVLP guns, spray booth design, and ventilation. Source: CDC/NIOSH (public domain).',
 'procedure', 'painting', 'en',
 ARRAY['niosh', 'overspray', 'paint', 'hvlp', 'spray booth', 'ventilation', 'transfer efficiency', 'spray gun', 'health', 'safety', 'exposure'],
 true);

INSERT INTO public.document_chunks (document_id, content, chunk_index) VALUES
((SELECT id FROM public.documents WHERE title = 'NIOSH Guide — Paint Overspray Control in Auto Body Shops'),
'NIOSH: CONTROL OF PAINT OVERSPRAY IN AUTOBODY REPAIR SHOPS (Publication 96-106)

THE HAZARD:
Paint overspray contains hazardous components including:
- Organic solvents (toluene, xylene, MEK, acetone, naphtha)
- Isocyanates (HDI, TDI) from 2K clearcoats and primers
- Heavy metals (chromium, lead) from pigments
- Polyester and acrylic resins
Workers exposed to paint overspray face respiratory sensitization, occupational asthma, neurological effects from solvents, and potential cancer risk from certain pigments.

HVLP SPRAY GUNS — THE PRIMARY ENGINEERING CONTROL:

High Volume Low Pressure (HVLP) spray guns are the single most effective control for reducing paint overspray in auto body shops.

HOW HVLP WORKS:
- Atomizes paint at LOW air pressure (10 psi or less at the air cap)
- Uses HIGH VOLUME of air to move paint to the surface
- Result: 65-75% transfer efficiency vs. 25-45% for conventional guns
- Cuts paint overspray concentrations by approximately 50%
- Less material waste = cost savings on paint

HVLP vs. CONVENTIONAL COMPARISON:
| Feature              | Conventional | HVLP        |
|---------------------|-------------|-------------|
| Air cap pressure     | 40-60 psi   | ≤10 psi     |
| Transfer efficiency  | 25-45%      | 65-75%      |
| Overspray            | High        | Low         |
| Paint usage          | More        | 30-50% less |
| Finish quality       | Good        | Excellent   |
| Atomization          | Fine        | Slightly coarser |

PROPER HVLP TECHNIQUE TO MINIMIZE OVERSPRAY:
1. Maintain 6-8 inches spray distance (closer than conventional)
2. Use 50% overlap on each pass
3. Keep gun perpendicular to surface — avoid arcing
4. Use proper fluid needle/nozzle size for the material being sprayed
5. Adjust air pressure at the gun (not just the regulator) to 10 psi or less at the cap
6. Use a spray-out card to verify pattern before painting
7. Apply in thin, even coats rather than heavy wet coats

SPRAY BOOTH DESIGN FOR OVERSPRAY CONTROL:
1. DOWNDRAFT BOOTHS (preferred):
   - Air enters from ceiling plenum, exits through floor grates
   - Overspray is pulled down and away from the painter
   - Best protection for the painter breathing zone
   - Requires pit or raised floor construction

2. CROSSDRAFT BOOTHS:
   - Air enters from one end, exits from opposite end
   - Less expensive to install than downdraft
   - Painter must position to keep overspray flowing away
   - Minimum face velocity: 100 feet per minute (fpm)

3. SEMI-DOWNDRAFT BOOTHS:
   - Air enters from ceiling at front, exits at floor in rear
   - Compromise between downdraft and crossdraft
   - Good airflow pattern for most refinishing work

ALL SPRAY BOOTHS MUST:
- Have exhaust filters to capture overspray particulate
- Maintain proper airflow (check regularly with anemometer)
- Have airflow indicators or audible alarms (OSHA 1910.94)
- Be kept clean — paint buildup is a fire hazard
- Have proper lighting (100 foot-candles minimum per OSHA)
- Filter replacement schedule based on pressure differential

Source: NIOSH Publication No. 96-106 — Control of Paint Overspray in Autobody Repair Shops (cdc.gov/niosh). Public domain.', 0);


-- ─── Doc 8: Hazard Communication & SDS Guide for Body Shops ──
INSERT INTO public.documents (title, description, doc_type, tab_slug, language, tags, is_active) VALUES
('Hazard Communication & SDS Guide for Auto Body Shops',
 'Practical guide to OSHA Hazard Communication Standard (HazCom/GHS) compliance for collision repair shops. Covers SDS management, labeling, training, and the 16-section SDS format. Source: OSHA 29 CFR 1910.1200 (public domain).',
 'manual', NULL, 'en',
 ARRAY['hazcom', 'ghs', 'sds', 'safety data sheet', 'msds', 'labeling', 'chemical safety', 'pictograms', 'training', 'osha', 'hazard communication', 'right to know'],
 true);

INSERT INTO public.document_chunks (document_id, content, chunk_index) VALUES
((SELECT id FROM public.documents WHERE title = 'Hazard Communication & SDS Guide for Auto Body Shops'),
'HAZARD COMMUNICATION (HazCom/GHS) FOR AUTO BODY SHOPS

WHAT IS HAZCOM?
The OSHA Hazard Communication Standard (29 CFR 1910.1200) — also known as the "Right to Know" law — requires employers to inform workers about hazardous chemicals in the workplace. The standard was updated to align with the Globally Harmonized System (GHS) for classification and labeling.

WHY IT MATTERS FOR BODY SHOPS:
Auto body shops use dozens of hazardous chemicals daily: paints, primers, clearcoats, hardeners, reducers, solvents, body fillers, adhesives, cleaners, and degreasers. Workers must understand the hazards and protections for each.

YOUR SHOP MUST HAVE:

1. WRITTEN HAZARD COMMUNICATION PROGRAM:
   - List of all hazardous chemicals in the shop
   - How SDS sheets are maintained and accessed
   - How containers are labeled
   - Employee training procedures
   - Must be available to all employees

2. SAFETY DATA SHEETS (SDS) FOR EVERY CHEMICAL:
   - Must be readily accessible during every work shift
   - Can be electronic (computer/tablet) if accessible in the work area
   - Must be in English (additional languages as needed)
   - Must be the 16-section GHS format

3. CONTAINER LABELING:
   All containers must have:
   - Product identifier (name matching the SDS)
   - Signal word: "DANGER" (severe hazards) or "WARNING" (less severe)
   - GHS Hazard Pictograms (red diamond-bordered symbols)
   - Hazard statements describing nature of hazard
   - Precautionary statements for handling, storage, disposal
   - Manufacturer/supplier contact information

GHS PICTOGRAMS YOU WILL SEE IN A BODY SHOP:
🔥 Flame — Flammable liquids (reducers, solvents, paints)
💀 Skull and Crossbones — Acute toxicity (methylene chloride, some solvents)
⚠️ Exclamation Mark — Irritant, skin sensitizer, narcotic effects
🫁 Health Hazard — Carcinogen, respiratory sensitizer (isocyanates, chromium)
🧪 Corrosion — Corrosive to metals or skin (acids, some cleaners)
🌊 Environment — Hazardous to aquatic life
⭕ Oxidizer — Oxidizing solids/liquids
🔴 Gas Cylinder — Compressed gases

HOW TO READ AN SDS — THE CRITICAL SECTIONS FOR TECHNICIANS:
Section 2 (Hazard Identification): Tells you what the danger is
Section 4 (First-Aid): What to do if exposed
Section 7 (Handling & Storage): How to safely use and store
Section 8 (Exposure Controls/PPE): What protective equipment to wear
Section 11 (Toxicological Info): Health effects of exposure

EMPLOYEE TRAINING REQUIREMENTS:
- Initial training when first assigned to work with hazardous chemicals
- Training when new chemicals or hazards are introduced
- Must cover: location of SDS and written program, how to read SDS and labels, physical and health hazards of chemicals in work area, protective measures (PPE, ventilation, procedures), and what to do in an emergency (spill, exposure, fire)

Source: OSHA 29 CFR 1910.1200 — Hazard Communication Standard. Public domain.', 0);


-- ═══════════════════════════════════════════════════════════════
-- SECTION 4: EPA ENVIRONMENTAL COMPLIANCE (Public Domain)
-- ═══════════════════════════════════════════════════════════════

-- ─── Doc 9: EPA Hazardous Waste Management for Body Shops ─────
INSERT INTO public.documents (title, description, doc_type, tab_slug, language, tags, is_active) VALUES
('EPA Hazardous Waste Management for Auto Body Shops',
 'Guide to EPA hazardous waste regulations for collision repair shops. Covers waste identification, storage, disposal, and recordkeeping for paint waste, solvents, and chemicals. Source: EPA RCRA regulations (public domain).',
 'manual', 'detailing-qc', 'en',
 ARRAY['epa', 'hazardous waste', 'rcra', 'disposal', 'solvent', 'paint waste', 'environmental', 'compliance', 'storage', 'manifesting', 'regulations'],
 true);

INSERT INTO public.document_chunks (document_id, content, chunk_index) VALUES
((SELECT id FROM public.documents WHERE title = 'EPA Hazardous Waste Management for Auto Body Shops'),
'EPA HAZARDOUS WASTE MANAGEMENT FOR AUTO BODY SHOPS

COMMON HAZARDOUS WASTES IN A BODY SHOP:
1. Spent solvents and reducers (used for cleaning guns, thinning paint)
2. Paint waste and residues from spray operations
3. Used paint booth filters (may contain heavy metals)
4. Waste body filler and activated hardeners
5. Used oil and coolants
6. Spent abrasives contaminated with lead or chromium paint
7. Waste aerosol cans (not fully empty)
8. Acid-based rust treatments
9. Used rags soaked with solvents or paints
10. Waste antifreeze contaminated with heavy metals

GENERATOR STATUS — KNOW YOUR CATEGORY:
Your shop is classified based on the amount of hazardous waste generated per month:

Very Small Quantity Generator (VSQG): Less than 220 lbs/month (100 kg)
- Most small body shops fall here
- Can accumulate up to 2,200 lbs on-site
- No time limit on accumulation
- Must still identify waste and use authorized disposal

Small Quantity Generator (SQG): 220 to 2,200 lbs/month
- Can accumulate up to 13,200 lbs on-site
- Must ship waste within 270 days (180 days if using nearby disposal facility)
- Must have contingency plan and emergency procedures

Large Quantity Generator (LQG): More than 2,200 lbs/month
- Must ship waste within 90 days
- Full contingency plan, training, and manifesting requirements

KEY COMPLIANCE REQUIREMENTS:
1. WASTE IDENTIFICATION: Determine if each waste stream is hazardous using EPA characteristic tests (ignitability D001, corrosivity D002, reactivity D003, toxicity D004-D043) or if it appears on EPA listed waste tables (F-list, K-list, P-list, U-list). Most body shop solvent waste is D001 (ignitable) and/or F005 (spent non-halogenated solvents).

2. PROPER STORAGE: Store in labeled, closed containers. Label must say "HAZARDOUS WASTE" with accumulation start date, waste description, and generator info. Keep containers in good condition — no leaks, rust, or bulging. Store on impervious surface with secondary containment. Keep incompatible wastes separated.

3. SOLVENT RECYCLING: Consider on-site solvent recyclers/distillation units. Reduces waste volume by 80-90%. Reclaimed solvent can be reused for gun cleaning. Reduces hazardous waste generation and disposal costs.

4. DISPOSAL: Use only licensed hazardous waste transporters and facilities. Complete hazardous waste manifest for each shipment. Keep manifest copies for minimum 3 years. Never pour solvents down drains, on the ground, or in regular trash.

Source: EPA RCRA regulations (40 CFR 260-270) and EPA guidance for auto body shops. Public domain.', 0);


-- ═══════════════════════════════════════════════════════════════
-- SECTION 5: MANUFACTURER SDS/TDS REFERENCE LINKS (Copyrighted but Free)
-- ═══════════════════════════════════════════════════════════════

-- ─── Doc 10: Paint Manufacturer SDS & TDS Quick Reference ─────
INSERT INTO public.documents (title, description, doc_type, tab_slug, language, tags, is_active) VALUES
('Paint Manufacturer SDS & TDS Database Links',
 'Quick reference guide with direct links to free Safety Data Sheet (SDS) and Technical Data Sheet (TDS) databases from major automotive refinish paint manufacturers. All databases are free to access.',
 'other', 'painting', 'en',
 ARRAY['sds', 'tds', 'ppg', 'axalta', 'cromax', 'sherwin-williams', 'basf', '3m', 'manufacturer', 'paint', 'safety data sheet', 'technical data sheet', 'product information'],
 true);

INSERT INTO public.document_chunks (document_id, content, chunk_index) VALUES
((SELECT id FROM public.documents WHERE title = 'Paint Manufacturer SDS & TDS Database Links'),
'PAINT MANUFACTURER SDS & TDS DATABASE LINKS — FREE ACCESS

Use these manufacturer databases to look up Safety Data Sheets (SDS) and Technical Data Sheets (TDS) for any automotive refinish product. All are free to access — no account required for basic searches.

═══════════════════════════════════════════
PPG REFINISH (Deltron, Envirobase, Global Refinish System)
═══════════════════════════════════════════
SDS Search: https://www.ppg.com/en-US/refinish/support/health-and-safety/sds-search
Document Manager: https://buyat.ppg.com/EHSDocumentManagerPublic/documentsearch.aspx
Product App (free, multilingual): Available on Apple App Store and Google Play Store
Phone for SDS: 1-800-647-6050 (press 1-4)

═══════════════════════════════════════════
AXALTA / CROMAX (Cromax, Standox, Spies Hecker, DuPont Refinish)
═══════════════════════════════════════════
Technical Center (TDS — English & Spanish, bulk download available): https://www.axalta.com/cromax_us/en_US/products/technical-center.html
SDS + TDS Portal: https://sdstds.cromax.com/
Safety Data Sheets: https://www.axalta.com/cromax_us/en_US/products/sds.html
Product Catalog (includes TDS/SDS per product): https://products.axaltacs.com/dcat/us/en/dr/catalog.html
Also includes: Repair Procedures, Mix Machine Configurations, Toner Movement Charts

═══════════════════════════════════════════
SHERWIN-WILLIAMS AUTOMOTIVE FINISHES
═══════════════════════════════════════════
TDS Database: https://tds.sherwin-automotive.com/en/show_region_products/all
SDS Database: https://sds.sherwin-automotive.com/en
Data Sheets Portal: https://www.sherwin-williams.com/painting-contractors/products/data-sheets
Search by product name or code. Includes GHS-SDS, Product Data Sheets (PDS), and Environmental Data Sheets (EDS).

═══════════════════════════════════════════
BASF (Glasurit, R-M)
═══════════════════════════════════════════
Downloads Portal: https://products.basf.com/global/en/downloads
Search by product name/code for TDS and SDS documents.

═══════════════════════════════════════════
3M COLLISION REPAIR PRODUCTS
═══════════════════════════════════════════
3M Automotive Aftermarket: https://www.3m.com/3M/en_US/automotive-aftermarket-us/
3M SDS Search: https://www.3m.com/3M/en_US/company-us/SDS-search/
Covers abrasives, masking, adhesives, sealers, fillers, and buffing compounds.
Phone: 1-800-364-3577

═══════════════════════════════════════════
PAINTDOCS.COM (Multi-Manufacturer SDS Database)
═══════════════════════════════════════════
Free SDS Search Across Brands: https://paintdocs.com/
Aggregates SDS documents from multiple paint manufacturers.

═══════════════════════════════════════════
HOW TO USE THESE DATABASES:
1. Find the product name or code on the container label
2. Go to the manufacturer database above
3. Search by product name, code, or UPC
4. Download or view the SDS (safety) and/or TDS (technical) document
5. Print and add to your shop SDS binder (or save digitally)

TIP: Always check the SDS date — use the most current version. SDS documents are updated when formulations change or new hazard data becomes available.', 0);


-- ─── Doc 11: I-CAR Training Resources Reference ──────────────
INSERT INTO public.documents (title, description, doc_type, tab_slug, language, tags, is_active) VALUES
('I-CAR Collision Repair Training — Resource Guide',
 'Reference guide to I-CAR (Inter-Industry Conference on Auto Collision Repair) training programs for collision repair technicians. Includes certification paths, Gold Class info, and course categories.',
 'other', NULL, 'en',
 ARRAY['i-car', 'training', 'certification', 'gold class', 'platinum', 'continuing education', 'professional development', 'welding', 'structural', 'refinishing'],
 true);

INSERT INTO public.document_chunks (document_id, content, chunk_index) VALUES
((SELECT id FROM public.documents WHERE title = 'I-CAR Collision Repair Training — Resource Guide'),
'I-CAR COLLISION REPAIR TRAINING — RESOURCE GUIDE

WHAT IS I-CAR?
I-CAR (Inter-Industry Conference on Auto Collision Repair) is the leading training organization for the collision repair industry. They develop and deliver training, recognition, and credentialing programs to advance the technical skills of the collision repair workforce.

Website: https://www.i-car.com/
Training Portal: https://www.i-car.com/browse

NOTE: I-CAR courses are subscription/paid. This document provides an overview of available resources. Contact I-CAR or your shop management for access.

CERTIFICATION PATHS FOR TECHNICIANS:

1. I-CAR PLATINUM INDIVIDUAL:
   - Highest individual recognition in collision repair
   - Requires completing role-specific training in one of these roles:
     * Steel Structural Technician
     * Aluminum Structural Technician
     * Non-Structural Technician
     * Refinish Technician
     * Electrical/Mechanical Technician
   - Must maintain through continuing education annually

2. I-CAR GOLD CLASS:
   - Shop-level recognition (not individual)
   - Requires that shop staff are trained to I-CAR standards
   - Gold Class shops are often preferred by insurance companies
   - Demonstrates commitment to quality and training
   - Info: https://info.i-car.com/gold-class

TRAINING CATEGORIES (Paid):
- Structural Repair (steel and aluminum)
- Non-Structural Repair (body filler, panel repair, plastic repair)
- Refinishing (painting, color matching, spray technique)
- Electrical and Mechanical Systems
- Estimating and Damage Analysis
- Welding (MIG, squeeze-type resistance, aluminum MIG)
- Advanced Driver Assistance Systems (ADAS) calibration
- Electric Vehicle (EV) safety and repair

WHY I-CAR MATTERS:
- Insurance companies increasingly require Gold Class certification
- OEM repair procedures often reference I-CAR training
- Keeps technicians current on new vehicle technologies
- ADAS and EV training becoming essential as vehicles evolve

ALTERNATIVES AND SUPPLEMENTS:
- OEM certification programs (Honda ProFirst, Toyota Certified, Ford AQME, etc.)
- ASE certifications (B2-B6 for collision repair)
- Community college collision repair programs
- Manufacturer-specific training (PPG, Axalta, etc.)

Contact I-CAR at 1-800-422-7872 or visit i-car.com for current pricing and course availability.', 0);


-- ═══════════════════════════════════════════════════════════════
-- SECTION 6: ADDITIONAL PRACTICAL KNOWLEDGE
-- ═══════════════════════════════════════════════════════════════

-- ─── Doc 12: Fire Safety in Auto Body Shops ───────────────────
INSERT INTO public.documents (title, description, doc_type, tab_slug, language, tags, is_active) VALUES
('Fire Safety & Prevention in Auto Body Shops',
 'Fire safety requirements and best practices for collision repair shops. Covers flammable storage, spray booth fire prevention, fire extinguisher requirements, and emergency procedures. Source: OSHA 29 CFR 1910 (public domain).',
 'procedure', NULL, 'en',
 ARRAY['fire safety', 'flammable', 'storage', 'fire extinguisher', 'spray booth', 'osha', 'nfpa', 'emergency', 'prevention', 'housekeeping'],
 true);

INSERT INTO public.document_chunks (document_id, content, chunk_index) VALUES
((SELECT id FROM public.documents WHERE title = 'Fire Safety & Prevention in Auto Body Shops'),
'FIRE SAFETY AND PREVENTION IN AUTO BODY SHOPS

Auto body shops handle large quantities of flammable and combustible materials daily. Fire is one of the most serious risks in collision repair.

COMMON IGNITION SOURCES:
- Sparks from grinding, welding, and cutting operations
- Static electricity during paint spraying and solvent transfer
- Electrical equipment (motors, switches, lighting)
- Hot work near flammable materials
- Overloaded electrical circuits
- Improperly discarded smoking materials

FLAMMABLE LIQUID STORAGE (29 CFR 1910.106):
1. Store flammable liquids in approved flammable storage cabinets (yellow, self-closing doors, NFPA 30 compliant)
2. Maximum 60 gallons of flammable liquids or 120 gallons of combustible liquids per cabinet
3. Maximum 25 gallons of flammable liquids outside approved cabinets in a single fire area
4. Keep cabinets closed at all times
5. No smoking or open flames within 20 feet of flammable liquid storage
6. Ground and bond all containers and equipment used to transfer flammable liquids to prevent static discharge

SPRAY BOOTH FIRE PREVENTION:
1. Keep spray booth clean — paint buildup is fuel for a fire
2. Replace exhaust filters regularly (heavy buildup restricts airflow AND is a fire hazard)
3. Overspray accumulation on walls/floor should not exceed 1/8 inch
4. Spray booth electrical equipment must be rated for the classified area (Class I, Division 1 or 2)
5. No open flames, spark-producing equipment, or non-rated electrical devices in the spray booth
6. Spray booth must have fire suppression system (dry chemical or CO2)
7. Emergency shut-off switch must be accessible outside the booth

FIRE EXTINGUISHER REQUIREMENTS (29 CFR 1910.157):
1. ABC dry chemical extinguishers (minimum 10 lb) at every work area
2. Maximum travel distance: 50 feet to the nearest extinguisher
3. Monthly visual inspections (check pressure gauge, pin, tamper seal)
4. Annual professional maintenance and inspection
5. Hydrostatic testing per NFPA schedule
6. Employee training on fire extinguisher use — PASS technique:
   P — Pull the pin
   A — Aim at the base of the fire
   S — Squeeze the handle
   S — Sweep side to side

SOLVENT-SOAKED RAG DISPOSAL:
- Used rags, towels, and wipes soaked with solvents or paints are a spontaneous combustion risk
- Must be placed in approved, self-closing metal containers (red "oily waste" cans)
- Empty containers daily into proper waste disposal
- NEVER leave solvent-soaked rags in piles or open containers

EMERGENCY ACTION PLAN (29 CFR 1910.38):
Every shop must have a written Emergency Action Plan covering:
1. Fire reporting procedures and alarm systems
2. Evacuation routes and assembly points
3. Duties of employees who remain for critical operations
4. Accounting for all employees after evacuation
5. Contact information for fire department and emergency services
6. Annual training and drills

Source: OSHA 29 CFR 1910.106, 1910.157, 1910.38 and NFPA standards. Public domain.', 0);


-- ─── Doc 13: Welding Safety for Body Technicians ──────────────
INSERT INTO public.documents (title, description, doc_type, tab_slug, language, tags, is_active) VALUES
('Welding Safety for Collision Repair Technicians',
 'Safety guide for welding operations in auto body shops covering MIG, resistance spot, and plasma cutting. Includes PPE, ventilation, fire watch, and fume hazards. Source: OSHA 29 CFR 1910.252-254 (public domain).',
 'procedure', 'auto-body-repairs', 'en',
 ARRAY['welding', 'mig', 'spot weld', 'plasma', 'safety', 'ppe', 'fumes', 'fire watch', 'ventilation', 'osha', 'metal fumes'],
 true);

INSERT INTO public.document_chunks (document_id, content, chunk_index) VALUES
((SELECT id FROM public.documents WHERE title = 'Welding Safety for Collision Repair Technicians'),
'WELDING SAFETY FOR COLLISION REPAIR TECHNICIANS

TYPES OF WELDING IN BODY SHOPS:
1. MIG (GMAW) — Gas Metal Arc Welding: Most common in collision repair. Used for structural and non-structural steel and aluminum panel welding.
2. Squeeze-Type Resistance Spot Welding (STRSW): Used to replicate factory spot welds. I-CAR recommended method for many structural joints.
3. Plasma Cutting: For removing damaged panels, spot weld removal, and cutting access holes.
4. Oxy-Fuel Cutting/Brazing: Less common today but still used for heating, brazing, and some cutting.

WELDING FUME HAZARDS:
Welding fumes contain a complex mixture of metal oxides depending on the base metal and filler:
- Iron oxide — respiratory irritant
- Manganese — neurological damage (manganism) similar to Parkinsons
- Chromium (VI) — carcinogen (when welding stainless or coated steels)
- Nickel — respiratory sensitizer and carcinogen
- Zinc — metal fume fever (when welding galvanized steel — very common on vehicle bodies)
- Aluminum oxide — respiratory irritant

SYMPTOMS OF OVEREXPOSURE:
- Metal fume fever: flu-like symptoms 4-12 hours after exposure (especially galvanized steel)
- Respiratory irritation: coughing, shortness of breath
- Long-term: chronic bronchitis, lung function decline, neurological effects

REQUIRED PPE FOR WELDING:
1. Welding helmet: Auto-darkening with shade 10-13 for MIG. Must meet ANSI Z87.1
2. Safety glasses under the helmet (for when shield is up)
3. Welding gloves: Leather gauntlet style rated for MIG welding
4. Welding jacket or flame-resistant (FR) clothing: Cotton or leather. NO synthetic fabrics (they melt)
5. Steel-toe boots with metatarsal protection
6. Hearing protection if noise exceeds 85 dBA
7. Respiratory protection: At minimum, half-face APR with P100 filters for general MIG welding. Supplied-air for extended welding in enclosed areas or on coated metals.

FIRE PREVENTION FOR WELDING (29 CFR 1910.252):
1. Clear all flammable materials within 35 feet of welding operations
2. If combustibles cannot be removed, cover with fire-resistant blankets or shields
3. FIRE WATCH: A designated person with a fire extinguisher must remain for at least 30 minutes after welding is complete
4. Check work area after welding for smoldering materials
5. Never weld near solvent storage, paint mixing areas, or spray booths
6. Disconnect vehicle battery before welding on vehicle (prevents electrical damage and fire)
7. Remove or protect fuel lines, plastic components, and interior trim near the weld area

VENTILATION REQUIREMENTS:
1. General dilution ventilation: Adequate airflow through the welding area
2. Local exhaust ventilation: Fume extraction arm or portable unit positioned within 12-18 inches of the arc
3. Enclosed spaces: Mechanical ventilation required. Natural ventilation alone is NOT sufficient
4. Never weld in a spray booth or near flammable vapors

Source: OSHA 29 CFR 1910.252-254 — Welding, Cutting, and Brazing. Public domain.', 0);


-- ─── Doc 14: Ergonomics & Injury Prevention for Body Techs ───
INSERT INTO public.documents (title, description, doc_type, tab_slug, language, tags, is_active) VALUES
('Ergonomics & Injury Prevention for Body Shop Technicians',
 'Guide to preventing musculoskeletal injuries in collision repair. Covers proper lifting, tool selection, workstation setup, and stretching for common body shop tasks. Source: OSHA ergonomic guidelines (public domain).',
 'procedure', NULL, 'en',
 ARRAY['ergonomics', 'injury prevention', 'lifting', 'repetitive strain', 'carpal tunnel', 'back injury', 'posture', 'tools', 'stretching', 'health'],
 true);

INSERT INTO public.document_chunks (document_id, content, chunk_index) VALUES
((SELECT id FROM public.documents WHERE title = 'Ergonomics & Injury Prevention for Body Shop Technicians'),
'ERGONOMICS AND INJURY PREVENTION FOR BODY SHOP TECHNICIANS

Musculoskeletal disorders (MSDs) are among the most common injuries in collision repair. The combination of repetitive motions, awkward postures, heavy lifting, and vibrating tools creates high risk for chronic injuries.

COMMON INJURIES AND CAUSES:

1. LOWER BACK INJURIES:
   - Lifting heavy panels, bumpers, and assemblies
   - Bending and twisting while working under vehicles
   - Prolonged standing on concrete floors
   Prevention: Use proper lifting technique (bend knees, keep load close), use mechanical aids (lifts, carts, hoists), anti-fatigue floor mats, team lift for heavy items

2. SHOULDER AND ROTATOR CUFF:
   - Overhead sanding, grinding, and painting
   - Repetitive arm movements with heavy tools
   - Reaching into engine bays and trunk areas
   Prevention: Use extension poles for overhead work, take micro-breaks every 20-30 minutes, rotate between tasks, use lightweight tools

3. CARPAL TUNNEL AND WRIST INJURIES:
   - Vibration from orbital sanders, grinders, and impact tools
   - Repetitive trigger squeezing (spray guns, air tools)
   - Forceful gripping of tools
   Prevention: Use low-vibration tools, anti-vibration gloves, ergonomic grip tools, wrist supports, and stretch hands/wrists regularly

4. KNEE INJURIES:
   - Kneeling on hard surfaces for lower panel work
   - Climbing in and out of vehicles
   Prevention: Use knee pads or kneeling mats, use creepers for low work, alternate between kneeling and standing positions

TOOL SELECTION FOR ERGONOMICS:
- Choose lightest tool that does the job
- Prefer tools with vibration dampening
- Use tools with ergonomic grips (textured, cushioned)
- Maintain tools properly (dull blades require more force)
- Use self-vacuuming sanders (reduces cleanup and exposure)

WORKSTATION SETUP:
- Adjust vehicle height on lift to minimize bending and reaching
- Position parts on adjustable stands at waist height for bench work
- Ensure adequate lighting to avoid craning neck
- Keep frequently used tools within arm reach
- Use rolling tool carts to reduce walking and carrying

STRETCHING PROGRAM (2-3 minutes, twice daily):
1. Neck rolls — 5 each direction
2. Shoulder shrugs — 10 reps
3. Wrist flexion/extension — hold each 15 seconds
4. Standing back extension — hold 10 seconds, repeat 3 times
5. Quad stretch — hold each leg 15 seconds
6. Calf raises — 10 reps

VIBRATION EXPOSURE:
Power tools in body shops can produce significant hand-arm vibration. Prolonged exposure causes Hand-Arm Vibration Syndrome (HAVS) — numbness, tingling, and white fingers. Limit continuous vibration exposure to 2 hours and use anti-vibration gloves.

Source: OSHA Ergonomic Guidelines and NIOSH recommendations for auto body shops. Public domain.', 0);

-- ═══════════════════════════════════════════════════════════════
-- VERIFY INSERTED DOCUMENTS
-- ═══════════════════════════════════════════════════════════════
-- After running this script, verify with:
-- SELECT title, doc_type, tab_slug, array_length(tags, 1) as tag_count FROM public.documents WHERE title LIKE '%OSHA%' OR title LIKE '%EPA%' OR title LIKE '%NIOSH%' OR title LIKE '%Manufacturer%' OR title LIKE '%I-CAR%' OR title LIKE '%Fire Safety%' OR title LIKE '%Welding Safety%' OR title LIKE '%Ergonomics%' OR title LIKE '%Hazard Communication%' ORDER BY created_at DESC;
