-- ═══════════════════════════════════════════════════════════════
-- SEM Products — General Knowledge Base (PPG Refinish Line)
-- Covers: Repair, Coatings, Primers, Abrasives, Plastic Repair
-- Source: Public product information from semproducts.com, distributors
-- NOTE: This is general knowledge. Detailed TDS/SDS to be added later.
-- Run in Supabase SQL Editor
-- ═══════════════════════════════════════════════════════════════

-- ─────────────────────────────────────────
-- DOCUMENT 1: SEM Product Line Overview
-- ─────────────────────────────────────────
INSERT INTO public.documents (title, description, doc_type, tab_slug, tags, metadata) VALUES (
  'SEM Products — Complete Product Line Overview (PPG Refinish)',
  'Overview of SEM Products (a PPG business) for collision repair and refinishing. Covers repair adhesives, seam sealers, plastic repair, flexible coatings, primers, corrosion protection, abrasives, and interior restoration products. SEM is a leading manufacturer of innovative paint, adhesives, and coating products for the automotive repair and refinishing industry.',
  'manual',
  'painting',
  ARRAY['sem', 'sem products', 'ppg', 'collision repair', 'refinish', 'adhesive', 'seam sealer', 'plastic repair', 'primer', 'coating', 'abrasives', 'color coat', 'bumper coater', 'copperweld'],
  '{"source": "SEM Products / PPG public product information", "manufacturer": "SEM Products (PPG)", "type": "product-overview"}'::jsonb
);

-- Chunk 0: Company overview and product categories
INSERT INTO public.document_chunks (document_id, chunk_index, content, metadata)
SELECT id, 0,
  'SEM Products is a PPG business and a leading manufacturer of innovative paint, adhesives, and coating products for the automotive collision repair and refinishing industry. SEM product categories include: Repair (adhesives, seam sealers, plastic repair materials, sound dampening), Coatings (Color Coat, Classic Coat, Sure-Coat, Bumper Coater, Trim Black, Vinyl Coat), Primers and Corrosion Protection (Copperweld weld-through primer, Self-Etch primer, flexible primer surfacer), and Performance Abrasives. SEM also distributes 4Plastic texture refinishing and headlight restoration products in the US and Canada. SEM products are designed to meet OEM specifications for collision repair.',
  '{"source": "SEM Products / PPG", "category": "overview"}'::jsonb
FROM public.documents WHERE title = 'SEM Products — Complete Product Line Overview (PPG Refinish)';

-- Chunk 1: Seam Sealers
INSERT INTO public.document_chunks (document_id, chunk_index, content, metadata)
SELECT id, 1,
  'SEM Seam Sealers for collision repair. All SEM seam sealers are available in OEM colors gray, beige, black and white, are direct-to-metal capable, and carry the SEM Forever Warranty. Products include: Dual-Mix Seam Sealer (39377) two-component epoxy gray for sealing interior or exterior seams, voids and joints. Self Leveling Seam Sealer (39387) and High-Build Self Leveling Seam Sealer (39777) two-component epoxies for drip rails, roof and trunk seams. 1K Seam Sealer is a single-component versatile sealer for interior or exterior seams, joints and voids with non-sag formula and direct-to-metal capability. IMPORTANT: Do NOT apply seam sealers over acid-based self-etching primer. Self-etching primers contain acidic components that cause seam sealers to not adhere properly and fail over time.',
  '{"source": "SEM Products / PPG", "category": "seam-sealers"}'::jsonb
FROM public.documents WHERE title = 'SEM Products — Complete Product Line Overview (PPG Refinish)';

-- Chunk 2: Adhesives and Panel Bonding
INSERT INTO public.document_chunks (document_id, chunk_index, content, metadata)
SELECT id, 2,
  'SEM Dual-Mix Adhesives for collision repair panel bonding. Dual-Mix Multi-Purpose Panel Adhesive (39747) is a two-component epoxy for bonding steel, aluminum, SMC and fiberglass in any combination. Can be welded through during the adhesive working time. Uses SEM Dual-Mix dispensing system with static mixing nozzles for precise metering and mixing. All Dual-Mix products use the same dispensing gun and nozzle system (70011 static mixing nozzles), simplifying inventory. SEM adhesives are designed for structural and semi-structural repairs per OEM repair procedures.',
  '{"source": "SEM Products / PPG", "category": "adhesives"}'::jsonb
FROM public.documents WHERE title = 'SEM Products — Complete Product Line Overview (PPG Refinish)';

-- Chunk 3: Plastic Repair Materials
INSERT INTO public.document_chunks (document_id, chunk_index, content, metadata)
SELECT id, 3,
  'SEM Dual-Mix Plastic Repair Materials for collision repair. Dual-Mix Rigid Plastic Repair Material (40887) two-component fiber-enriched epoxy for bonding and cosmetic repair of carbon fiber, SMC, Metton, fiberglass and other rigid plastics. Dual-Mix Multi-Plastic Repair Material (39847) two-component epoxy for fast repairs on virtually all plastic bumper covers, 7 minute work time, 15 minutes to sand, 20 minutes to top coat. Dual-Mix Problem Plastic Repair Material (39767) two-component epoxy-based filler for repairing olefin-based plastics (TPO, PP) and similar rigid and semi-rigid substrates. All use the Dual-Mix dispensing system with static mixing nozzles.',
  '{"source": "SEM Products / PPG", "category": "plastic-repair"}'::jsonb
FROM public.documents WHERE title = 'SEM Products — Complete Product Line Overview (PPG Refinish)';

