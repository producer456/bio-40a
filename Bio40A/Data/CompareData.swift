import Foundation

struct CompareData {

    static let allCards: [CompareCard] = cardsWeeks1_2 + cardsWeeks3_4 + cardsWeeks5_6 + cardsWeeks7_8 + cardsWeeks9_10 + cardsWeek11

    // MARK: - Weeks 1-2

    static let cardsWeeks1_2: [CompareCard] = [

        CompareCard(
            id: "cmp-neg-pos-feedback",
            title: "Negative vs Positive Feedback",
            itemA: CompareItem(name: "Negative Feedback", color: "blue"),
            itemB: CompareItem(name: "Positive Feedback", color: "orange"),
            categories: [
                CompareCategory(id: "cmp-npf-1", label: "Stimulus", valueA: "A change away from set point", valueB: "A change away from normal state"),
                CompareCategory(id: "cmp-npf-2", label: "Response Direction", valueA: "Opposes the stimulus; reverses the change", valueB: "Amplifies the stimulus; enhances the change"),
                CompareCategory(id: "cmp-npf-3", label: "Examples", valueA: "Thermoregulation, blood glucose regulation, blood pressure", valueB: "Childbirth (oxytocin), blood clotting, lactation"),
                CompareCategory(id: "cmp-npf-4", label: "Frequency", valueA: "Most common feedback mechanism in the body", valueB: "Rare; used only in specific situations"),
                CompareCategory(id: "cmp-npf-5", label: "Endpoint", valueA: "Returns to homeostatic set point", valueB: "Ends when process is complete (e.g., baby delivered)")
            ],
            weekNumber: 1
        ),

        CompareCard(
            id: "cmp-anab-catab",
            title: "Anabolism vs Catabolism",
            itemA: CompareItem(name: "Anabolism", color: "blue"),
            itemB: CompareItem(name: "Catabolism", color: "orange"),
            categories: [
                CompareCategory(id: "cmp-ac-1", label: "Definition", valueA: "Building complex molecules from simpler ones", valueB: "Breaking down complex molecules into simpler ones"),
                CompareCategory(id: "cmp-ac-2", label: "Energy", valueA: "Requires energy input (endergonic)", valueB: "Releases energy (exergonic)"),
                CompareCategory(id: "cmp-ac-3", label: "Examples", valueA: "Protein synthesis from amino acids, glycogen synthesis", valueB: "Digestion of food, cellular respiration (glucose breakdown)"),
                CompareCategory(id: "cmp-ac-4", label: "Result", valueA: "Growth, repair, and storage of molecules", valueB: "ATP production and release of waste products")
            ],
            weekNumber: 1
        ),

        CompareCard(
            id: "cmp-acids-bases",
            title: "Acids vs Bases",
            itemA: CompareItem(name: "Acids", color: "blue"),
            itemB: CompareItem(name: "Bases", color: "orange"),
            categories: [
                CompareCategory(id: "cmp-ab-1", label: "H+ Behavior", valueA: "Donate H+ ions (proton donors)", valueB: "Accept H+ ions (proton acceptors) or release OH-"),
                CompareCategory(id: "cmp-ab-2", label: "pH Range", valueA: "Below 7 (0-6.99)", valueB: "Above 7 (7.01-14)"),
                CompareCategory(id: "cmp-ab-3", label: "Examples", valueA: "HCl (stomach acid), citric acid, carbonic acid", valueB: "NaOH, bicarbonate (HCO3-), ammonia"),
                CompareCategory(id: "cmp-ab-4", label: "Taste", valueA: "Sour", valueB: "Bitter"),
                CompareCategory(id: "cmp-ab-5", label: "Feel", valueA: "Can sting or burn tissue", valueB: "Slippery or soapy feel")
            ],
            weekNumber: 2
        ),

        CompareCard(
            id: "cmp-ionic-covalent",
            title: "Ionic vs Covalent Bonds",
            itemA: CompareItem(name: "Ionic Bond", color: "blue"),
            itemB: CompareItem(name: "Covalent Bond", color: "orange"),
            categories: [
                CompareCategory(id: "cmp-ic-1", label: "Mechanism", valueA: "Transfer of electrons from one atom to another", valueB: "Sharing of electron pairs between atoms"),
                CompareCategory(id: "cmp-ic-2", label: "Strength", valueA: "Strong in solid form; dissociate easily in water", valueB: "Strong bonds; do not dissociate easily in water"),
                CompareCategory(id: "cmp-ic-3", label: "Examples", valueA: "NaCl (table salt), KCl, CaCl2", valueB: "H2O, O2, C-C bonds in organic molecules"),
                CompareCategory(id: "cmp-ic-4", label: "In Water", valueA: "Dissociate into ions (electrolytes)", valueB: "Remain intact as molecules (non-electrolytes)")
            ],
            weekNumber: 2
        )
    ]

