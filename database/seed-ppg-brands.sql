-- ═══════════════════════════════════════════════════════════════
-- PPG Refinish Brand Product Lines — General Knowledge Base
-- Covers: Shop-Line, OneChoice, Deltron/Deltron NXT, Envirobase HP,
--         Delfleet Essential, Global Refinish System
-- Source: Public product info from PPG, distributors, industry press
-- NOTE: General knowledge. Detailed TDS/SDS to follow.
-- Run in Supabase SQL Editor
-- ═══════════════════════════════════════════════════════════════

-- ─────────────────────────────────────────
-- DOCUMENT 1: PPG Shop-Line System
-- ─────────────────────────────────────────
INSERT INTO public.documents (title, description, doc_type, tab_slug, tags, metadata) VALUES (
  'PPG Shop-Line Refinish System — Complete Product Overview',
  'PPG Shop-Line is an economical refinish system for collision repair and restoration. Provides the ideal balance between performance and price with a compact mixing system. Covers basecoats (JB, JBP), clearcoats (JC series), primers (JP series), sealers, reducers (JR series), and single-stage options.',
  'manual',
  'painting',
  ARRAY['ppg', 'shop-line', 'shopline', 'JB', 'JBP', 'JC', 'JP', 'JR', 'basecoat', 'clearcoat', 'primer', 'sealer', 'reducer', 'economical', 'collision repair'],
  '{"source": "PPG public product information", "manufacturer": "PPG Industries", "type": "product-overview", "brand": "Shop-Line"}'::jsonb
);

INSERT INTO public.document_chunks (document_id, chunk_index, content, metadata)
SELECT id, 0,
  'PPG Shop-Line Refinish System overview. Shop-Line is PPG economical refinish brand providing the ideal balance between performance and price. Compact mixing system covers all aspects of refinishing from pre-treatment to topcoats and clearcoats. Product categories include basecoats, cleaners, clearcoats, compliant system products, hardeners and catalysts, primers and surfacers, reducers thinners and solvents, sealers, single-stage products, and toners and tints. Designed for collision repair shops seeking quality results at a competitive price point. Available through PPG distributors across North America.',
  '{"source": "PPG", "brand": "Shop-Line", "category": "overview"}'::jsonb
FROM public.documents WHERE title = 'PPG Shop-Line Refinish System — Complete Product Overview';

INSERT INTO public.document_chunks (document_id, chunk_index, content, metadata)
SELECT id, 1,
  'PPG Shop-Line Basecoats. JB Basecoat is the original Shop-Line solvent basecoat. JBP Shop-Line Plus Acrylic Urethane Basecoat is the premium option: fast drying, high hiding, excellent color matching. Both use the same reducer system: JR505/JR5560 Fast (55-65°F), JR506/JR5570 Medium (65-75°F), JR507/JR5580 Slow (75-85°F), JR508/JR5590 Very Slow (85-95°F). JC605 Basecoat Blender is used for color blending when added to JB or JBP basecoats, aids in transitioning color into the blend area. Choose reducer speed based on ambient temperature for optimal flow and leveling.',
  '{"source": "PPG", "brand": "Shop-Line", "category": "basecoats"}'::jsonb
FROM public.documents WHERE title = 'PPG Shop-Line Refinish System — Complete Product Overview';

INSERT INTO public.document_chunks (document_id, chunk_index, content, metadata)
SELECT id, 2,
  'PPG Shop-Line Clearcoats. JC60 Universal Clearcoat is the versatile all-purpose clear. JC620 Acrylic Urethane Clearcoat for standard repairs. JC630 4.2 Polyurethane Clearcoat for high-build applications. JC660 4.2 VOC Speed Clear for fast turnaround jobs. JC661 Hi-Gloss Multi-Panel Clear for larger repairs requiring excellent gloss and flow. JC6700 HS European Clearcoat for European-style high-solids finish. JC6800 HS European Speed Clear for fast-drying European-style finish. All clearcoats are compatible with JB and JBP basecoats when used with appropriate hardeners.',
  '{"source": "PPG", "brand": "Shop-Line", "category": "clearcoats"}'::jsonb
FROM public.documents WHERE title = 'PPG Shop-Line Refinish System — Complete Product Overview';

