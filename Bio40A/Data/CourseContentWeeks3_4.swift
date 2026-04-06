import Foundation

// MARK: - Course Content for Bio 40A, Weeks 3-4
// Cells (Ch 3) and Tissues (Ch 4)

extension CourseContent {

    // MARK: - Convenience alias
    private static let sr = Flashcard.SpacedRepetitionData()

    // MARK: - Aggregated arrays for weeks 3-4
    static let lessonsWeeks3_4: [Lesson] = [lesson5, lesson6, lesson7]
    static let quizzesWeeks3_4: [Quiz] = [quizWeeks3_4]
    static let flashcardDecksWeeks3_4: [FlashcardDeck] = [
        deckCellTransport,
        deckCellOrganelles,
        deckTissueTypes
    ]

    // =========================================================================
    // MARK: - LESSON 5: Cells Part 1 — Membrane & Transport
    // =========================================================================

    static let lesson5 = Lesson(
        id: "lesson-5",
        weekNumber: 3,
        classNumber: 5,
        title: "Cells Part 1: Membrane & Transport",
        subtitle: "Cell membrane structure, passive and active transport",
        textbookChapter: "Chapter 3",
        textbookSections: "3.1 - 3.3",
        sections: [
            LessonSection(
                id: "l5-s1",
                heading: "Cell Membrane Structure",
                content: """
                The plasma membrane (cell membrane) defines the boundary of every cell and controls \
                what enters and exits. Its fundamental architecture is the phospholipid bilayer — two \
                parallel layers of phospholipid molecules arranged with their hydrophilic (water-loving) \
                phosphate heads facing outward toward the aqueous environment and their hydrophobic \
                (water-fearing) fatty acid tails facing inward, away from water. This arrangement \
                creates a selectively permeable barrier. Cholesterol molecules are interspersed among \
                the phospholipids; they stabilize membrane fluidity by preventing the fatty acid tails \
                from packing too closely together at low temperatures and from moving too freely at \
                high temperatures. The fluid mosaic model describes the membrane as a dynamic structure \
                in which proteins float within or on the lipid bilayer like a mosaic of tiles. Integral \
                (transmembrane) proteins span the entire bilayer and often function as channels, carriers, \
                or receptors. Peripheral proteins attach loosely to the membrane's inner or outer surface \
                and frequently participate in cell signaling or anchor the cytoskeleton. Glycoproteins \
                and glycolipids on the extracellular surface form the glycocalyx, which aids in cell \
                recognition, protection, and adhesion.
                """,
                keyTerms: [
                    KeyTerm(id: "l5s1-k1", term: "Phospholipid Bilayer", definition: "A double layer of phospholipids forming the core of the cell membrane; hydrophilic heads face outward, hydrophobic tails face inward."),
                    KeyTerm(id: "l5s1-k2", term: "Integral Proteins", definition: "Transmembrane proteins that span the entire lipid bilayer; function as channels, carriers, receptors, or enzymes."),
                    KeyTerm(id: "l5s1-k3", term: "Peripheral Proteins", definition: "Proteins loosely attached to the inner or outer surface of the membrane; involved in signaling and structural support."),
                    KeyTerm(id: "l5s1-k4", term: "Cholesterol", definition: "A lipid interspersed among phospholipids that stabilizes membrane fluidity across temperature changes."),
                    KeyTerm(id: "l5s1-k5", term: "Fluid Mosaic Model", definition: "The accepted model describing the cell membrane as a dynamic, fluid structure with a mosaic of proteins embedded in or attached to the phospholipid bilayer."),
                    KeyTerm(id: "l5s1-k6", term: "Glycocalyx", definition: "A sugar-rich coat on the extracellular surface formed by glycoproteins and glycolipids; aids in cell recognition and protection.")
                ],
                testablesFacts: [
                    "The plasma membrane is composed of a phospholipid bilayer with embedded proteins, cholesterol, and carbohydrates.",
                    "Integral proteins span the membrane; peripheral proteins sit on one surface.",
                    "Cholesterol stabilizes membrane fluidity — it prevents both excessive rigidity and excessive fluidity.",
                    "The fluid mosaic model is the currently accepted description of membrane structure."
                ]
            ),
            LessonSection(
                id: "l5-s2",
                heading: "Passive Transport",
                content: """
                Passive transport moves substances across the membrane without the cell expending ATP; \
                movement follows the concentration gradient (from high to low concentration). Simple \
                diffusion is the net movement of small, nonpolar molecules (O₂, CO₂, lipid-soluble \
                substances) directly through the lipid bilayer down their concentration gradient. \
                Osmosis is the diffusion of water through a selectively permeable membrane from an area \
                of lower solute concentration to higher solute concentration. The tonicity of a solution \
                describes its effect on cell volume: a hypertonic solution has more solute than the cell, \
                causing the cell to shrink (crenation in red blood cells); a hypotonic solution has less \
                solute, causing the cell to swell and potentially lyse; an isotonic solution has equal \
                solute concentration, so there is no net water movement and cell volume stays the same. \
                Facilitated diffusion uses membrane proteins (channels or carriers) to transport larger \
                or polar molecules (glucose, ions) that cannot cross the lipid bilayer on their own. \
                Like simple diffusion, it follows the concentration gradient and requires no ATP. \
                Filtration is another passive process in which hydrostatic pressure forces fluid and \
                small solutes through a membrane (important in capillaries and kidney glomeruli).
                """,
                keyTerms: [
                    KeyTerm(id: "l5s2-k1", term: "Concentration Gradient", definition: "The difference in concentration of a substance between two areas; substances tend to move from high to low concentration."),
                    KeyTerm(id: "l5s2-k2", term: "Osmosis", definition: "The diffusion of water across a selectively permeable membrane toward the region of higher solute concentration."),
                    KeyTerm(id: "l5s2-k3", term: "Hypertonic", definition: "A solution with a higher solute concentration relative to another solution; cells placed in hypertonic solution lose water and shrink."),
                    KeyTerm(id: "l5s2-k4", term: "Hypotonic", definition: "A solution with a lower solute concentration relative to another solution; cells placed in hypotonic solution gain water and may lyse."),
                    KeyTerm(id: "l5s2-k5", term: "Isotonic", definition: "A solution with the same solute concentration as another solution; no net water movement occurs across the membrane."),
                    KeyTerm(id: "l5s2-k6", term: "Facilitated Diffusion", definition: "Passive transport of molecules across the membrane via specific carrier or channel proteins, following the concentration gradient without ATP.")
                ],
                testablesFacts: [
                    "Passive transport requires no ATP — substances move down their concentration gradient.",
                    "Simple diffusion moves small, nonpolar molecules directly through the bilayer.",
                    "Osmosis is specifically the diffusion of water.",
                    "Hypertonic = cell shrinks (crenation); hypotonic = cell swells/lyses; isotonic = no net change.",
                    "Facilitated diffusion requires membrane proteins but no ATP."
                ]
            ),
            LessonSection(
                id: "l5-s3",
                heading: "Active Transport",
                content: """
                Active transport moves substances against their concentration gradient (from low to high \
                concentration) and requires cellular energy in the form of ATP. Primary active transport \
                uses ATP directly to power carrier proteins (pumps). The most important example is the \
                sodium-potassium pump (Na⁺/K⁺ ATPase), which pumps 3 Na⁺ ions out of the cell and 2 K⁺ \
                ions into the cell per ATP hydrolyzed, maintaining the electrochemical gradient essential \
                for nerve impulses, muscle contraction, and cell volume. Secondary active transport \
                (cotransport) uses the energy stored in an ion gradient (created by primary active \
                transport) to move another substance; symporters move both substances in the same \
                direction, antiporters move them in opposite directions. Vesicular transport moves large \
                particles or bulk quantities of substances using membrane-bound vesicles. Endocytosis \
                brings material into the cell: phagocytosis engulfs large particles (\"cell eating\"), \
                pinocytosis takes in droplets of fluid (\"cell drinking\"), and receptor-mediated \
                endocytosis selectively imports specific molecules via coated pits. Exocytosis is the \
                reverse — vesicles fuse with the plasma membrane to release their contents outside the \
                cell (e.g., neurotransmitters, hormones).
                """,
                keyTerms: [
                    KeyTerm(id: "l5s3-k1", term: "Sodium-Potassium Pump", definition: "A primary active transport pump (Na⁺/K⁺ ATPase) that moves 3 Na⁺ out and 2 K⁺ into the cell per ATP, maintaining the electrochemical gradient."),
                    KeyTerm(id: "l5s3-k2", term: "Endocytosis", definition: "The process of bringing material into the cell by forming vesicles from the plasma membrane; includes phagocytosis, pinocytosis, and receptor-mediated endocytosis."),
                    KeyTerm(id: "l5s3-k3", term: "Exocytosis", definition: "The process of releasing material from the cell when a vesicle fuses with the plasma membrane."),
                    KeyTerm(id: "l5s3-k4", term: "Phagocytosis", definition: "\"Cell eating\" — a form of endocytosis in which large particles (bacteria, cell debris) are engulfed by pseudopods."),
                    KeyTerm(id: "l5s3-k5", term: "Pinocytosis", definition: "\"Cell drinking\" — a form of endocytosis in which small droplets of extracellular fluid are taken into the cell.")
                ],
                testablesFacts: [
                    "Active transport moves substances against their concentration gradient and requires ATP.",
                    "The Na⁺/K⁺ pump moves 3 Na⁺ out and 2 K⁺ in per ATP molecule.",
                    "Endocytosis brings material in; exocytosis releases material out.",
                    "Phagocytosis = 'cell eating'; pinocytosis = 'cell drinking'.",
                    "Receptor-mediated endocytosis is selective and uses coated pits."
                ]
            )
        ],
        clinicalApplication: ClinicalApplication(
            title: "IV Fluid Tonicity for EMTs",
            scenario: "A paramedic starts an IV on a dehydrated patient. Choosing the correct fluid tonicity is critical: normal saline (0.9% NaCl) is isotonic and is the standard prehospital resuscitation fluid. If a hypotonic solution were mistakenly given in large volume, water would move into cells by osmosis, potentially causing cerebral edema. A hypertonic solution can draw water out of cells and is reserved for specific situations such as severe hyponatremia.",
            connection: "Understanding tonicity prevents dangerous fluid shifts. EMTs must know that isotonic fluids (normal saline, lactated Ringer's) are safe for volume replacement because they do not cause net water movement into or out of cells."
        )
    )