    // MARK: - Weeks 3-4

    static let cardsWeeks3_4: [CompareCard] = [

        CompareCard(
            id: "cmp-passive-active",
            title: "Passive vs Active Transport",
            itemA: CompareItem(name: "Passive Transport", color: "blue"),
            itemB: CompareItem(name: "Active Transport", color: "orange"),
            categories: [
                CompareCategory(id: "cmp-pa-1", label: "Energy", valueA: "No cellular energy (ATP) required", valueB: "Requires ATP or cellular energy"),
                CompareCategory(id: "cmp-pa-2", label: "Direction", valueA: "Down the concentration gradient (high to low)", valueB: "Against the concentration gradient (low to high)"),
                CompareCategory(id: "cmp-pa-3", label: "Examples", valueA: "Diffusion, osmosis, facilitated diffusion, filtration", valueB: "Na+/K+ pump, endocytosis, exocytosis, vesicular transport"),
                CompareCategory(id: "cmp-pa-4", label: "ATP Required", valueA: "No", valueB: "Yes")
            ],
            weekNumber: 3
        ),

        CompareCard(
            id: "cmp-mitosis-meiosis",
            title: "Mitosis vs Meiosis",
            itemA: CompareItem(name: "Mitosis", color: "blue"),
            itemB: CompareItem(name: "Meiosis", color: "orange"),
            categories: [
                CompareCategory(id: "cmp-mm-1", label: "Purpose", valueA: "Growth, repair, and maintenance of tissues", valueB: "Production of gametes (sex cells)"),
                CompareCategory(id: "cmp-mm-2", label: "Daughter Cells", valueA: "2 identical daughter cells", valueB: "4 genetically unique daughter cells"),
                CompareCategory(id: "cmp-mm-3", label: "Chromosome Number", valueA: "Diploid (2n) — same as parent cell", valueB: "Haploid (n) — half the parent cell"),
                CompareCategory(id: "cmp-mm-4", label: "Where It Occurs", valueA: "All somatic (body) cells", valueB: "Gonads only (ovaries and testes)")
            ],
            weekNumber: 3
        ),

        CompareCard(
            id: "cmp-epi-conn",
            title: "Epithelial vs Connective Tissue",
            itemA: CompareItem(name: "Epithelial Tissue", color: "blue"),
            itemB: CompareItem(name: "Connective Tissue", color: "orange"),
            categories: [
                CompareCategory(id: "cmp-ec-1", label: "Cellularity", valueA: "Highly cellular with minimal extracellular matrix", valueB: "Few cells with abundant extracellular matrix"),
                CompareCategory(id: "cmp-ec-2", label: "Vascularity", valueA: "Avascular (no blood vessels); nourished by diffusion", valueB: "Richly vascular (except cartilage and tendons)"),
                CompareCategory(id: "cmp-ec-3", label: "Location", valueA: "Covers body surfaces, lines cavities and organs", valueB: "Found throughout the body; supports and connects tissues"),
                CompareCategory(id: "cmp-ec-4", label: "Function", valueA: "Protection, absorption, secretion, filtration", valueB: "Support, binding, protection, insulation, transport")
            ],
            weekNumber: 4
        ),

        CompareCard(
            id: "cmp-simple-strat",
            title: "Simple vs Stratified Epithelium",
            itemA: CompareItem(name: "Simple Epithelium", color: "blue"),
            itemB: CompareItem(name: "Stratified Epithelium", color: "orange"),
            categories: [
                CompareCategory(id: "cmp-ss-1", label: "Layers", valueA: "Single layer of cells", valueB: "Two or more layers of cells"),
                CompareCategory(id: "cmp-ss-2", label: "Location", valueA: "Lines internal organs, blood vessels, air sacs of lungs", valueB: "Skin (epidermis), mouth, esophagus, vagina"),
                CompareCategory(id: "cmp-ss-3", label: "Function", valueA: "Absorption, filtration, secretion (thin for exchange)", valueB: "Protection against abrasion and friction"),
                CompareCategory(id: "cmp-ss-4", label: "Examples", valueA: "Simple squamous, simple cuboidal, simple columnar", valueB: "Stratified squamous, transitional epithelium")
            ],
            weekNumber: 4
        )
    ]