INSERT INTO public.document_chunks (document_id, chunk_index, content, metadata)
SELECT id, 3,
  'PPG Shop-Line Primers, Sealers, and Surfacers. JP37x series Epoxy Primers for direct-to-metal corrosion protection. JP301 Plastic Adhesion Promoter for bare plastic substrates. JP233 1K Acrylic Primer for fast single-component priming. JP202 2K High Build Primer Surfacer for filling and leveling. JP285 2K Urethane Surfacer for heavy build applications. JP315 1K Acrylic Sealer for color holdout and uniform appearance. JP33x 2K Urethane Sealers in multiple colors for sealing before topcoat. Proper primer and sealer selection is critical for adhesion, corrosion resistance, and topcoat appearance.',
  '{"source": "PPG", "brand": "Shop-Line", "category": "primers-sealers"}'::jsonb
FROM public.documents WHERE title = 'PPG Shop-Line Refinish System — Complete Product Overview';

-- ─────────────────────────────────────────
-- DOCUMENT 2: PPG OneChoice Ancillary Products
-- ─────────────────────────────────────────
INSERT INTO public.documents (title, description, doc_type, tab_slug, tags, metadata) VALUES (
  'PPG OneChoice Ancillary Products — Complete Product Overview',
  'PPG OneChoice is the ancillary product brand designed to work with ANY PPG refinish system. Includes epoxy primers (DPLF, DPLV), adhesion promoters (SU470LV, AdPro Max), sealers, surfacers, cleaners (SX, SWX series), and specialty products. Universal compatibility across all PPG paint systems.',
  'manual',
  'painting',
  ARRAY['ppg', 'onechoice', 'one choice', 'DPLF', 'DPLV', 'SU470LV', 'AdPro Max', 'adhesion promoter', 'epoxy primer', 'sealer', 'SX', 'SWX', 'cleaner', 'wax grease remover', 'ancillary'],
  '{"source": "PPG public product information", "manufacturer": "PPG Industries", "type": "product-overview", "brand": "OneChoice"}'::jsonb
);

INSERT INTO public.document_chunks (document_id, chunk_index, content, metadata)
SELECT id, 0,
  'PPG OneChoice Ancillary Products overview. OneChoice is PPG universal ancillary brand designed to work with ANY PPG automotive refinish system including Envirobase HP, Deltron, Shop-Line, and Global Refinish System. Product categories: corrosion-resistant undercoats, trim coatings, wax and grease removers, adhesion promoters, sealers, surfacers, universal matting agent, brush-rollable primer, and innovative solutions for repair and restoration of plastic and vinyl finishes. OneChoice simplifies inventory by providing one set of ancillary products that work across all PPG topcoat systems.',
  '{"source": "PPG", "brand": "OneChoice", "category": "overview"}'::jsonb
FROM public.documents WHERE title = 'PPG OneChoice Ancillary Products — Complete Product Overview';

INSERT INTO public.document_chunks (document_id, chunk_index, content, metadata)
SELECT id, 1,
  'PPG OneChoice Epoxy Primers. DPLF Epoxy Primer is an excellent corrosion-resistant primer providing superior adhesion to properly prepared metal, fiberglass, aluminum substrates and plastic fillers. Available in 6 colors. Direct-to-metal capable. Can be used as primer or sealer. DPLV 2.1 VOC Low VOC Epoxy Primer (National Rule) requires no induction time, lays down smoother, sands more easily, and as sealer provides faster hiding of topcoat. Available as DPLV305x series. DP90LF is another epoxy primer option. All OneChoice epoxy primers are compatible with all PPG topcoat systems.',
  '{"source": "PPG", "brand": "OneChoice", "category": "epoxy-primers"}'::jsonb
FROM public.documents WHERE title = 'PPG OneChoice Ancillary Products — Complete Product Overview';