-- Chunk 4: Primers and Corrosion Protection
INSERT INTO public.document_chunks (document_id, chunk_index, content, metadata)
SELECT id, 4,
  'SEM Primers and Corrosion Protection for collision repair. Copperweld Weld-Through Primer (40793 aerosol, 40783 16oz) is zinc-based and copper-enriched for superior corrosion protection between welded substrates. Minimizes heat affected zones and welding spatter. Compatible with MIG and STRSW (squeeze-type resistance spot welding). Self-Etch Primer (1K, available in gray, quart and aerosol) provides excellent adhesion and corrosion resistance on properly prepped steel, aluminum, and stainless steel. Very quick drying. Flexible Primer Surfacer (39133 aerosol, 39131 gallon) for use on flexible plastic substrates before topcoating. HAZ Flex Primer (39104 quart) for bumper and flexible plastic preparation.',
  '{"source": "SEM Products / PPG", "category": "primers"}'::jsonb
FROM public.documents WHERE title = 'SEM Products — Complete Product Line Overview (PPG Refinish)';

-- Chunk 5: Color Coat, Classic Coat, Sure-Coat (Interior/Exterior Flexible Coatings)
INSERT INTO public.document_chunks (document_id, chunk_index, content, metadata)
SELECT id, 5,
  'SEM Flexible Coatings for interior and exterior restoration. Color Coat is a fade-resistant, flexible, permanent coating (not a dye) to restore or change the color of most vinyl surfaces, flexible and rigid plastics, carpet and velour. UV and abrasion resistant, flexible enough for seats, durable enough for vinyl tops. Coverage approximately 10 sq ft per can. Available in aerosol and bulk. Classic Coat is designed to restore or change the color of leather and vinyl upholstery with excellent adhesion that prevents peeling or chipping. Available in many popular OEM colors. Sure-Coat is ready-to-use with three companion clears: High Gloss Clear (1670) for wet look, Satin Gloss Clear (1671) for medium sheen, Low Luster Clear (1672) for interior instrument panels. All three product lines (Color Coat, Sure-Coat, Classic Coat) are ready-to-spray, high-hiding, flexible coatings that do not get brittle with age.',
  '{"source": "SEM Products / PPG", "category": "flexible-coatings"}'::jsonb
FROM public.documents WHERE title = 'SEM Products — Complete Product Line Overview (PPG Refinish)';

-- Chunk 6: Bumper Coater and Trim Products
INSERT INTO public.document_chunks (document_id, chunk_index, content, metadata)
SELECT id, 6,
  'SEM Bumper Coater and Trim Products for collision repair. Bumper Coater (39103 black 12oz aerosol, also 16oz) is an advanced coating formulated to restore the OEM finish on automotive bumpers and plastic cladding. Flexible and durable for exterior use. Trim Black Charcoal Metallic (39143 15oz aerosol) is an acrylic coating formulated to restore the OEM finish on automotive trim components, for use on plastic, steel, aluminum, stainless steel, and chrome. These products are commonly used in collision repair to restore bumper covers and exterior trim to factory appearance after repairs.',
  '{"source": "SEM Products / PPG", "category": "bumper-trim"}'::jsonb
FROM public.documents WHERE title = 'SEM Products — Complete Product Line Overview (PPG Refinish)';

-- Chunk 7: Performance Abrasives (launched 2024)
INSERT INTO public.document_chunks (document_id, chunk_index, content, metadata)
SELECT id, 7,
  'SEM Performance Abrasives product line launched in 2024. Designed to simplify complex automotive collision repairs with precision grain technology that provides durability, edge wear resistance, and even cutting surface. Allows technicians to achieve proper feather-edging. Designed for every stage of the repair process and incorporates precision grain technology to deliver fast cutting, longevity, and consistency for a wide range of repairs and substrates. Part of PPG digital solutions to make body shops more productive and efficient.',
  '{"source": "SEM Products / PPG", "category": "abrasives"}'::jsonb
FROM public.documents WHERE title = 'SEM Products — Complete Product Line Overview (PPG Refinish)';

-- Chunk 8: Surface Prep Products
INSERT INTO public.document_chunks (document_id, chunk_index, content, metadata)
SELECT id, 8,
  'SEM Surface Preparation Products. SEM SOLVE is a cleaning solvent that dissolves and removes old adhesives and sealants during surface preparation. Sand Free Adhesion Promoter (38363) is a unique wet-on-wet adhesion promoter for ABS, PVC, and similar plastics, eliminating the need for mechanical sanding on these substrates. SEM Plastic Adhesion Promoter promotes adhesion on problem plastics such as TPO, EPDM, PP and other thermoplastics. Vinyl Prep (38343 aerosol) cleans and prepares vinyl surfaces before applying Color Coat or other SEM flexible coatings. Proper surface preparation is critical for adhesion of all SEM coating and repair products.',
  '{"source": "SEM Products / PPG", "category": "surface-prep"}'::jsonb
FROM public.documents WHERE title = 'SEM Products — Complete Product Line Overview (PPG Refinish)';

-- Chunk 9: 4Plastic Partnership Products (2025)
INSERT INTO public.document_chunks (document_id, chunk_index, content, metadata)
SELECT id, 9,
  'SEM Products and 4Plastic partnership (2025). PPG SEM Products is the exclusive US and Canadian distributor for 4Plastic automotive repair products. The 4Plastic product range includes plastic repair materials, headlight restoration products, and texture coating products designed specifically for collision repair shops. The SEM and 4Plastic texture refinishing system is engineered for repair of non-painted textured plastic components, reproducing OEM texture on bumpers, fender flares, rocker panels, and other textured plastic parts. Available through SEM distributors across North America.',
  '{"source": "SEM Products / PPG / 4Plastic", "category": "4plastic-texture"}'::jsonb
FROM public.documents WHERE title = 'SEM Products — Complete Product Line Overview (PPG Refinish)';