    // MARK: - Weeks 5-6

    static let cardsWeeks5_6: [CompareCard] = [

        CompareCard(
            id: "cmp-epi-derm",
            title: "Epidermis vs Dermis",
            itemA: CompareItem(name: "Epidermis", color: "blue"),
            itemB: CompareItem(name: "Dermis", color: "orange"),
            categories: [
                CompareCategory(id: "cmp-ed-1", label: "Composition", valueA: "Keratinized stratified squamous epithelium", valueB: "Dense connective tissue (collagen & elastin fibers)"),
                CompareCategory(id: "cmp-ed-2", label: "Vascularity", valueA: "Avascular (no blood supply); nutrients by diffusion", valueB: "Highly vascular; contains blood vessels and nerves"),
                CompareCategory(id: "cmp-ed-3", label: "Layers", valueA: "5 layers (strata): basale, spinosum, granulosum, lucidum, corneum", valueB: "2 layers: papillary (superficial) and reticular (deep)"),
                CompareCategory(id: "cmp-ed-4", label: "Main Cells", valueA: "Keratinocytes, melanocytes, Langerhans cells, Merkel cells", valueB: "Fibroblasts, macrophages, mast cells; contains hair follicles & glands")
            ],
            weekNumber: 5
        ),

        CompareCard(
            id: "cmp-eccrine-apocrine",
            title: "Eccrine vs Apocrine Glands",
            itemA: CompareItem(name: "Eccrine Glands", color: "blue"),
            itemB: CompareItem(name: "Apocrine Glands", color: "orange"),
            categories: [
                CompareCategory(id: "cmp-ea-1", label: "Location", valueA: "Distributed over nearly the entire body (especially palms, soles)", valueB: "Axillary (armpit) and anogenital regions"),
                CompareCategory(id: "cmp-ea-2", label: "Secretion", valueA: "Watery sweat (mostly water, NaCl, small amount of urea)", valueB: "Thicker, milky secretion containing lipids and proteins"),
                CompareCategory(id: "cmp-ea-3", label: "Function", valueA: "Thermoregulation (cooling the body)", valueB: "Scent production; activated during stress and sexual arousal"),
                CompareCategory(id: "cmp-ea-4", label: "Activation", valueA: "Active from birth; regulated by sympathetic nervous system", valueB: "Activated at puberty; stimulated by hormones and stress")
            ],
            weekNumber: 5
        ),

        CompareCard(
            id: "cmp-burns",
            title: "1st vs 2nd vs 3rd Degree Burns",
            itemA: CompareItem(name: "1st Degree (Superficial)", color: "blue"),
            itemB: CompareItem(name: "2nd / 3rd Degree", color: "orange"),
            categories: [
                CompareCategory(id: "cmp-burn-1", label: "Depth — 1st", valueA: "Epidermis only", valueB: "—"),
                CompareCategory(id: "cmp-burn-2", label: "Depth — 2nd", valueA: "—", valueB: "Epidermis and part of dermis (partial-thickness)"),
                CompareCategory(id: "cmp-burn-3", label: "Depth — 3rd", valueA: "—", valueB: "Full-thickness: epidermis, dermis, and into subcutaneous tissue"),
                CompareCategory(id: "cmp-burn-4", label: "Appearance — 1st", valueA: "Red, dry, no blisters (like sunburn)", valueB: "—"),
                CompareCategory(id: "cmp-burn-5", label: "Appearance — 2nd", valueA: "—", valueB: "Red, blistered, swollen, moist and weeping"),
                CompareCategory(id: "cmp-burn-6", label: "Appearance — 3rd", valueA: "—", valueB: "White, charred, or leathery; dry and hard"),
                CompareCategory(id: "cmp-burn-7", label: "Pain — 1st", valueA: "Painful (nerve endings intact)", valueB: "—"),
                CompareCategory(id: "cmp-burn-8", label: "Pain — 2nd", valueA: "—", valueB: "Very painful (nerve endings exposed)"),
                CompareCategory(id: "cmp-burn-9", label: "Pain — 3rd", valueA: "—", valueB: "Little to no pain (nerve endings destroyed)"),
                CompareCategory(id: "cmp-burn-10", label: "Healing — 1st", valueA: "Heals in 3-5 days without scarring", valueB: "—"),
                CompareCategory(id: "cmp-burn-11", label: "Healing — 2nd", valueA: "—", valueB: "Heals in weeks; may scar"),
                CompareCategory(id: "cmp-burn-12", label: "Healing — 3rd", valueA: "—", valueB: "Requires skin grafting; severe scarring")
            ],
            weekNumber: 6
        )
    ]