INSERT INTO public.document_chunks (document_id, chunk_index, content, metadata)
SELECT id, 2,
  'PPG OneChoice Adhesion Promoters. SU470LV 1K Compliant Adhesion Promoter (replaces SU4902): ready-to-spray single component, no mixing, 10 min dry time at 70°F, 1 medium wet coat, fluid tip 1.3-1.5mm. SUA470LV is the SCAQMD compliant version. OneChoice AdPro Max pigmented adhesion promoter: available in SU481LV White, SU485LV Gray, SU487LV Dark Gray. AdPro Max is a single-component undercoat that eliminates the need to apply a sealer by providing exceptional topcoat adhesion to uncoated bumpers, fascias and other automotive plastics. SU4901 Clean and Scuff Pad used for surface prep before adhesion promoter.',
  '{"source": "PPG", "brand": "OneChoice", "category": "adhesion-promoters"}'::jsonb
FROM public.documents WHERE title = 'PPG OneChoice Ancillary Products — Complete Product Overview';

INSERT INTO public.document_chunks (document_id, chunk_index, content, metadata)
SELECT id, 3,
  'PPG OneChoice Cleaners and Surface Prep. SWX350 Wax and Grease Remover is the standard pre-cleaning solvent. SX103/SXA103 Plastic Cleaner for plastic substrate cleaning. SX394 Final Wipe solvent. SX1002 Sanding Paste for scuffing plastic surfaces. DX393 Wax and Grease Remover (legacy product). DX394 final clean solvent. All cleaning products are designed for use before applying primers, adhesion promoters, sealers and topcoats. Proper cleaning is the first and most critical step in any refinish job — contamination causes adhesion failure, fish eyes, and other defects.',
  '{"source": "PPG", "brand": "OneChoice", "category": "cleaners"}'::jsonb
FROM public.documents WHERE title = 'PPG OneChoice Ancillary Products — Complete Product Overview';

-- ─────────────────────────────────────────
-- DOCUMENT 3: PPG Deltron / Deltron NXT
-- ─────────────────────────────────────────
INSERT INTO public.documents (title, description, doc_type, tab_slug, tags, metadata) VALUES (
  'PPG Deltron 2000 and Deltron NXT — Complete Product Overview',
  'PPG Deltron is the premium solvent basecoat system for collision repair. Deltron 2000 (DBC) is the established system; Deltron NXT is the next-generation system with faster dry times and advanced color matching. Includes basecoats, clearcoats (DCU series), primers (DP series), primer surfacers (K series), and reducers (DT series).',
  'manual',
  'painting',
  ARRAY['ppg', 'deltron', 'deltron 2000', 'deltron nxt', 'DBC', 'DBU', 'DCU', 'DP', 'DPLF', 'K36', 'K38', 'DT', 'basecoat', 'clearcoat', 'primer', 'solvent basecoat', 'collision repair'],
  '{"source": "PPG public product information", "manufacturer": "PPG Industries", "type": "product-overview", "brand": "Deltron"}'::jsonb
);

INSERT INTO public.document_chunks (document_id, chunk_index, content, metadata)
SELECT id, 0,
  'PPG Deltron 2000 Basecoat System. DBC Deltron 2000 Basecoat is the established premium solvent basecoat mixed directly from the Deltron Mixing System. DBI Interior Basecoat for interior color matching. DBU is the Deltron Universal Basecoat option. DBC may be applied over cleaned and sanded OEM finishes, DPLF Epoxy Primer, Deltron Primer Surfacers and Sealers, and Deltron Plastic Adhesion Promoters. Deltron 2000 provides excellent color match accuracy with one of the largest color formula databases in the industry. DT reducers: DT870 Fast, DT885 Medium, DT895 Slow for temperature-based selection.',
  '{"source": "PPG", "brand": "Deltron", "category": "basecoats"}'::jsonb
FROM public.documents WHERE title = 'PPG Deltron 2000 and Deltron NXT — Complete Product Overview';

INSERT INTO public.document_chunks (document_id, chunk_index, content, metadata)
SELECT id, 1,
  'PPG Deltron NXT System (next generation). Deltron NXT is engineered for production-focused collision centers with excellent process efficiency. Basecoat features next-level color matching for sophisticated finishes with fast air-dry time of just 15 minutes. NXT clearcoat lineup offers superfast air-dry capability with bake times as low as 5 minutes, delivering excellent gloss and appearance. Incorporates 34 new toners plus latest liquid pearls, nine Xirallic and four Colorstream liquid effects pigments to match exotic modern colors. NCP450 Iso-Free Primer is the newest addition to the NXT lineup.',
  '{"source": "PPG", "brand": "Deltron NXT", "category": "deltron-nxt"}'::jsonb