    // =========================================================================
    // MARK: - LESSON 6: Cells Part 2 — Organelles, Protein Synthesis & Division
    // =========================================================================

    static let lesson6 = Lesson(
        id: "lesson-6",
        weekNumber: 3,
        classNumber: 6,
        title: "Cells Part 2: Organelles, Protein Synthesis & Division",
        subtitle: "Cell organelles, DNA to protein pathway, and mitosis",
        textbookChapter: "Chapter 3",
        textbookSections: "3.3 - 3.5",
        sections: [
            LessonSection(
                id: "l6-s1",
                heading: "Cell Organelles",
                content: """
                The cytoplasm includes all cellular material between the plasma membrane and the nucleus \
                and is composed of cytosol (intracellular fluid), organelles, and inclusions. The nucleus \
                is the control center of the cell; it houses DNA organized as chromatin (diffuse form) \
                or chromosomes (condensed form during division) and contains the nucleolus, which \
                assembles ribosomal RNA. Ribosomes are the sites of protein synthesis; they may be free \
                in the cytosol (producing proteins used within the cell) or bound to the rough \
                endoplasmic reticulum (producing proteins for export or membrane insertion). The rough \
                endoplasmic reticulum (rough ER) is studded with ribosomes and synthesizes, folds, and \
                transports proteins. The smooth endoplasmic reticulum (smooth ER) lacks ribosomes and \
                is involved in lipid synthesis, detoxification, and calcium ion storage. The Golgi \
                apparatus receives proteins from the ER, modifies them (glycosylation, phosphorylation), \
                sorts them, and packages them into vesicles for secretion, membrane incorporation, or \
                delivery to lysosomes. Lysosomes are membrane-bound sacs of digestive enzymes (acid \
                hydrolases) that break down worn-out organelles, pathogens, and ingested material at \
                an acidic pH (~5). Peroxisomes detoxify harmful substances (e.g., hydrogen peroxide, \
                alcohol) using oxidative enzymes. Mitochondria are the \"powerhouses\" of the cell; they \
                have a double membrane (the inner membrane is folded into cristae) and produce most of \
                the cell's ATP via aerobic cellular respiration. The cytoskeleton consists of \
                microfilaments (actin), intermediate filaments, and microtubules that provide structural \
                support, enable cell movement, and organize organelle positions. Centrioles (paired \
                barrel-shaped structures near the nucleus) help organize the mitotic spindle during \
                cell division.
                """,
                keyTerms: [
                    KeyTerm(id: "l6s1-k1", term: "Mitochondria", definition: "Double-membrane organelles that produce ATP via aerobic cellular respiration; have their own DNA and inner membrane folds called cristae."),
                    KeyTerm(id: "l6s1-k2", term: "Rough Endoplasmic Reticulum", definition: "A network of membrane-enclosed channels studded with ribosomes; synthesizes and transports proteins destined for export or the membrane."),
                    KeyTerm(id: "l6s1-k3", term: "Smooth Endoplasmic Reticulum", definition: "ER lacking ribosomes; involved in lipid synthesis, detoxification, and calcium storage."),
                    KeyTerm(id: "l6s1-k4", term: "Golgi Apparatus", definition: "A stack of flattened membrane sacs that modifies, sorts, and packages proteins and lipids into vesicles."),
                    KeyTerm(id: "l6s1-k5", term: "Lysosomes", definition: "Membrane-bound organelles containing digestive enzymes (acid hydrolases) that break down waste, debris, and pathogens."),
                    KeyTerm(id: "l6s1-k6", term: "Chromatin", definition: "Loosely coiled DNA-protein (histone) complex found in the nucleus during interphase; condenses into chromosomes during division.")
                ],
                testablesFacts: [
                    "Mitochondria are the primary ATP-producing organelles and have their own DNA.",
                    "Rough ER has ribosomes and makes proteins; smooth ER lacks ribosomes and makes lipids.",
                    "The Golgi apparatus modifies, sorts, and packages proteins from the ER.",
                    "Lysosomes contain acid hydrolases that digest cellular waste and pathogens.",
                    "Free ribosomes make proteins for intracellular use; bound ribosomes make proteins for export."
                ]
            ),
            LessonSection(
                id: "l6-s2",
                heading: "Protein Synthesis",
                content: """
                Protein synthesis is the process by which the information in DNA is used to build \
                proteins. It occurs in two major steps: transcription and translation. The central \
                dogma of molecular biology summarizes the flow: DNA → RNA → Protein. \
                \
                Transcription occurs in the nucleus. The enzyme RNA polymerase reads one strand of \
                the DNA double helix (the template strand) and synthesizes a complementary messenger \
                RNA (mRNA) molecule. The base-pairing rules for RNA are: adenine pairs with uracil (A-U), \
                and cytosine pairs with guanine (C-G). The mRNA transcript is processed (capped, given \
                a poly-A tail, and spliced to remove introns) and then exits the nucleus through nuclear \
                pores. \
                \
                Translation occurs at ribosomes in the cytoplasm. The ribosome reads the mRNA in \
                three-nucleotide units called codons. Transfer RNA (tRNA) molecules carry specific \
                amino acids and have an anticodon complementary to the mRNA codon. As the ribosome \
                moves along the mRNA, tRNAs deliver amino acids that are joined by peptide bonds to \
                form a growing polypeptide chain. Translation begins at the start codon (AUG, which \
                codes for methionine) and ends at a stop codon (UAA, UAG, or UGA).
                """,
                keyTerms: [
                    KeyTerm(id: "l6s2-k1", term: "Transcription", definition: "The process of copying a gene's DNA sequence into a complementary mRNA molecule; occurs in the nucleus."),
                    KeyTerm(id: "l6s2-k2", term: "Translation", definition: "The process of reading the mRNA codons at the ribosome to assemble a specific sequence of amino acids into a polypeptide."),
                    KeyTerm(id: "l6s2-k3", term: "mRNA (Messenger RNA)", definition: "RNA molecule transcribed from DNA that carries the genetic code from the nucleus to the ribosome."),
                    KeyTerm(id: "l6s2-k4", term: "tRNA (Transfer RNA)", definition: "RNA molecule that carries a specific amino acid to the ribosome; has an anticodon complementary to an mRNA codon."),
                    KeyTerm(id: "l6s2-k5", term: "Codon", definition: "A three-nucleotide sequence on mRNA that specifies a particular amino acid or stop signal."),
                    KeyTerm(id: "l6s2-k6", term: "Ribosome", definition: "Organelle composed of rRNA and proteins; the site of translation where amino acids are assembled into polypeptides.")
                ],
                testablesFacts: [
                    "The central dogma: DNA → RNA → Protein.",
                    "Transcription occurs in the nucleus; translation occurs at ribosomes in the cytoplasm.",
                    "In RNA, uracil (U) replaces thymine (T): A pairs with U, C pairs with G.",
                    "Codons are three-nucleotide sequences on mRNA; each codon specifies one amino acid.",
                    "AUG is the start codon (methionine); UAA, UAG, UGA are stop codons."
                ]
            ),
            LessonSection(
                id: "l6-s3",
                heading: "Cell Cycle and Mitosis",
                content: """
                The cell cycle is the series of events a cell undergoes from one division to the next. \
                It consists of interphase and the mitotic (M) phase. Interphase is the longest part of \
                the cycle and has three sub-phases: G₁ (growth and normal metabolism), S (DNA synthesis — \
                each chromosome is replicated to form two identical sister chromatids joined at the \
                centromere), and G₂ (preparation for division, organelle replication, protein synthesis). \
                \
                The mitotic phase includes mitosis (nuclear division) and cytokinesis (cytoplasmic \
                division). Mitosis is divided into four stages — remembered by the mnemonic PMAT: \
                Prophase: chromatin condenses into visible chromosomes, the nuclear envelope breaks \
                down, and the mitotic spindle (composed of spindle fibers/microtubules) begins to form \
                from the centrioles. Metaphase: chromosomes line up along the cell's equator (the \
                metaphase plate); spindle fibers attach to the centromeres via kinetochores. Anaphase: \
                sister chromatids are pulled apart toward opposite poles of the cell as spindle fibers \
                shorten. Telophase: chromosomes arrive at opposite poles, the nuclear envelope re-forms \
                around each set, chromosomes decondense back into chromatin, and the nucleolus reappears. \
                Cytokinesis divides the cytoplasm; in animal cells a cleavage furrow pinches the cell in \
                two. The result is two genetically identical daughter cells. Cells that are no longer \
                dividing exit the cycle into G₀ phase.
                """,
                keyTerms: [
                    KeyTerm(id: "l6s3-k1", term: "Interphase", definition: "The longest phase of the cell cycle (G₁, S, G₂); the cell grows, replicates DNA, and prepares for division."),
                    KeyTerm(id: "l6s3-k2", term: "Centromere", definition: "The constricted region where two sister chromatids are joined; the attachment point for spindle fibers via kinetochores."),
                    KeyTerm(id: "l6s3-k3", term: "Spindle Fibers", definition: "Microtubule structures that form from centrioles and pull chromatids apart during mitosis."),
                    KeyTerm(id: "l6s3-k4", term: "PMAT (Mitosis Stages)", definition: "Prophase, Metaphase, Anaphase, Telophase — the four sequential stages of mitosis."),
                    KeyTerm(id: "l6s3-k5", term: "Cytokinesis", definition: "Division of the cytoplasm after mitosis; in animal cells, a cleavage furrow pinches the cell in two."),
                    KeyTerm(id: "l6s3-k6", term: "Sister Chromatids", definition: "Two identical copies of a chromosome produced during S phase, joined at the centromere until separated in anaphase.")
                ],
                testablesFacts: [
                    "Interphase (G₁, S, G₂) is the longest phase of the cell cycle.",
                    "DNA replication occurs during the S (synthesis) phase of interphase.",
                    "PMAT: Prophase → Metaphase → Anaphase → Telophase.",
                    "In metaphase, chromosomes align at the metaphase plate; in anaphase, sister chromatids separate.",
                    "Mitosis produces two genetically identical daughter cells.",
                    "Cells that stop dividing enter G₀ phase."
                ]
            )
        ],
        clinicalApplication: ClinicalApplication(
            title: "Cancer as Uncontrolled Cell Division",
            scenario: "Cancer results when mutations in genes controlling the cell cycle (proto-oncogenes, tumor suppressor genes) allow cells to divide without normal checkpoints. The cell cycle has built-in checkpoints (G₁, G₂, and M checkpoints) that normally prevent damaged cells from dividing. When these controls fail, cells proliferate uncontrollably, forming tumors. Malignant tumors can invade surrounding tissues and metastasize (spread) to distant sites.",
            connection: "EMTs and healthcare providers encounter cancer patients frequently. Understanding that cancer is fundamentally a disease of uncontrolled mitosis helps explain why treatments like chemotherapy target rapidly dividing cells and why side effects (hair loss, GI upset) occur in tissues with naturally high mitotic rates."
        )
    )