    // MARK: - Weeks 7-8

    static let cardsWeeks7_8: [CompareCard] = [

        CompareCard(
            id: "cmp-compact-spongy",
            title: "Compact vs Spongy Bone",
            itemA: CompareItem(name: "Compact Bone", color: "blue"),
            itemB: CompareItem(name: "Spongy Bone", color: "orange"),
            categories: [
                CompareCategory(id: "cmp-cs-1", label: "Structure", valueA: "Dense, solid, tightly packed osteons (Haversian systems)", valueB: "Lattice of bony struts called trabeculae with open spaces"),
                CompareCategory(id: "cmp-cs-2", label: "Location", valueA: "Outer layer (cortex) of all bones; shaft of long bones", valueB: "Interior of bones; epiphyses of long bones; inside flat bones"),
                CompareCategory(id: "cmp-cs-3", label: "Organization", valueA: "Highly organized into osteons with central (Haversian) canals", valueB: "Irregularly arranged trabeculae aligned along stress lines"),
                CompareCategory(id: "cmp-cs-4", label: "Function", valueA: "Provides strength, support, and protection; resists compression", valueB: "Reduces bone weight; stores red bone marrow; absorbs stress")
            ],
            weekNumber: 7
        ),

        CompareCard(
            id: "cmp-osteoblast-osteoclast",
            title: "Osteoblasts vs Osteoclasts",
            itemA: CompareItem(name: "Osteoblasts", color: "blue"),
            itemB: CompareItem(name: "Osteoclasts", color: "orange"),
            categories: [
                CompareCategory(id: "cmp-oo-1", label: "Function", valueA: "Build new bone by secreting osteoid (bone matrix)", valueB: "Break down (resorb) bone tissue, releasing calcium into blood"),
                CompareCategory(id: "cmp-oo-2", label: "Origin", valueA: "Derived from mesenchymal stem cells", valueB: "Derived from monocyte/macrophage lineage (hematopoietic)"),
                CompareCategory(id: "cmp-oo-3", label: "Shape", valueA: "Cuboidal; found on bone surfaces", valueB: "Large, multinucleated; found in Howship's lacunae (resorption pits)"),
                CompareCategory(id: "cmp-oo-4", label: "Hormone Response", valueA: "Stimulated by calcitonin and growth factors", valueB: "Stimulated by parathyroid hormone (PTH)")
            ],
            weekNumber: 7
        ),

        CompareCard(
            id: "cmp-axial-appendicular",
            title: "Axial vs Appendicular Skeleton",
            itemA: CompareItem(name: "Axial Skeleton", color: "blue"),
            itemB: CompareItem(name: "Appendicular Skeleton", color: "orange"),
            categories: [
                CompareCategory(id: "cmp-aa-1", label: "Bones Included", valueA: "Skull, vertebral column, rib cage, hyoid bone", valueB: "Limbs, pectoral girdle (clavicle, scapula), pelvic girdle"),
                CompareCategory(id: "cmp-aa-2", label: "Function", valueA: "Protects vital organs (brain, spinal cord, heart, lungs)", valueB: "Facilitates movement and locomotion"),
                CompareCategory(id: "cmp-aa-3", label: "Bone Count", valueA: "80 bones", valueB: "126 bones")
            ],
            weekNumber: 8
        )
    ]

    // MARK: - Weeks 9-10