FROM public.documents WHERE title = 'PPG Deltron 2000 and Deltron NXT — Complete Product Overview';

INSERT INTO public.document_chunks (document_id, chunk_index, content, metadata)
SELECT id, 2,
  'PPG Deltron Clearcoats. DCU2002 is the standard Deltron urethane clearcoat. DCU2021 is a production clearcoat for faster throughput. DCU2042 is a premium appearance clearcoat. DCU2060 is the speed clearcoat for fastest turnaround. All DCU clearcoats are compatible with Deltron DBC and DBU basecoats. Use with appropriate DCX hardeners for temperature range. Deltron clearcoats deliver excellent gloss, DOI (distinctness of image), and durability for collision repair and custom paint applications.',
  '{"source": "PPG", "brand": "Deltron", "category": "clearcoats"}'::jsonb
FROM public.documents WHERE title = 'PPG Deltron 2000 and Deltron NXT — Complete Product Overview';

INSERT INTO public.document_chunks (document_id, chunk_index, content, metadata)
SELECT id, 3,
  'PPG Deltron Primers, Surfacers, and Sealers. DP Epoxy Primers: DAS302x DP Epoxy Primer LF series for direct-to-metal corrosion protection. DPLF Epoxy Primer and DPLV 2.1 VOC Epoxy Primer (OneChoice compatible). K36 Prima Acrylic Urethane Primer Surfacer/Sealer is a versatile 2-in-1 product. K38 High Build Primer Surfacer for heavy filling and leveling work. DPX171 and DPX801 are additional primer options. Deltron sealers provide color holdout and uniform base for topcoat application. Always follow PPG SOP for primer selection based on substrate and repair type.',
  '{"source": "PPG", "brand": "Deltron", "category": "primers-sealers"}'::jsonb
FROM public.documents WHERE title = 'PPG Deltron 2000 and Deltron NXT — Complete Product Overview';

-- ─────────────────────────────────────────
-- DOCUMENT 4: PPG Envirobase High Performance
-- ─────────────────────────────────────────
INSERT INTO public.documents (title, description, doc_type, tab_slug, tags, metadata) VALUES (
  'PPG Envirobase High Performance — Complete Product Overview',
  'PPG Envirobase High Performance (EHP) is the premium waterborne basecoat system trusted by thousands of collision repair centers worldwide. T4xx waterborne basecoat tinters, EC series clearcoats (EC520, EC530, EC800), ECP primer surfacer, ECH hardeners, and DT reducers. Best-in-class color accuracy and durability.',
  'manual',
  'painting',
  ARRAY['ppg', 'envirobase', 'envirobase hp', 'EHP', 'waterborne', 'T4', 'EC530', 'EC520', 'EC800', 'ECP35', 'ECH5075', 'EC5515', 'EC5517', 'basecoat', 'clearcoat', 'primer surfacer', 'collision repair'],
  '{"source": "PPG public product information", "manufacturer": "PPG Industries", "type": "product-overview", "brand": "Envirobase HP"}'::jsonb
);

INSERT INTO public.document_chunks (document_id, chunk_index, content, metadata)
SELECT id, 0,
  'PPG Envirobase High Performance (EHP) waterborne basecoat system overview. Trusted by thousands of collision repair centers worldwide. State-of-the-art technology delivers enhanced durability and best-in-class color accuracy. T4xx series waterborne basecoat tinters are mixed to create precise color matches from the PPG color database. T492 Adjuster enhances the EHP basecoat system for specific color effects. T493 Modifier provides EHP basecoat with highest level of film integrity. T494 Reducer for basecoat viscosity adjustment. Envirobase HP is waterborne (low VOC) and meets the strictest environmental regulations while delivering premium quality results.',
  '{"source": "PPG", "brand": "Envirobase HP", "category": "basecoat"}'::jsonb
FROM public.documents WHERE title = 'PPG Envirobase High Performance — Complete Product Overview';