    // =========================================================================
    // MARK: - LESSON 7: Tissues Part 1 — Epithelial & Connective Tissue
    // =========================================================================

    static let lesson7 = Lesson(
        id: "lesson-7",
        weekNumber: 4,
        classNumber: 7,
        title: "Tissues Part 1: Epithelial & Connective",
        subtitle: "Four primary tissue types, with focus on epithelial and connective tissue",
        textbookChapter: "Chapter 4",
        textbookSections: "4.1 - 4.3",
        sections: [
            LessonSection(
                id: "l7-s1",
                heading: "Overview of the Four Primary Tissue Types",
                content: """
                A tissue is a group of similar cells and their extracellular matrix that perform a \
                common function. The human body has four primary tissue types: \
                1) Epithelial tissue covers body surfaces, lines body cavities and hollow organs, and \
                forms glands. It is specialized for protection, absorption, filtration, and secretion. \
                2) Connective tissue is the most abundant and widely distributed tissue type; it supports, \
                protects, and binds together other tissues. \
                3) Muscle tissue is specialized for contraction and comes in three types — skeletal, \
                cardiac, and smooth. \
                4) Nervous tissue is specialized for generating and conducting electrical impulses and \
                consists of neurons and supporting neuroglia (glial cells). \
                Each tissue type will be studied in detail. This lesson focuses on epithelial and \
                connective tissues.
                """,
                keyTerms: [
                    KeyTerm(id: "l7s1-k1", term: "Tissue", definition: "A group of similar cells and their extracellular products that carry out a specific function."),
                    KeyTerm(id: "l7s1-k2", term: "Epithelial Tissue", definition: "Tissue that covers body surfaces, lines cavities, and forms glands; specialized for protection, absorption, secretion, and filtration."),
                    KeyTerm(id: "l7s1-k3", term: "Connective Tissue", definition: "The most abundant tissue type; supports, protects, and binds other tissues. Characterized by cells scattered within an extracellular matrix."),
                    KeyTerm(id: "l7s1-k4", term: "Muscle Tissue", definition: "Tissue specialized for contraction and movement; three types are skeletal, cardiac, and smooth."),
                    KeyTerm(id: "l7s1-k5", term: "Nervous Tissue", definition: "Tissue consisting of neurons and neuroglia; specialized for generating and transmitting electrical impulses.")
                ],
                testablesFacts: [
                    "The four primary tissue types are: epithelial, connective, muscle, and nervous.",
                    "Connective tissue is the most abundant and widely distributed tissue type in the body.",
                    "Epithelial tissue covers surfaces and lines cavities; connective tissue supports and binds.",
                    "Muscle tissue contracts; nervous tissue conducts electrical impulses."
                ]
            ),
            LessonSection(
                id: "l7-s2",
                heading: "Epithelial Tissue",
                content: """
                Epithelial tissue (epithelium) has several distinguishing characteristics: cellularity \
                (cells are tightly packed with minimal extracellular matrix), polarity (an apical surface \
                facing an open space and a basal surface attached to underlying connective tissue via a \
                basement membrane), avascularity (no blood vessels — nutrients diffuse from underlying \
                connective tissue), high regeneration capacity, and innervation (supplied with nerves). \
                \
                Epithelium is classified by two criteria: number of cell layers and cell shape. \
                By layers: simple epithelium has one cell layer (for absorption/filtration), and \
                stratified epithelium has multiple layers (for protection). Pseudostratified appears \
                layered but all cells contact the basement membrane. \
                By shape: squamous cells are flat and scale-like, cuboidal cells are roughly cube-shaped, \
                and columnar cells are taller than they are wide. \
                \
                Key types: Simple squamous (thin, for diffusion — lines alveoli, blood vessels as \
                endothelium, serous membranes as mesothelium). Simple cuboidal (secretion/absorption — \
                kidney tubules, gland ducts). Simple columnar (absorption/secretion — lines most of the \
                GI tract; often has goblet cells that secrete mucus and may have microvilli). \
                Pseudostratified ciliated columnar (lines much of the respiratory tract; cilia sweep \
                mucus upward). Stratified squamous (protection against abrasion — skin epidermis \
                [keratinized], lining of mouth/esophagus/vagina [non-keratinized]). Transitional \
                epithelium (stretches — lines the urinary bladder and ureters).
                """,
                keyTerms: [
                    KeyTerm(id: "l7s2-k1", term: "Basement Membrane", definition: "A thin extracellular layer between the epithelium and underlying connective tissue; anchors the epithelium and acts as a selective filter."),
                    KeyTerm(id: "l7s2-k2", term: "Apical Surface", definition: "The upper, free surface of an epithelial cell facing the body exterior or cavity lumen."),
                    KeyTerm(id: "l7s2-k3", term: "Basal Surface", definition: "The lower surface of an epithelial cell that is attached to the basement membrane."),
                    KeyTerm(id: "l7s2-k4", term: "Goblet Cells", definition: "Modified columnar epithelial cells that secrete mucus; found in the lining of the intestines and respiratory tract."),
                    KeyTerm(id: "l7s2-k5", term: "Simple Squamous Epithelium", definition: "A single layer of flat cells specialized for diffusion and filtration; forms endothelium (blood vessels) and mesothelium (serous membranes)."),
                    KeyTerm(id: "l7s2-k6", term: "Stratified Squamous Epithelium", definition: "Multiple layers of cells with flat surface cells; provides protection against abrasion. Keratinized in skin, non-keratinized in mouth/esophagus."),
                    KeyTerm(id: "l7s2-k7", term: "Pseudostratified Columnar Epithelium", definition: "Appears stratified but all cells rest on the basement membrane; often ciliated, lines the respiratory tract.")
                ],
                testablesFacts: [
                    "Epithelium is avascular — it receives nutrients by diffusion from underlying connective tissue.",
                    "Epithelium is classified by layers (simple vs stratified) and cell shape (squamous, cuboidal, columnar).",
                    "The apical surface faces the lumen or exterior; the basal surface attaches to the basement membrane.",
                    "Simple squamous epithelium lines alveoli (gas exchange) and blood vessels (endothelium).",
                    "Stratified squamous epithelium protects against abrasion (skin, mouth, esophagus).",
                    "Pseudostratified ciliated columnar epithelium lines the respiratory tract and moves mucus via cilia.",
                    "Goblet cells secrete mucus in the GI and respiratory tracts."
                ]
            ),
            LessonSection(
                id: "l7-s3",
                heading: "Connective Tissue",
                content: """
                Connective tissue is distinguished from other tissue types by having relatively few cells \
                scattered within an abundant extracellular matrix. The extracellular matrix has two \
                components: ground substance (a gel-like material ranging from fluid to solid) and \
                protein fibers. Three types of fibers are found in connective tissue: collagen fibers \
                (thick, strong, resist tension), elastic fibers (thinner, allow stretch and recoil, made \
                of elastin), and reticular fibers (thin, branching, form supportive networks). \
                \
                The primary cell type in most connective tissues proper is the fibroblast, which produces \
                the fibers and ground substance. Other cells include macrophages (phagocytic immune cells), \
                mast cells (release histamine during inflammation), adipocytes (fat cells), and white \
                blood cells that migrate in from the blood. \
                \
                Connective tissue is classified into three broad categories: \
                1) Connective tissue proper — includes loose (areolar, adipose, reticular) and dense \
                (dense regular, dense irregular, elastic). Areolar tissue is the most widely distributed \
                connective tissue; it is a soft, gel-like tissue with all three fiber types that serves \
                as a universal packing material. Adipose tissue stores fat for energy, insulation, and \
                cushioning. Dense regular connective tissue has parallel collagen fibers and forms tendons \
                and ligaments. Dense irregular connective tissue has collagen fibers in many directions \
                and forms the dermis of the skin and organ capsules. \
                2) Supportive connective tissue — cartilage (hyaline, elastic, fibrocartilage) and bone. \
                3) Fluid connective tissue — blood and lymph.
                """,
                keyTerms: [
                    KeyTerm(id: "l7s3-k1", term: "Fibroblasts", definition: "The most common cells in connective tissue proper; they secrete the fibers and ground substance of the extracellular matrix."),
                    KeyTerm(id: "l7s3-k2", term: "Collagen Fibers", definition: "The strongest and most abundant protein fibers in connective tissue; provide tensile strength and resist stretching."),
                    KeyTerm(id: "l7s3-k3", term: "Elastin", definition: "A protein that forms elastic fibers, allowing tissues to stretch and recoil (e.g., in skin, lungs, arteries)."),
                    KeyTerm(id: "l7s3-k4", term: "Areolar Tissue", definition: "The most widely distributed connective tissue; a loose, gel-like packing material containing all three fiber types. Found beneath epithelium and around organs."),
                    KeyTerm(id: "l7s3-k5", term: "Adipose Tissue", definition: "Connective tissue specialized for fat storage; provides insulation, energy reserve, and cushioning."),
                    KeyTerm(id: "l7s3-k6", term: "Ground Substance", definition: "The gel-like material in the extracellular matrix (between the cells and fibers) composed of water, proteins, and polysaccharides.")
                ],
                testablesFacts: [
                    "Connective tissue is characterized by cells scattered in an extracellular matrix of ground substance and fibers.",
                    "Collagen fibers provide strength; elastic fibers provide stretch and recoil; reticular fibers form supportive networks.",
                    "Fibroblasts are the primary cells of connective tissue proper — they produce the matrix.",
                    "Areolar tissue is the most common connective tissue and is found nearly everywhere in the body.",
                    "Adipose tissue stores energy as fat and provides insulation and cushioning.",
                    "Dense regular CT (tendons/ligaments) has parallel collagen; dense irregular CT (dermis) has multidirectional collagen.",
                    "The three broad categories of CT are: connective tissue proper, supportive (cartilage/bone), and fluid (blood/lymph)."
                ]
            )
        ],
        clinicalApplication: ClinicalApplication(
            title: "Wound Healing and Tissue Repair",
            scenario: "When skin is cut, the body initiates a repair process involving both epithelial and connective tissue. Inflammation occurs first (redness, swelling, heat, pain) as blood flow increases and immune cells migrate to the site. Fibroblasts then proliferate and produce collagen to form granulation tissue, which fills the wound. Epithelial cells regenerate to cover the surface. If the wound is deep, dense irregular connective tissue (scar tissue) replaces the original tissue, resulting in fibrosis.",
            connection: "EMTs manage wounds in the field. Understanding that wound healing requires clean edges (for better epithelial regeneration) and that contaminated wounds are prone to excessive scarring helps explain why proper wound care — cleaning, bandaging, and controlling infection — is a priority in prehospital medicine."
        )
    )