    static let cardsWeeks9_10: [CompareCard] = [

        CompareCard(
            id: "cmp-joint-types",
            title: "Fibrous vs Cartilaginous vs Synovial Joints",
            itemA: CompareItem(name: "Fibrous / Cartilaginous", color: "blue"),
            itemB: CompareItem(name: "Synovial", color: "orange"),
            categories: [
                CompareCategory(id: "cmp-jt-1", label: "Movement — Fibrous", valueA: "Immovable (synarthrosis) — e.g., skull sutures", valueB: "—"),
                CompareCategory(id: "cmp-jt-2", label: "Movement — Cartilaginous", valueA: "Slightly movable (amphiarthrosis) — e.g., intervertebral discs", valueB: "—"),
                CompareCategory(id: "cmp-jt-3", label: "Movement — Synovial", valueA: "—", valueB: "Freely movable (diarthrosis)"),
                CompareCategory(id: "cmp-jt-4", label: "Structure — Fibrous", valueA: "Bones joined by dense fibrous connective tissue", valueB: "—"),
                CompareCategory(id: "cmp-jt-5", label: "Structure — Cartilaginous", valueA: "Bones joined by cartilage (hyaline or fibrocartilage)", valueB: "—"),
                CompareCategory(id: "cmp-jt-6", label: "Structure — Synovial", valueA: "—", valueB: "Joint cavity with synovial fluid, articular cartilage, joint capsule"),
                CompareCategory(id: "cmp-jt-7", label: "Examples", valueA: "Fibrous: sutures, gomphoses. Cartilaginous: pubic symphysis, IV discs", valueB: "Knee, shoulder, hip, elbow, wrist")
            ],
            weekNumber: 9
        ),

        CompareCard(
            id: "cmp-muscle-types",
            title: "Skeletal vs Cardiac vs Smooth Muscle",
            itemA: CompareItem(name: "Skeletal Muscle", color: "blue"),
            itemB: CompareItem(name: "Cardiac / Smooth", color: "orange"),
            categories: [
                CompareCategory(id: "cmp-mt-1", label: "Striations — Skeletal", valueA: "Yes (striated)", valueB: "—"),
                CompareCategory(id: "cmp-mt-2", label: "Striations — Cardiac", valueA: "—", valueB: "Yes (striated), with intercalated discs"),
                CompareCategory(id: "cmp-mt-3", label: "Striations — Smooth", valueA: "—", valueB: "No striations (non-striated)"),
                CompareCategory(id: "cmp-mt-4", label: "Nuclei — Skeletal", valueA: "Multinucleated, peripheral nuclei", valueB: "—"),
                CompareCategory(id: "cmp-mt-5", label: "Nuclei — Cardiac", valueA: "—", valueB: "Usually 1-2 central nuclei"),
                CompareCategory(id: "cmp-mt-6", label: "Nuclei — Smooth", valueA: "—", valueB: "Single central nucleus"),
                CompareCategory(id: "cmp-mt-7", label: "Control — Skeletal", valueA: "Voluntary (somatic nervous system)", valueB: "—"),
                CompareCategory(id: "cmp-mt-8", label: "Control — Cardiac/Smooth", valueA: "—", valueB: "Involuntary (autonomic nervous system)"),
                CompareCategory(id: "cmp-mt-9", label: "Location — Skeletal", valueA: "Attached to bones", valueB: "—"),
                CompareCategory(id: "cmp-mt-10", label: "Location — Cardiac", valueA: "—", valueB: "Heart wall only"),
                CompareCategory(id: "cmp-mt-11", label: "Location — Smooth", valueA: "—", valueB: "Walls of hollow organs (GI tract, blood vessels, bladder)")
            ],
            weekNumber: 9
        ),

        CompareCard(
            id: "cmp-actin-myosin",
            title: "Actin vs Myosin",
            itemA: CompareItem(name: "Actin", color: "blue"),
            itemB: CompareItem(name: "Myosin", color: "orange"),
            categories: [
                CompareCategory(id: "cmp-am-1", label: "Type", valueA: "Thin filament", valueB: "Thick filament"),
                CompareCategory(id: "cmp-am-2", label: "Location in Sarcomere", valueA: "Extends from Z-disc through I-band into A-band", valueB: "Center of sarcomere (A-band)"),
                CompareCategory(id: "cmp-am-3", label: "Function", valueA: "Contains binding sites for myosin heads; slides during contraction", valueB: "Myosin heads form cross-bridges, pull actin toward center (power stroke)"),
                CompareCategory(id: "cmp-am-4", label: "Size", valueA: "Thinner (~5-9 nm diameter)", valueB: "Thicker (~12-18 nm diameter)")
            ],
            weekNumber: 10
        ),

        CompareCard(
            id: "cmp-flex-ext",
            title: "Flexion vs Extension",
            itemA: CompareItem(name: "Flexion", color: "blue"),
            itemB: CompareItem(name: "Extension", color: "orange"),
            categories: [
                CompareCategory(id: "cmp-fe-1", label: "Movement Direction", valueA: "Decreases the angle between bones at a joint", valueB: "Increases the angle between bones at a joint"),
                CompareCategory(id: "cmp-fe-2", label: "Angle Change", valueA: "Angle gets smaller (closing)", valueB: "Angle gets larger (opening)"),
                CompareCategory(id: "cmp-fe-3", label: "Examples", valueA: "Bending the elbow, bending the knee, nodding head forward", valueB: "Straightening the elbow, straightening the knee, tilting head back")
            ],
            weekNumber: 10
        )
    ]