INSERT INTO public.document_chunks (document_id, chunk_index, content, metadata)
SELECT id, 1,
  'PPG Envirobase HP Clearcoats. EC530 En-V Performance Clearcoat is the primary high-gloss clear engineered specifically for Envirobase HP waterborne basecoat, delivering excellent gloss and durability. EC520 En-V High Production Clearcoat for faster throughput in busy shops. EC800 Ultra Fast 2.1 Clearcoat for fastest turnaround times. EC5515 Low VOC Matte Clear and EC5517 Semi-Gloss Clear for OE low-gloss finishes on Mercedes-Benz, BMW, Fiat, Lamborghini (mix ratios: 3:1:1 with ECH5075 hardener and DT1855 reducer). All clearcoats use ECH series hardeners selected by temperature range.',
  '{"source": "PPG", "brand": "Envirobase HP", "category": "clearcoats"}'::jsonb
FROM public.documents WHERE title = 'PPG Envirobase High Performance — Complete Product Overview';

INSERT INTO public.document_chunks (document_id, chunk_index, content, metadata)
SELECT id, 2,
  'PPG Envirobase HP Primer Surfacers and Hardeners. ECP35 2.1 VOC High Production Surfacer: designed for use under Envirobase HP waterborne basecoat, offers excellent adhesion, film build, and gloss holdout. Ready to sand after 1 hour air dry or 15 minutes force dry. Fast drying and easy sanding. ECH5075 Hardener is the standard hardener for Envirobase clearcoats and matte/semi-gloss clear systems. DT1855 Reducer used with Envirobase clearcoats. Envirobase HP is fully compatible with OneChoice ancillary products (DPLF, DPLV epoxy primers, SU470LV adhesion promoter, SWX350 cleaners).',
  '{"source": "PPG", "brand": "Envirobase HP", "category": "primers-hardeners"}'::jsonb
FROM public.documents WHERE title = 'PPG Envirobase High Performance — Complete Product Overview';

-- ─────────────────────────────────────────
-- DOCUMENT 5: PPG Delfleet Essential (Commercial/Fleet)
-- ─────────────────────────────────────────
INSERT INTO public.documents (title, description, doc_type, tab_slug, tags, metadata) VALUES (
  'PPG Delfleet Essential — Commercial Fleet Paint System',
  'PPG Delfleet Essential is a cost-effective commercial vehicle refinish system for fleet and truck painting. Includes single-stage and basecoat options (ESSS), clearcoat (ESC621), epoxy primers (ESU480/481/482). Simple mixing, rapid turnaround, three-year warranty with ESC621.',
  'manual',
  'painting',
  ARRAY['ppg', 'delfleet', 'delfleet essential', 'commercial', 'fleet', 'truck', 'ESSS', 'ESC621', 'ESU480', 'ESU481', 'ESU482', 'single-stage', 'basecoat', 'clearcoat', 'epoxy primer'],
  '{"source": "PPG public product information", "manufacturer": "PPG Industries", "type": "product-overview", "brand": "Delfleet Essential"}'::jsonb
);

INSERT INTO public.document_chunks (document_id, chunk_index, content, metadata)
SELECT id, 0,
  'PPG Delfleet Essential commercial fleet paint system overview. Cost-effective portfolio of products designed to deliver efficiency, productivity and consistent quality for commercial vehicles. Industry-proven system allows repair and refinishing facilities to benefit from rapid turnaround times and increased throughput. Every product is packaged in easy-to-use kit for quick and easy color matching. Simple mixing ratios allow paint technicians to quickly prepare products and match original colors with ease. Offers both single-stage and basecoat options. Three-year warranty when used with ESC621 clearcoat.',
  '{"source": "PPG", "brand": "Delfleet Essential", "category": "overview"}'::jsonb
FROM public.documents WHERE title = 'PPG Delfleet Essential — Commercial Fleet Paint System';

INSERT INTO public.document_chunks (document_id, chunk_index, content, metadata)
SELECT id, 1,
  'PPG Delfleet Essential Products. ESSS Basecoat/Single-Stage Color: both basecoat and single-stage topcoats can be mixed from the same ESSS color formula. ESSS color is mixed with a basecoat converter and hardener for basecoat application, or with single-stage hardener for direct single-stage finish. ESC621 Urethane Clearcoat: applied over ESSS basecoat for maximum durability, gloss, and the three-year Delfleet Essential warranty. ESU480 2.1 VOC Epoxy Primer in gray (standard), ESU481 white, and ESU482 black. ESU480 provides superior adhesion and corrosion resistance, thin film epoxy that lays down easily with no need for sanding. Fully compatible with Delfleet Essential topcoats.',
  '{"source": "PPG", "brand": "Delfleet Essential", "category": "products"}'::jsonb