    // =========================================================================
    // MARK: - QUIZ: Weeks 3-4 Review (Cells & Tissues)
    // =========================================================================

    static let quizWeeks3_4 = Quiz(
        id: "quiz-weeks3-4",
        title: "Weeks 3-4 Review: Cells & Tissues",
        weekNumber: 4,
        lessonIds: ["lesson-5", "lesson-6", "lesson-7"],
        questions: [
            // Q1 - Easy / Recall
            QuizQuestion(
                id: "q3-01",
                question: "What is the primary structural component of the cell membrane?",
                choices: [
                    "Cholesterol molecules",
                    "Phospholipid bilayer",
                    "Integral proteins",
                    "Glycocalyx"
                ],
                correctIndex: 1,
                explanation: "The cell membrane is fundamentally composed of a phospholipid bilayer — two layers of phospholipids with hydrophilic heads facing outward and hydrophobic tails facing inward.",
                difficulty: .easy,
                category: .recall
            ),
            // Q2 - Easy / Recall
            QuizQuestion(
                id: "q3-02",
                question: "Which type of transport requires NO cellular energy (ATP)?",
                choices: [
                    "Active transport via the sodium-potassium pump",
                    "Endocytosis",
                    "Facilitated diffusion",
                    "Exocytosis"
                ],
                correctIndex: 2,
                explanation: "Facilitated diffusion is a form of passive transport that uses membrane proteins to move substances down their concentration gradient without ATP.",
                difficulty: .easy,
                category: .recall
            ),
            // Q3 - Easy / Recall
            QuizQuestion(
                id: "q3-03",
                question: "What happens to a red blood cell placed in a hypertonic solution?",
                choices: [
                    "It swells and may lyse",
                    "It remains the same size",
                    "It shrinks (crenation)",
                    "It divides by mitosis"
                ],
                correctIndex: 2,
                explanation: "In a hypertonic solution, water moves out of the cell by osmosis, causing the cell to shrink. This is called crenation in red blood cells.",
                difficulty: .easy,
                category: .recall
            ),
            // Q4 - Easy / Recall
            QuizQuestion(
                id: "q3-04",
                question: "Which organelle is known as the 'powerhouse' of the cell?",
                choices: [
                    "Golgi apparatus",
                    "Lysosome",
                    "Ribosome",
                    "Mitochondrion"
                ],
                correctIndex: 3,
                explanation: "Mitochondria produce most of the cell's ATP through aerobic cellular respiration. They have a double membrane with inner folds called cristae.",
                difficulty: .easy,
                category: .recall
            ),
            // Q5 - Easy / Recall
            QuizQuestion(
                id: "q3-05",
                question: "What are the four primary tissue types in the human body?",
                choices: [
                    "Epithelial, connective, skeletal, nervous",
                    "Epithelial, connective, muscle, nervous",
                    "Epithelial, cartilage, muscle, nervous",
                    "Skin, bone, muscle, brain"
                ],
                correctIndex: 1,
                explanation: "The four primary tissue types are epithelial, connective, muscle, and nervous tissue.",
                difficulty: .easy,
                category: .recall
            ),
            // Q6 - Easy / Recall
            QuizQuestion(
                id: "q3-06",
                question: "During which phase of the cell cycle does DNA replication occur?",
                choices: [
                    "G₁ phase",
                    "S phase",
                    "G₂ phase",
                    "M phase"
                ],
                correctIndex: 1,
                explanation: "DNA replication occurs during the S (synthesis) phase of interphase, producing two identical sister chromatids joined at the centromere.",
                difficulty: .easy,
                category: .recall
            ),
            // Q7 - Easy / Recall
            QuizQuestion(
                id: "q3-07",
                question: "Which connective tissue cell type produces collagen and other matrix fibers?",
                choices: [
                    "Macrophage",
                    "Mast cell",
                    "Fibroblast",
                    "Adipocyte"
                ],
                correctIndex: 2,
                explanation: "Fibroblasts are the primary cells of connective tissue proper. They secrete collagen, elastic, and reticular fibers as well as the ground substance.",
                difficulty: .easy,
                category: .recall
            ),
            // Q8 - Easy / Recall
            QuizQuestion(
                id: "q3-08",
                question: "What does the central dogma of molecular biology describe?",
                choices: [
                    "ATP → ADP + Energy",
                    "DNA → RNA → Protein",
                    "Glucose → Pyruvate → CO₂",
                    "Protein → RNA → DNA"
                ],
                correctIndex: 1,
                explanation: "The central dogma states that genetic information flows from DNA to RNA (transcription) to protein (translation): DNA → RNA → Protein.",
                difficulty: .easy,
                category: .recall
            ),
            // Q9 - Medium / Application
            QuizQuestion(
                id: "q3-09",
                question: "A cell needs to move glucose from an area of LOW concentration to HIGH concentration. Which process will it use?",
                choices: [
                    "Simple diffusion",
                    "Osmosis",
                    "Facilitated diffusion",
                    "Active transport"
                ],
                correctIndex: 3,
                explanation: "Moving a substance against its concentration gradient (from low to high) requires energy — this is active transport. Passive processes only move substances down their gradient.",
                difficulty: .medium,
                category: .application
            ),
            // Q10 - Medium / Application
            QuizQuestion(
                id: "q3-10",
                question: "A protein is being synthesized for secretion from the cell. In what order does it pass through organelles?",
                choices: [
                    "Golgi → Rough ER → Vesicle → Plasma membrane",
                    "Smooth ER → Golgi → Lysosome → Plasma membrane",
                    "Rough ER → Golgi → Vesicle → Plasma membrane",
                    "Free ribosome → Lysosome → Golgi → Plasma membrane"
                ],
                correctIndex: 2,
                explanation: "Proteins destined for export are synthesized on rough ER ribosomes, transported to the Golgi apparatus for modification and packaging, then shipped in vesicles to the plasma membrane for exocytosis.",
                difficulty: .medium,
                category: .application
            ),
            // Q11 - Medium / Application
            QuizQuestion(
                id: "q3-11",
                question: "The lining of the trachea is composed of pseudostratified ciliated columnar epithelium with goblet cells. What is the function of the cilia?",
                choices: [
                    "Absorb nutrients from inhaled air",
                    "Secrete mucus to trap pathogens",
                    "Sweep mucus and trapped particles upward toward the throat",
                    "Increase surface area for gas exchange"
                ],
                correctIndex: 2,
                explanation: "Cilia in the respiratory tract beat in coordinated waves to move the mucus blanket (produced by goblet cells) upward, trapping and removing inhaled particles and pathogens.",
                difficulty: .medium,
                category: .application
            ),
            // Q12 - Medium / Application
            QuizQuestion(
                id: "q3-12",
                question: "During which phase of mitosis do sister chromatids separate and move toward opposite poles?",
                choices: [
                    "Prophase",
                    "Metaphase",
                    "Anaphase",
                    "Telophase"
                ],
                correctIndex: 2,
                explanation: "During anaphase, the centromeres split and spindle fibers shorten, pulling the sister chromatids apart toward opposite poles of the cell.",
                difficulty: .medium,
                category: .application
            ),
            // Q13 - Medium / Application
            QuizQuestion(
                id: "q3-13",
                question: "Which type of epithelium would you expect to find lining the alveoli of the lungs, where gas exchange occurs?",
                choices: [
                    "Stratified squamous epithelium",
                    "Simple cuboidal epithelium",
                    "Simple squamous epithelium",
                    "Transitional epithelium"
                ],
                correctIndex: 2,
                explanation: "Simple squamous epithelium is a single layer of flat cells — thin enough to permit rapid diffusion of O₂ and CO₂ across the alveolar walls.",
                difficulty: .medium,
                category: .application
            ),
            // Q14 - Medium / Recall
            QuizQuestion(
                id: "q3-14",
                question: "How many Na⁺ ions are pumped OUT and how many K⁺ ions are pumped IN per cycle of the sodium-potassium pump?",
                choices: [
                    "2 Na⁺ out, 3 K⁺ in",
                    "3 Na⁺ out, 2 K⁺ in",
                    "3 Na⁺ out, 3 K⁺ in",
                    "2 Na⁺ out, 2 K⁺ in"
                ],
                correctIndex: 1,
                explanation: "The Na⁺/K⁺ ATPase pumps 3 Na⁺ out of the cell and 2 K⁺ into the cell per molecule of ATP hydrolyzed.",
                difficulty: .medium,
                category: .recall
            ),
            // Q15 - Hard / Analysis
            QuizQuestion(
                id: "q3-15",
                question: "A tissue sample shows multiple layers of cells with flat cells at the surface but cuboidal/columnar cells in deeper layers. It is found lining the esophagus. What type of tissue is this?",
                choices: [
                    "Simple squamous epithelium",
                    "Pseudostratified columnar epithelium",
                    "Stratified squamous epithelium (non-keratinized)",
                    "Transitional epithelium"
                ],
                correctIndex: 2,
                explanation: "The esophagus is lined with non-keratinized stratified squamous epithelium. Multiple layers with flat surface cells protect against abrasion from swallowed food. It is non-keratinized because it is a wet internal surface.",
                difficulty: .hard,
                category: .analysis
            ),
            // Q16 - Hard / Analysis
            QuizQuestion(
                id: "q3-16",
                question: "If a drug blocks RNA polymerase, which cellular process would be DIRECTLY inhibited?",
                choices: [
                    "DNA replication",
                    "Transcription",
                    "Translation",
                    "Mitosis"
                ],
                correctIndex: 1,
                explanation: "RNA polymerase is the enzyme that reads DNA and synthesizes mRNA during transcription. Blocking it would directly prevent transcription, and without mRNA, translation would also eventually cease.",
                difficulty: .hard,
                category: .analysis
            ),
            // Q17 - Hard / Analysis
            QuizQuestion(
                id: "q3-17",
                question: "A connective tissue sample has densely packed collagen fibers arranged in parallel bundles with fibroblasts squeezed between the fibers. This tissue is most likely from which structure?",
                choices: [
                    "Dermis of the skin",
                    "Tendon",
                    "Areolar tissue under the skin",
                    "Hyaline cartilage"
                ],
                correctIndex: 1,
                explanation: "Dense regular connective tissue has parallel collagen bundles — this arrangement provides great tensile strength in one direction. Tendons (connecting muscle to bone) and ligaments (bone to bone) are composed of dense regular CT. The dermis has dense irregular CT with multidirectional fibers.",
                difficulty: .hard,
                category: .analysis
            ),
            // Q18 - Hard / Analysis
            QuizQuestion(
                id: "q3-18",
                question: "Why does the inner membrane of the mitochondrion have extensive folds (cristae)?",
                choices: [
                    "To store calcium ions for muscle contraction",
                    "To increase surface area for ATP-producing reactions of the electron transport chain",
                    "To provide attachment sites for ribosomes",
                    "To separate mitochondrial DNA from the rest of the organelle"
                ],
                correctIndex: 1,
                explanation: "The cristae fold the inner membrane to greatly increase the surface area available for the electron transport chain and ATP synthase, which are embedded in the inner membrane and produce most of the cell's ATP.",
                difficulty: .hard,
                category: .analysis
            ),
            // Q19 - Clinical
            QuizQuestion(
                id: "q3-19",
                question: "A severely dehydrated patient arrives by ambulance. The EMT starts an IV of normal saline (0.9% NaCl). Why is this fluid chosen over sterile distilled water?",
                choices: [
                    "Sterile water is too expensive for prehospital use",
                    "Normal saline is hypertonic and will draw fluid out of swollen tissues",
                    "Normal saline is isotonic and will not cause red blood cells to swell and lyse",
                    "Sterile water contains bacteria that would cause infection"
                ],
                correctIndex: 2,
                explanation: "Normal saline (0.9% NaCl) is isotonic to blood — it has the same osmolarity as body fluids. Infusing pure water (hypotonic) would cause water to enter red blood cells by osmosis, making them swell and potentially burst (hemolysis).",
                difficulty: .medium,
                category: .clinical
            ),
            // Q20 - Clinical
            QuizQuestion(
                id: "q3-20",
                question: "A patient's biopsy shows cells dividing rapidly with no apparent organization, and many cells are in mitosis at the same time. Which condition does this most likely suggest?",
                choices: [
                    "Normal wound healing",
                    "Hypertrophy from exercise",
                    "Cancer (a malignant neoplasm)",
                    "Atrophy from disuse"
                ],
                correctIndex: 2,
                explanation: "Cancer is characterized by uncontrolled cell division — cells bypass normal cell cycle checkpoints and divide rapidly without normal tissue organization. A high mitotic index (many cells in mitosis) is a hallmark of malignancy.",
                difficulty: .medium,
                category: .clinical
            )
        ],
        timeLimit: 2400  // 40 minutes
    )