    // MARK: - Week 11

    static let cardsWeek11: [CompareCard] = [

        CompareCard(
            id: "cmp-slow-fast-twitch",
            title: "Slow-Twitch vs Fast-Twitch Fibers",
            itemA: CompareItem(name: "Slow-Twitch (Type I)", color: "blue"),
            itemB: CompareItem(name: "Fast-Twitch (Type II)", color: "orange"),
            categories: [
                CompareCategory(id: "cmp-sf-1", label: "Contraction Speed", valueA: "Slow", valueB: "Fast"),
                CompareCategory(id: "cmp-sf-2", label: "Fatigue Resistance", valueA: "High; resistant to fatigue", valueB: "Low; fatigues quickly"),
                CompareCategory(id: "cmp-sf-3", label: "Color", valueA: "Red (high myoglobin content)", valueB: "White/pale (low myoglobin)"),
                CompareCategory(id: "cmp-sf-4", label: "Energy Source", valueA: "Aerobic (oxidative phosphorylation); uses O2", valueB: "Anaerobic (glycolysis); uses stored glycogen"),
                CompareCategory(id: "cmp-sf-5", label: "Fiber Diameter", valueA: "Smaller diameter", valueB: "Larger diameter")
            ],
            weekNumber: 11
        ),

        CompareCard(
            id: "cmp-isometric-isotonic",
            title: "Isometric vs Isotonic Contractions",
            itemA: CompareItem(name: "Isometric", color: "blue"),
            itemB: CompareItem(name: "Isotonic", color: "orange"),
            categories: [
                CompareCategory(id: "cmp-ii-1", label: "Muscle Length Change", valueA: "No change in muscle length", valueB: "Muscle length changes (shortens or lengthens)"),
                CompareCategory(id: "cmp-ii-2", label: "Movement", valueA: "No joint movement produced", valueB: "Joint movement occurs"),
                CompareCategory(id: "cmp-ii-3", label: "Tension", valueA: "Tension generated but does not overcome resistance", valueB: "Tension overcomes resistance, causing movement"),
                CompareCategory(id: "cmp-ii-4", label: "Examples", valueA: "Pushing against a wall, holding a plank, carrying a bag still", valueB: "Bicep curls, squats, walking, lifting objects")
            ],
            weekNumber: 11
        ),

        CompareCard(
            id: "cmp-concentric-eccentric",
            title: "Concentric vs Eccentric Contractions",
            itemA: CompareItem(name: "Concentric", color: "blue"),
            itemB: CompareItem(name: "Eccentric", color: "orange"),
            categories: [
                CompareCategory(id: "cmp-ce-1", label: "Muscle Action", valueA: "Muscle shortens while generating force", valueB: "Muscle lengthens while generating force"),
                CompareCategory(id: "cmp-ce-2", label: "Force vs Load", valueA: "Muscle force exceeds the load", valueB: "Load exceeds the muscle force"),
                CompareCategory(id: "cmp-ce-3", label: "Examples", valueA: "Lifting phase of a bicep curl, standing up from a squat", valueB: "Lowering phase of a bicep curl, walking downstairs, sitting down slowly")
            ],
            weekNumber: 11
        )
    ]
}