FROM public.documents WHERE title = 'PPG Delfleet Essential — Commercial Fleet Paint System';

-- ─────────────────────────────────────────
-- DOCUMENT 6: PPG Global Refinish System
-- ─────────────────────────────────────────
INSERT INTO public.documents (title, description, doc_type, tab_slug, tags, metadata) VALUES (
  'PPG Global Refinish System (GRS) — Product Overview',
  'PPG Global Refinish System (GRS) is designed for high-production collision centers, offering outstanding color accuracy with a global database of more than 5 million colors. BC series basecoat colors, compatible with multiple PPG clearcoat and primer systems.',
  'manual',
  'painting',
  ARRAY['ppg', 'global refinish system', 'GRS', 'global', 'BC', 'basecoat', 'color accuracy', 'high production', 'collision center', '5 million colors'],
  '{"source": "PPG public product information", "manufacturer": "PPG Industries", "type": "product-overview", "brand": "Global Refinish System"}'::jsonb
);

INSERT INTO public.document_chunks (document_id, chunk_index, content, metadata)
SELECT id, 0,
  'PPG Global Refinish System (GRS) overview. Ideal for high-production collision centers, offering outstanding color accuracy with a global database of more than 5 million colors. The GRS uses BC Global Basecoat Colour tinters mixed to match any vehicle color worldwide. D808, D807, D812, D869 are basecoat system components. Compatible with PPG clearcoats from the Deltron and Envirobase HP systems. GRS is designed for shops that handle a high volume of repairs and need fast, accurate color matching across all vehicle makes and models, including exotic and specialty colors. Global color formula database ensures matches for vehicles from any market.',
  '{"source": "PPG", "brand": "Global Refinish System", "category": "overview"}'::jsonb
FROM public.documents WHERE title = 'PPG Global Refinish System (GRS) — Product Overview';

-- ─────────────────────────────────────────
-- DOCUMENT 7: PPG Brand Selection Guide
-- ─────────────────────────────────────────
INSERT INTO public.documents (title, description, doc_type, tab_slug, tags, metadata) VALUES (
  'PPG Refinish Brand Selection Guide — Which System to Use',
  'Guide for selecting the right PPG refinish system based on application, budget, and requirements. Covers when to use Envirobase HP, Deltron, Shop-Line, Delfleet Essential, and how OneChoice products work across all systems.',
  'manual',
  'painting',
  ARRAY['ppg', 'brand selection', 'system comparison', 'envirobase', 'deltron', 'shop-line', 'delfleet', 'onechoice', 'which system', 'guide'],
  '{"source": "PPG public product information", "manufacturer": "PPG Industries", "type": "guide", "brand": "All"}'::jsonb
);

INSERT INTO public.document_chunks (document_id, chunk_index, content, metadata)
SELECT id, 0,
  'PPG Refinish Brand Selection Guide. Envirobase High Performance: premium waterborne basecoat, best-in-class color accuracy, meets strictest VOC regulations, ideal for high-end collision repair, OEM-approved by many manufacturers. Deltron 2000 and Deltron NXT: premium solvent basecoat systems, excellent color matching, Deltron NXT offers fastest dry times (15 min basecoat, 5 min bake clearcoat), ideal for production-focused shops. Shop-Line: economical solvent basecoat system, best balance of performance and price, compact mixing system, ideal for budget-conscious shops and used car reconditioning. Delfleet Essential: commercial fleet system, cost-effective for trucks and commercial vehicles, single-stage and basecoat options from same ESSS formula, three-year warranty with ESC621 clear. Global Refinish System: 5+ million color database for global vehicle matching. OneChoice: universal ancillary products (primers, adhesion promoters, cleaners, sealers) that work with ALL PPG topcoat systems — simplifies inventory across the shop.',
  '{"source": "PPG", "brand": "All", "category": "selection-guide"}'::jsonb
FROM public.documents WHERE title = 'PPG Refinish Brand Selection Guide — Which System to Use';