    // =========================================================================
    // MARK: - FLASHCARD DECK: Cell Transport
    // =========================================================================

    static let deckCellTransport = FlashcardDeck(
        id: "deck-cell-transport",
        title: "Cell Transport",
        weekNumber: 3,
        category: "Cells",
        cards: [
            Flashcard(id: "fc-ct01", front: "Phospholipid Bilayer", back: "The double layer of phospholipids forming the cell membrane. Hydrophilic phosphate heads face outward; hydrophobic fatty acid tails face inward.", hint: "Think: two rows of lollipops facing outward", repetition: sr),
            Flashcard(id: "fc-ct02", front: "Integral (Transmembrane) Proteins", back: "Proteins that span the entire membrane. Functions include channels, carriers, receptors, and enzymes.", hint: "Integral = 'in' the membrane", repetition: sr),
            Flashcard(id: "fc-ct03", front: "Peripheral Proteins", back: "Proteins loosely attached to one surface of the membrane. Involved in signaling and cytoskeleton attachment.", hint: "Peripheral = on the 'periphery'", repetition: sr),
            Flashcard(id: "fc-ct04", front: "Simple Diffusion", back: "Passive movement of small, nonpolar molecules (O₂, CO₂) directly through the lipid bilayer, down the concentration gradient. No ATP needed.", hint: "Small & nonpolar = slip right through", repetition: sr),
            Flashcard(id: "fc-ct05", front: "Osmosis", back: "The diffusion of WATER across a selectively permeable membrane from low solute concentration to high solute concentration.", hint: "Water follows the solute", repetition: sr),
            Flashcard(id: "fc-ct06", front: "Hypertonic vs Hypotonic vs Isotonic", back: "Hypertonic: more solute outside → cell shrinks (crenation). Hypotonic: less solute outside → cell swells/lyses. Isotonic: equal solute → no net change.", hint: "Hyper = shrivels; Hypo = hippo (swells); Iso = same", repetition: sr),
            Flashcard(id: "fc-ct07", front: "Facilitated Diffusion", back: "Passive transport using channel or carrier proteins to move polar/large molecules (glucose, ions) down their concentration gradient. No ATP required.", hint: "Needs help (a protein), but still passive", repetition: sr),
            Flashcard(id: "fc-ct08", front: "Active Transport", back: "Movement of substances AGAINST the concentration gradient (low → high). Requires ATP. Example: Na⁺/K⁺ pump.", hint: "Against the gradient = needs energy", repetition: sr),
            Flashcard(id: "fc-ct09", front: "Sodium-Potassium Pump (Na⁺/K⁺ ATPase)", back: "Primary active transport pump: moves 3 Na⁺ OUT and 2 K⁺ IN per ATP. Maintains the electrochemical gradient for nerve impulses and muscle contraction.", hint: "3 out, 2 in — that's the ratio", repetition: sr),
            Flashcard(id: "fc-ct10", front: "Endocytosis", back: "Bringing material INTO the cell via vesicle formation. Types: phagocytosis ('cell eating'), pinocytosis ('cell drinking'), receptor-mediated endocytosis.", hint: "Endo = into", repetition: sr),
            Flashcard(id: "fc-ct11", front: "Exocytosis", back: "Releasing material OUT of the cell when a vesicle fuses with the plasma membrane. Used for secretion of hormones, neurotransmitters, and waste.", hint: "Exo = out", repetition: sr),
            Flashcard(id: "fc-ct12", front: "Concentration Gradient", back: "The difference in concentration of a substance between two regions. Substances naturally move DOWN the gradient (high → low) unless energy is applied.", hint: "Like a hill — things roll downhill passively", repetition: sr)
        ]
    )

    // =========================================================================
    // MARK: - FLASHCARD DECK: Cell Organelles
    // =========================================================================

    static let deckCellOrganelles = FlashcardDeck(
        id: "deck-cell-organelles",
        title: "Cell Organelles",
        weekNumber: 3,
        category: "Cells",
        cards: [
            Flashcard(id: "fc-co01", front: "Nucleus", back: "The control center of the cell; houses DNA (as chromatin or chromosomes) and contains the nucleolus (ribosomal RNA assembly). Surrounded by the nuclear envelope with pores.", hint: "The 'brain' of the cell", repetition: sr),
            Flashcard(id: "fc-co02", front: "Ribosome", back: "Site of protein synthesis (translation). Made of rRNA and proteins. Free ribosomes make intracellular proteins; bound ribosomes (on rough ER) make proteins for export.", hint: "Protein factory", repetition: sr),
            Flashcard(id: "fc-co03", front: "Rough Endoplasmic Reticulum (Rough ER)", back: "ER studded with ribosomes. Synthesizes, folds, and transports proteins destined for secretion, the membrane, or lysosomes.", hint: "Rough = ribosomes = proteins", repetition: sr),
            Flashcard(id: "fc-co04", front: "Smooth Endoplasmic Reticulum (Smooth ER)", back: "ER without ribosomes. Functions: lipid synthesis, steroid hormone production, detoxification (especially in liver cells), calcium ion storage.", hint: "Smooth = no ribosomes = lipids", repetition: sr),
            Flashcard(id: "fc-co05", front: "Golgi Apparatus", back: "Stack of flattened membrane sacs. Receives proteins from ER, modifies them (glycosylation, phosphorylation), sorts and packages them into vesicles.", hint: "The 'post office' — packages and ships", repetition: sr),
            Flashcard(id: "fc-co06", front: "Lysosome", back: "Membrane-bound sac containing acid hydrolases (digestive enzymes) at pH ~5. Breaks down worn-out organelles, pathogens, and ingested material.", hint: "The cell's 'stomach' — digests waste", repetition: sr),
            Flashcard(id: "fc-co07", front: "Mitochondrion", back: "Double-membrane organelle that produces most ATP via aerobic respiration. Inner membrane folds (cristae) increase surface area. Has its own DNA.", hint: "The 'powerhouse' of the cell", repetition: sr),
            Flashcard(id: "fc-co08", front: "Peroxisome", back: "Membrane-bound organelle that detoxifies harmful substances (hydrogen peroxide, alcohol) using oxidative enzymes. Converts H₂O₂ to water.", hint: "Peroxide + -some = peroxisome", repetition: sr),
            Flashcard(id: "fc-co09", front: "Centrioles", back: "Paired barrel-shaped structures near the nucleus. Organize the mitotic spindle (spindle fibers) during cell division.", hint: "Center of the spindle apparatus", repetition: sr),
            Flashcard(id: "fc-co10", front: "Cytoskeleton", back: "Internal framework of microfilaments (actin), intermediate filaments, and microtubules. Provides structural support, enables cell movement, organizes organelles.", hint: "The cell's 'skeleton'", repetition: sr),
            Flashcard(id: "fc-co11", front: "Transcription vs Translation", back: "Transcription: DNA → mRNA in the nucleus (RNA polymerase). Translation: mRNA → protein at ribosomes in the cytoplasm (tRNA delivers amino acids).", hint: "Transcription = rewrite; Translation = new language (protein)", repetition: sr),
            Flashcard(id: "fc-co12", front: "Mitosis Phases (PMAT)", back: "Prophase: chromosomes condense, spindle forms. Metaphase: chromosomes align at equator. Anaphase: sister chromatids separate. Telophase: nuclear envelopes reform, cytokinesis divides cell.", hint: "PMAT — Please Make Another Taco", repetition: sr)
        ]
    )

    // =========================================================================
    // MARK: - FLASHCARD DECK: Tissue Types
    // =========================================================================

    static let deckTissueTypes = FlashcardDeck(
        id: "deck-tissue-types",
        title: "Tissue Types",
        weekNumber: 4,
        category: "Tissues",
        cards: [
            Flashcard(id: "fc-tt01", front: "Four Primary Tissue Types", back: "1) Epithelial — covers/lines surfaces. 2) Connective — supports/binds. 3) Muscle — contracts. 4) Nervous — conducts impulses.", hint: nil, repetition: sr),
            Flashcard(id: "fc-tt02", front: "Epithelial Tissue Characteristics", back: "Cellularity (tightly packed cells), polarity (apical & basal surfaces), avascular (no blood vessels), basement membrane attachment, high regeneration rate.", hint: "CHABR — Cellular, High regen, Avascular, Basement membrane, Regenerates", repetition: sr),
            Flashcard(id: "fc-tt03", front: "Simple vs Stratified Epithelium", back: "Simple = one cell layer (absorption, filtration, secretion). Stratified = multiple layers (protection against abrasion).", hint: "Simple = single; Stratified = stacked", repetition: sr),
            Flashcard(id: "fc-tt04", front: "Squamous vs Cuboidal vs Columnar", back: "Squamous = flat, scale-like. Cuboidal = cube-shaped. Columnar = tall, column-shaped. Named by the shape of cells at the apical surface.", hint: nil, repetition: sr),
            Flashcard(id: "fc-tt05", front: "Simple Squamous Epithelium", back: "Single layer of flat cells. Allows rapid diffusion and filtration. Found in alveoli, blood vessel lining (endothelium), serous membranes (mesothelium).", hint: "Thin & flat = gas exchange surfaces", repetition: sr),
            Flashcard(id: "fc-tt06", front: "Stratified Squamous Epithelium", back: "Multiple layers, flat surface cells. Protection against abrasion. Keratinized = skin. Non-keratinized = mouth, esophagus, vagina.", hint: "Tough surfaces that get rubbed", repetition: sr),
            Flashcard(id: "fc-tt07", front: "Pseudostratified Ciliated Columnar Epithelium", back: "Appears layered but all cells touch the basement membrane. Has cilia and goblet cells. Lines the respiratory tract. Cilia sweep mucus upward.", hint: "Pseudo = false; looks layered but isn't", repetition: sr),
            Flashcard(id: "fc-tt08", front: "Goblet Cells", back: "Modified columnar epithelial cells that secrete mucus. Found in the intestinal lining and respiratory tract. Named for their goblet (wine glass) shape.", hint: nil, repetition: sr),
            Flashcard(id: "fc-tt09", front: "Connective Tissue Components", back: "Cells (fibroblasts, macrophages, mast cells, etc.) + Extracellular Matrix (ground substance + fibers: collagen, elastic, reticular).", hint: "CT = cells + matrix (ground substance + fibers)", repetition: sr),
            Flashcard(id: "fc-tt10", front: "Areolar Connective Tissue", back: "Most widely distributed CT. Loose, gel-like tissue with all three fiber types. Universal packing material beneath epithelia and around organs.", hint: "Are-ALL-ar — it's everywhere", repetition: sr),
            Flashcard(id: "fc-tt11", front: "Dense Regular vs Dense Irregular CT", back: "Dense regular: parallel collagen fibers → tendons & ligaments. Dense irregular: multidirectional collagen → dermis of skin, organ capsules.", hint: "Regular = one direction (like a tendon pulls); Irregular = many directions", repetition: sr),
            Flashcard(id: "fc-tt12", front: "Basement Membrane", back: "Thin extracellular sheet between epithelium and underlying connective tissue. Anchors epithelium, acts as a filter, and guides cell migration during repair.", hint: "The 'foundation' of epithelial tissue", repetition: sr)
        ]
    )
}
