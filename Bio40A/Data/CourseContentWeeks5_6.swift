import Foundation

// MARK: - Course Content for Bio 40A, Weeks 5-6
// Tissues Part 2, Integumentary Tissue, Integumentary System

extension CourseContent {

    // MARK: - Default SR shorthand
    private static let w56SR = Flashcard.SpacedRepetitionData()

    // MARK: - Lessons Weeks 5-6
    static let lessonsWeeks5_6: [Lesson] = [lesson8, lesson9, lesson10, lesson11]

    // MARK: - Quizzes Weeks 5-6
    static let quizzesWeeks5_6: [Quiz] = [quiz3, quiz4]

    // MARK: - Flashcard Decks Weeks 5-6
    static let flashcardDecksWeeks5_6: [FlashcardDeck] = [
        deckMuscleNervousTissue,
        deckSkinLayers,
        deckIntegumentaryStructures
    ]

    // =========================================================================
    // MARK: - LESSON 8: Tissues Part 2 (Week 5, Mon May 4, Ch 4.4-4.6)
    // =========================================================================

    static let lesson8 = Lesson(
        id: "w5-lesson-8",
        weekNumber: 5,
        classNumber: 8,
        title: "Tissues Part 2",
        subtitle: "Muscle tissue, nervous tissue, membranes, and tissue repair",
        textbookChapter: "Chapter 4",
        textbookSections: "4.4 - 4.6",
        sections: [
            // Section 1 — Muscle Tissue
            LessonSection(
                id: "w5-l8-s1",
                heading: "Muscle Tissue",
                content: """
                Muscle tissue is specialized for contraction and is responsible for movement of the body \
                and its parts. All muscle cells (also called muscle fibers) contain the proteins actin and \
                myosin arranged into myofilaments that slide past one another to produce contraction. \
                There are three types of muscle tissue:

                Skeletal muscle is attached to bones and is responsible for voluntary movements. Its cells \
                are long, cylindrical, multinucleated fibers with prominent striations (alternating light \
                and dark bands reflecting the orderly arrangement of sarcomeres). A sarcomere is the basic \
                contractile unit, extending from one Z-disc to the next.

                Cardiac muscle is found only in the heart wall. Its cells are short, branched, and \
                typically uninucleate. Cardiac fibers are striated like skeletal muscle but are connected \
                end-to-end by intercalated discs — specialized junctions that contain desmosomes for \
                mechanical coupling and gap junctions for electrical coupling. This allows the heart to \
                contract as a coordinated unit (functional syncytium). Cardiac muscle is involuntary and \
                autorhythmic.

                Smooth muscle is found in the walls of hollow organs (stomach, intestines, blood vessels, \
                urinary bladder) and other visceral structures. Its cells are spindle-shaped (fusiform), \
                uninucleate, and lack striations because actin and myosin are not arranged in orderly \
                sarcomeres. Smooth muscle contracts more slowly but can sustain contraction for long \
                periods. It is involuntary and controlled primarily by the autonomic nervous system.
                """,
                keyTerms: [
                    KeyTerm(id: "w5-l8s1-k1", term: "Sarcomere", definition: "The basic contractile unit of skeletal and cardiac muscle, extending from one Z-disc to the next; composed of overlapping actin (thin) and myosin (thick) filaments."),
                    KeyTerm(id: "w5-l8s1-k2", term: "Intercalated Disc", definition: "Specialized junction between cardiac muscle cells containing desmosomes and gap junctions; allows the heart to contract as a coordinated unit."),
                    KeyTerm(id: "w5-l8s1-k3", term: "Skeletal Muscle", definition: "Voluntary, striated muscle attached to bones; its long, multinucleated fibers produce body movement."),
                    KeyTerm(id: "w5-l8s1-k4", term: "Cardiac Muscle", definition: "Involuntary, striated muscle of the heart wall; branched, uninucleate cells connected by intercalated discs."),
                    KeyTerm(id: "w5-l8s1-k5", term: "Smooth Muscle", definition: "Involuntary, non-striated muscle in walls of hollow organs; spindle-shaped, uninucleate cells that produce slow, sustained contractions.")
                ],
                testablesFacts: [
                    "Skeletal muscle is voluntary, striated, and multinucleated.",
                    "Cardiac muscle is involuntary, striated, branched, and connected by intercalated discs.",
                    "Smooth muscle is involuntary, non-striated, spindle-shaped, and found in hollow organ walls.",
                    "A sarcomere extends from Z-disc to Z-disc and is the smallest contractile unit.",
                    "Intercalated discs contain desmosomes (mechanical) and gap junctions (electrical)."
                ]
            ),
            // Section 2 — Nervous Tissue
            LessonSection(
                id: "w5-l8-s2",
                heading: "Nervous Tissue",
                content: """
                Nervous tissue is the primary tissue of the nervous system. It is responsible for detecting \
                stimuli, generating and propagating electrical impulses, and integrating information. Nervous \
                tissue contains two principal cell types: neurons and neuroglia (glial cells).

                Neurons are the functional cells of the nervous system that generate and transmit electrical \
                signals called nerve impulses (action potentials). A typical neuron has three parts: \
                (1) the cell body (soma), which contains the nucleus and most organelles; \
                (2) dendrites, which are short, branching extensions that receive incoming signals and \
                conduct them toward the cell body; and \
                (3) the axon, a single long extension that conducts impulses away from the cell body toward \
                other neurons, muscles, or glands. The junction between one neuron and the next cell is \
                called a synapse, where neurotransmitter chemicals relay the signal across the synaptic cleft.

                Many axons are wrapped in a myelin sheath, a lipid-rich insulating layer formed by \
                oligodendrocytes in the CNS or Schwann cells in the PNS. Myelination dramatically increases \
                the speed of nerve impulse conduction via saltatory conduction, where the impulse jumps \
                between gaps in the myelin called nodes of Ranvier.

                Neuroglia (glial cells) are supporting cells that do not generate nerve impulses but are \
                essential for maintaining the environment around neurons, providing structural support, \
                insulation, and nourishment. Neuroglia outnumber neurons roughly 10:1 in the nervous system.
                """,
                keyTerms: [
                    KeyTerm(id: "w5-l8s2-k1", term: "Neuron", definition: "A nerve cell capable of generating and transmitting electrical impulses; composed of a cell body, dendrites, and an axon."),
                    KeyTerm(id: "w5-l8s2-k2", term: "Dendrite", definition: "Short, branching neuronal processes that receive incoming signals and conduct them toward the cell body."),
                    KeyTerm(id: "w5-l8s2-k3", term: "Axon", definition: "A single, long neuronal process that conducts nerve impulses away from the cell body to other cells."),
                    KeyTerm(id: "w5-l8s2-k4", term: "Synapse", definition: "The junction between a neuron and another cell where neurotransmitters relay the electrical signal across the synaptic cleft."),
                    KeyTerm(id: "w5-l8s2-k5", term: "Myelin Sheath", definition: "A lipid-rich insulating layer around axons formed by Schwann cells (PNS) or oligodendrocytes (CNS); increases conduction speed."),
                    KeyTerm(id: "w5-l8s2-k6", term: "Neuroglia", definition: "Supporting cells of the nervous system that protect, nourish, and insulate neurons; also called glial cells.")
                ],
                testablesFacts: [
                    "Dendrites carry impulses toward the cell body; axons carry impulses away.",
                    "A synapse is the junction between neurons where neurotransmitters are released.",
                    "The myelin sheath increases conduction speed via saltatory conduction.",
                    "Schwann cells myelinate in the PNS; oligodendrocytes myelinate in the CNS.",
                    "Neuroglia support and protect neurons but do not transmit nerve impulses."
                ]
            ),
            // Section 3 — Tissue Membranes
            LessonSection(
                id: "w5-l8-s3",
                heading: "Tissue Membranes",
                content: """
                Tissue membranes are thin sheets of tissue that cover body surfaces, line body cavities, \
                and surround organs. There are four principal types:

                Mucous membranes (mucosae) line body cavities that open to the exterior, such as the \
                digestive, respiratory, urinary, and reproductive tracts. They consist of an epithelial \
                layer over a layer of areolar connective tissue called the lamina propria. Mucous membranes \
                are kept moist by mucus secreted by goblet cells or multicellular glands.

                Serous membranes (serosae) line body cavities that do not open to the exterior and cover \
                the organs within those cavities. They consist of a thin layer of simple squamous epithelium \
                (mesothelium) over a thin layer of areolar connective tissue. Serous membranes secrete a \
                thin, watery serous fluid that reduces friction. The three serous membranes are: the \
                pleura (lungs), the pericardium (heart), and the peritoneum (abdominal organs). Each has \
                a parietal layer (lines the cavity wall) and a visceral layer (covers the organ).

                The cutaneous membrane is the skin — the largest organ of the body. Unlike serous and \
                mucous membranes, it is a dry membrane composed of keratinized stratified squamous \
                epithelium (epidermis) over a thick layer of connective tissue (dermis).

                Synovial membranes line the cavities of freely movable (synovial) joints. Unlike the \
                other membranes, they are composed entirely of connective tissue with no epithelial \
                component. They secrete synovial fluid that lubricates joint surfaces and nourishes \
                articular cartilage.
                """,
                keyTerms: [
                    KeyTerm(id: "w5-l8s3-k1", term: "Mucous Membrane", definition: "Epithelial membrane lining body cavities open to the exterior; kept moist by mucus secretions."),
                    KeyTerm(id: "w5-l8s3-k2", term: "Serous Membrane", definition: "Epithelial membrane lining closed body cavities; secretes serous fluid to reduce friction. Includes pleura, pericardium, and peritoneum."),
                    KeyTerm(id: "w5-l8s3-k3", term: "Cutaneous Membrane", definition: "The skin; a dry membrane consisting of keratinized stratified squamous epithelium (epidermis) over connective tissue (dermis)."),
                    KeyTerm(id: "w5-l8s3-k4", term: "Synovial Membrane", definition: "A connective-tissue-only membrane lining synovial joint cavities; secretes synovial fluid for lubrication.")
                ],
                testablesFacts: [
                    "Mucous membranes line cavities open to the exterior (GI, respiratory, urinary, reproductive tracts).",
                    "Serous membranes line closed cavities: pleura (lungs), pericardium (heart), peritoneum (abdomen).",
                    "Each serous membrane has a parietal layer (cavity wall) and visceral layer (organ surface).",
                    "The cutaneous membrane (skin) is the only dry membrane.",
                    "Synovial membranes contain no epithelium — they are purely connective tissue."
                ]
            ),
            // Section 4 — Tissue Repair and Aging
            LessonSection(
                id: "w5-l8-s4",
                heading: "Tissue Repair and Aging",
                content: """
                When tissues are injured, the body initiates a repair process that involves two components: \
                regeneration (replacement of destroyed tissue with the same type of cells) and fibrosis \
                (replacement with scar tissue — fibrous connective tissue). The extent of each depends on \
                the tissue type and severity of injury.

                Tissues with high regenerative capacity include epithelial tissues, bone, and areolar \
                connective tissue, because they have actively dividing stem cells. Skeletal muscle has \
                moderate regenerative ability. Cardiac muscle and nervous tissue have very limited \
                regenerative capacity; damage is largely repaired by fibrosis (scar tissue).

                The tissue repair process occurs in overlapping stages: \
                (1) Inflammation — injured cells and mast cells release histamine and other chemicals \
                that cause vasodilation and increased capillary permeability. Blood plasma, clotting \
                proteins, and white blood cells flood the area. Cardinal signs include redness, heat, \
                swelling, and pain. \
                (2) Organization and proliferation — the blood clot is replaced by granulation tissue \
                (a delicate pink tissue containing capillary buds and proliferating fibroblasts). Surface \
                epithelial cells multiply and migrate beneath the scab. \
                (3) Maturation and remodeling — the fibrous tissue matures, epithelium thickens, and \
                blood vessels return to normal. The result may be fully regenerated tissue or a fibrous scar.

                With aging, tissues become thinner, more prone to injury, and slower to heal. Epithelial \
                membranes thin, connective tissue loses elasticity, bone mass decreases, and muscle tissue \
                atrophies (sarcopenia).
                """,
                keyTerms: [
                    KeyTerm(id: "w5-l8s4-k1", term: "Regeneration", definition: "Replacement of destroyed tissue with the same type of functional cells."),
                    KeyTerm(id: "w5-l8s4-k2", term: "Fibrosis", definition: "Repair by replacement with dense fibrous (scar) tissue; occurs when tissue cannot regenerate."),
                    KeyTerm(id: "w5-l8s4-k3", term: "Granulation Tissue", definition: "Delicate pink tissue rich in capillary buds and fibroblasts that forms during the proliferative phase of wound repair.")
                ],
                testablesFacts: [
                    "Epithelial tissue regenerates readily; cardiac muscle and nervous tissue do not.",
                    "The four cardinal signs of inflammation are redness, heat, swelling, and pain.",
                    "Inflammation involves vasodilation and increased capillary permeability caused by histamine.",
                    "Granulation tissue forms during the organization/proliferative phase of repair.",
                    "Fibrosis produces scar tissue when the original tissue type cannot regenerate."
                ]
            )
        ],
        clinicalApplication: ClinicalApplication(
            title: "Tissue Inflammation Response",
            scenario: "A patient arrives at the ER after twisting their ankle. The area is red, swollen, warm, and painful to the touch.",
            connection: "These are the four cardinal signs of the inflammatory response — redness and heat from vasodilation, swelling from increased capillary permeability allowing fluid into tissues, and pain from chemical mediators stimulating nerve endings. As an EMT, recognizing inflammation helps differentiate acute injury from infection and guides decisions about splinting, elevation, and cold application."
        )
    )

    // =========================================================================
    // MARK: - LESSON 9: Integumentary Tissue (Week 5, Wed May 6, Ch 5.1-5.2)
    // =========================================================================

    static let lesson9 = Lesson(
        id: "w5-lesson-9",
        weekNumber: 5,
        classNumber: 9,
        title: "Integumentary Tissue",
        subtitle: "Skin layers, epidermis, dermis, and hypodermis",
        textbookChapter: "Chapter 5",
        textbookSections: "5.1 - 5.2",
        sections: [
            // Section 1 — Overview of Skin Layers
            LessonSection(
                id: "w5-l9-s1",
                heading: "Skin: An Overview",
                content: """
                The skin (integument) is the largest organ of the body, covering approximately 1.5–2 square \
                meters in an average adult and accounting for about 7% of body weight. The integumentary \
                system includes the skin and its accessory structures (hair, nails, and glands).

                The skin is composed of two principal layers: \
                (1) The epidermis — the outermost layer, made of keratinized stratified squamous epithelium. \
                It is avascular (lacks blood vessels) and receives nutrients by diffusion from the dermis. \
                (2) The dermis — the deeper layer, composed of connective tissue containing blood vessels, \
                nerves, glands, and hair follicles.

                Deep to the dermis is the hypodermis (subcutaneous layer or superficial fascia), which is \
                not technically part of the skin but anchors it to underlying structures. The hypodermis is \
                composed primarily of adipose tissue and areolar connective tissue. It functions as a shock \
                absorber, insulator, and energy reservoir.
                """,
                keyTerms: [
                    KeyTerm(id: "w5-l9s1-k1", term: "Epidermis", definition: "The outermost skin layer; avascular keratinized stratified squamous epithelium providing a waterproof, protective barrier."),
                    KeyTerm(id: "w5-l9s1-k2", term: "Dermis", definition: "The deep skin layer of connective tissue containing blood vessels, nerves, glands, and hair follicles."),
                    KeyTerm(id: "w5-l9s1-k3", term: "Hypodermis", definition: "The subcutaneous layer deep to the dermis; composed primarily of adipose tissue; anchors skin, insulates, and stores energy.")
                ],
                testablesFacts: [
                    "The skin is the body's largest organ.",
                    "The epidermis is avascular — it receives nutrients by diffusion from the dermis.",
                    "The hypodermis (subcutaneous layer) is not technically part of the skin.",
                    "The hypodermis is primarily adipose tissue and serves as insulation and energy storage."
                ]
            ),
            // Section 2 — Layers of the Epidermis
            LessonSection(
                id: "w5-l9-s2",
                heading: "Layers of the Epidermis",
                content: """
                The epidermis is composed of four or five distinct layers (strata), depending on body region. \
                From deepest to most superficial:

                1. Stratum basale (stratum germinativum) — the deepest layer, a single row of actively \
                dividing stem cells (keratinocytes) attached to the basement membrane by hemidesmosomes. \
                Melanocytes and Merkel cells are also found here. New cells produced here push older cells \
                toward the surface.

                2. Stratum spinosum (spiny layer) — several layers of keratinocytes connected by desmosomes \
                that appear spiny in histological preparations. Langerhans cells (dendritic/immune cells) are \
                abundant in this layer.

                3. Stratum granulosum (granular layer) — 3-5 layers of flattened keratinocytes containing \
                keratohyalin granules (help form keratin) and lamellar granules (release a waterproofing \
                glycolipid). Cells begin to die as they move beyond nutrient supply.

                4. Stratum lucidum (clear layer) — a thin, translucent layer found only in thick skin \
                (palms and soles). Composed of a few rows of clear, flat, dead keratinocytes.

                5. Stratum corneum (horny layer) — the most superficial and thickest layer, consisting of \
                20-30 rows of flat, dead, fully keratinized cells (corneocytes) that are continuously shed \
                (desquamation). This layer provides the main barrier against water loss, abrasion, and \
                microbial invasion. The complete turnover time from stratum basale to desquamation is \
                approximately 25-45 days.
                """,
                keyTerms: [
                    KeyTerm(id: "w5-l9s2-k1", term: "Stratum Basale", definition: "The deepest epidermal layer; a single row of actively dividing stem cells that produce new keratinocytes. Also called stratum germinativum."),
                    KeyTerm(id: "w5-l9s2-k2", term: "Stratum Spinosum", definition: "The 'spiny layer' of the epidermis with several layers of keratinocytes joined by desmosomes; contains Langerhans cells."),
                    KeyTerm(id: "w5-l9s2-k3", term: "Stratum Granulosum", definition: "The granular layer where keratinocytes contain keratohyalin and lamellar granules; cells begin to die here."),
                    KeyTerm(id: "w5-l9s2-k4", term: "Stratum Lucidum", definition: "A thin, clear layer present only in thick skin (palms and soles); composed of dead, flattened keratinocytes."),
                    KeyTerm(id: "w5-l9s2-k5", term: "Stratum Corneum", definition: "The outermost epidermal layer; 20-30 rows of dead, keratinized cells providing the primary barrier against water loss and pathogens.")
                ],
                testablesFacts: [
                    "From deep to superficial: basale → spinosum → granulosum → lucidum → corneum.",
                    "Mnemonic: 'Before Signing, Get Legal Counsel' (Basale, Spinosum, Granulosum, Lucidum, Corneum).",
                    "Stratum basale is the only layer with actively dividing cells.",
                    "Stratum lucidum is found only in thick skin (palms and soles).",
                    "Stratum corneum is the thickest layer and provides the main protective barrier.",
                    "Epidermal turnover from basale to desquamation takes about 25-45 days."
                ]
            ),
            // Section 3 — Cells of the Epidermis
            LessonSection(
                id: "w5-l9-s3",
                heading: "Cells of the Epidermis",
                content: """
                Four cell types are found in the epidermis:

                Keratinocytes are by far the most abundant (about 90% of epidermal cells). They produce the \
                protein keratin, a tough, fibrous structural protein that gives the epidermis its protective \
                properties. Keratinocytes also produce lamellar granules that release a waterproofing \
                glycolipid. They arise from stem cells in the stratum basale and undergo keratinization as \
                they are pushed toward the surface, ultimately becoming the dead, flattened cells of the \
                stratum corneum.

                Melanocytes (about 8% of epidermal cells) are found in the stratum basale. They produce \
                melanin, a pigment that absorbs UV radiation and protects the DNA of keratinocytes from \
                UV damage. Melanocytes transfer melanin to surrounding keratinocytes via cytoplasmic \
                extensions. All people have roughly the same number of melanocytes; differences in skin \
                color result from the amount and type of melanin produced. The two forms are eumelanin \
                (brown-black) and pheomelanin (red-yellow).

                Langerhans cells (dendritic cells) are immune cells found primarily in the stratum spinosum. \
                They are antigen-presenting cells of the immune system that detect foreign invaders and \
                initiate an immune response.

                Merkel cells are found in the stratum basale. They are associated with sensory nerve endings \
                (Merkel discs) and function as touch receptors, detecting light touch and texture.

                Skin color results from three pigments: melanin (brown/black/yellow), carotene (yellow-orange, \
                found in the stratum corneum and hypodermis), and hemoglobin (red/pink, visible through \
                the epidermis in light-skinned individuals due to blood flow in the dermis).
                """,
                keyTerms: [
                    KeyTerm(id: "w5-l9s3-k1", term: "Keratin", definition: "A tough, fibrous structural protein produced by keratinocytes that gives the epidermis its protective, waterproof properties."),
                    KeyTerm(id: "w5-l9s3-k2", term: "Melanin", definition: "A pigment produced by melanocytes that absorbs UV radiation, protecting underlying cells from DNA damage."),
                    KeyTerm(id: "w5-l9s3-k3", term: "Carotene", definition: "A yellow-orange pigment found in the stratum corneum and hypodermis; contributes to skin color."),
                    KeyTerm(id: "w5-l9s3-k4", term: "Langerhans Cell", definition: "An immune (dendritic) cell in the stratum spinosum that detects foreign invaders and presents antigens to the immune system."),
                    KeyTerm(id: "w5-l9s3-k5", term: "Merkel Cell", definition: "A sensory receptor cell in the stratum basale associated with nerve endings (Merkel discs) for detecting light touch.")
                ],
                testablesFacts: [
                    "Keratinocytes make up about 90% of epidermal cells and produce keratin.",
                    "Melanocytes in the stratum basale produce melanin, which protects DNA from UV damage.",
                    "All people have approximately the same number of melanocytes; skin color differences come from melanin amount and type.",
                    "Langerhans cells are immune (antigen-presenting) cells in the stratum spinosum.",
                    "Merkel cells in the stratum basale are touch receptors.",
                    "Three pigments contribute to skin color: melanin, carotene, and hemoglobin."
                ]
            ),
            // Section 4 — Dermis
            LessonSection(
                id: "w5-l9-s4",
                heading: "The Dermis",
                content: """
                The dermis is the deep layer of the skin, composed of strong, flexible connective tissue. \
                It ranges from 0.2 mm (eyelids) to 4 mm (back) in thickness. The dermis contains blood \
                vessels, lymphatic vessels, nerves, hair follicles, and glands. It is divided into two layers:

                The papillary layer is the superficial 20% of the dermis. It is composed of areolar \
                connective tissue with collagen and elastic fibers. It forms finger-like projections called \
                dermal papillae that extend into the epidermis, increasing the surface area for nutrient \
                exchange and anchoring the epidermis to the dermis. In the hands and feet, dermal papillae \
                are arranged in patterns that create fingerprints (friction ridges). The papillary layer \
                also contains Meissner's corpuscles (touch receptors) and capillary loops.

                The reticular layer is the deeper 80% of the dermis. It is composed of dense irregular \
                connective tissue with thick bundles of interlacing collagen fibers and some elastic fibers. \
                This layer provides strength, extensibility, and elasticity to the skin. It contains \
                Pacinian corpuscles (deep pressure receptors), hair follicles, nerves, oil glands, and \
                sweat glands. The collagen fibers of the reticular layer run in preferred directions creating \
                tension lines called Langer's lines (cleavage lines), which are important for surgical \
                incisions — cuts parallel to these lines heal better with less scarring.
                """,
                keyTerms: [
                    KeyTerm(id: "w5-l9s4-k1", term: "Dermal Papillae", definition: "Finger-like projections of the papillary dermis that extend into the epidermis; increase surface area and create fingerprint patterns."),
                    KeyTerm(id: "w5-l9s4-k2", term: "Papillary Layer", definition: "The superficial dermal layer of areolar connective tissue forming dermal papillae; contains Meissner's corpuscles and capillaries."),
                    KeyTerm(id: "w5-l9s4-k3", term: "Reticular Layer", definition: "The deep dermal layer of dense irregular connective tissue providing strength and elasticity; contains most skin appendages.")
                ],
                testablesFacts: [
                    "The papillary layer is superficial (20%) areolar connective tissue with dermal papillae.",
                    "The reticular layer is deep (80%) dense irregular connective tissue.",
                    "Dermal papillae create fingerprints and improve epidermis-dermis adhesion.",
                    "Meissner's corpuscles (touch) are in the papillary layer; Pacinian corpuscles (pressure) are in the reticular layer."
                ]
            )
        ],
        clinicalApplication: ClinicalApplication(
            title: "Burns Classification",
            scenario: "An EMT responds to a kitchen fire where a patient has burns on both forearms. The skin is red, blistered, and extremely painful.",
            connection: "Burns are classified by depth: first-degree (superficial) — epidermis only, redness, pain, no blisters (e.g., mild sunburn). Second-degree (partial-thickness) — epidermis and part of dermis, blisters, severe pain, red and moist. Third-degree (full-thickness) — epidermis and entire dermis destroyed, may extend to hypodermis; skin appears white, charred, or leathery; painless in burned area due to nerve destruction. The described burns are second-degree. For EMTs, burn depth guides treatment urgency and fluid resuscitation decisions."
        )
    )

    // =========================================================================
    // MARK: - LESSON 10: Integumentary System Part 1 (Week 6, Mon May 11, Ch 5.3-5.4)
    // =========================================================================

    static let lesson10 = Lesson(
        id: "w6-lesson-10",
        weekNumber: 6,
        classNumber: 10,
        title: "Integumentary System Part 1",
        subtitle: "Accessory structures: hair, nails, and glands",
        textbookChapter: "Chapter 5",
        textbookSections: "5.3 - 5.4",
        sections: [
            // Section 1 — Hair
            LessonSection(
                id: "w6-l10-s1",
                heading: "Hair",
                content: """
                Hair (pilus) is a filamentous structure produced by hair follicles in the dermis. Hair \
                is present over nearly the entire body surface except the palms, soles, lips, nipples, \
                and parts of the external genitalia. Hair functions include protection (scalp hair shields \
                from UV and minor trauma), sensation (hair root plexuses detect light touch), temperature \
                regulation (minimal in humans), and filtering debris (nose hairs, eyelashes).

                Hair anatomy includes: \
                The hair shaft — the portion projecting above the skin surface. It consists of three layers: \
                the medulla (central core, may be absent in fine hair), the cortex (the bulk of the hair, \
                containing melanin that determines hair color), and the cuticle (the outermost layer of \
                overlapping keratinized cells). \
                The hair root — the portion embedded in the skin within the hair follicle. \
                The hair follicle — a sheath of epidermal and dermal tissue surrounding the root. At the \
                base of the follicle is the hair bulb, which contains the hair matrix (actively dividing \
                cells that produce the hair) and a hair papilla (a knob of dermal tissue with capillaries \
                that nourish the growing hair).

                The arrector pili muscle is a small bundle of smooth muscle attached to each hair follicle. \
                When it contracts (sympathetic stimulation from cold or fright), it pulls the hair shaft \
                upright, producing 'goosebumps' and compressing sebaceous glands to release sebum.

                Hair growth occurs in cycles: anagen (active growth, 2-6 years for scalp hair), catagen \
                (regression, 2-3 weeks), and telogen (resting, 1-5 months, after which the hair falls out). \
                About 90% of scalp hairs are in anagen at any given time.
                """,
                keyTerms: [
                    KeyTerm(id: "w6-l10s1-k1", term: "Hair Follicle", definition: "A sheath of epidermal and dermal tissue surrounding the hair root; contains the hair bulb with the hair matrix and papilla."),
                    KeyTerm(id: "w6-l10s1-k2", term: "Arrector Pili", definition: "A smooth muscle attached to each hair follicle; contracts to produce goosebumps and compresses sebaceous glands to release sebum."),
                    KeyTerm(id: "w6-l10s1-k3", term: "Hair Matrix", definition: "Actively dividing cells at the base of the hair bulb that produce the hair shaft by keratinization.")
                ],
                testablesFacts: [
                    "Hair is absent from palms, soles, lips, and nipples.",
                    "The hair shaft has three layers: medulla (core), cortex (bulk, has melanin), cuticle (outer).",
                    "The hair matrix in the hair bulb contains the dividing cells that produce hair.",
                    "The arrector pili muscle produces goosebumps and squeezes sebaceous glands.",
                    "Hair growth phases: anagen (growth), catagen (regression), telogen (rest)."
                ]
            ),
            // Section 2 — Nails
            LessonSection(
                id: "w6-l10-s2",
                heading: "Nails",
                content: """
                Nails are scale-like modifications of the epidermis that form hard, protective coverings on \
                the dorsal surfaces of the distal phalanges of fingers and toes. Nails protect the fingertips, \
                assist in grasping small objects, and allow scratching.

                Nail anatomy includes: \
                The nail body (nail plate) — the visible, attached portion of the nail. It is composed of \
                hard, tightly packed, keratinized cells and appears pink because of the blood supply in the \
                underlying nail bed. \
                The free edge — the portion that extends past the fingertip. \
                The nail root — the proximal portion hidden under the skin fold (proximal nail fold). \
                The nail bed — the layer of epithelium beneath the nail body. \
                The nail matrix — the growth zone beneath the proximal nail fold where cell division \
                produces new nail cells. Nails grow approximately 1 mm per week for fingernails (slower for \
                toenails). \
                The lunula — the whitish, crescent-shaped area at the proximal base of the nail, visible \
                through the nail body. It appears white because the underlying vascular tissue is obscured \
                by the thicker nail matrix region. \
                The cuticle (eponychium) — a fold of skin at the proximal border of the nail. \
                The hyponychium — the thickened epidermis beneath the free edge.
                """,
                keyTerms: [
                    KeyTerm(id: "w6-l10s2-k1", term: "Nail Matrix", definition: "The growth zone of the nail located beneath the proximal nail fold; actively dividing cells here produce the nail plate."),
                    KeyTerm(id: "w6-l10s2-k2", term: "Lunula", definition: "The whitish, crescent-shaped area at the base of the nail; white because the thicker nail matrix region obscures underlying blood vessels."),
                    KeyTerm(id: "w6-l10s2-k3", term: "Nail Body", definition: "The visible portion of the nail (nail plate); composed of hard, keratinized cells; appears pink from the underlying nail bed vasculature.")
                ],
                testablesFacts: [
                    "Nails are keratinized epidermal modifications that protect distal phalanges.",
                    "The nail matrix is the growth zone where new nail cells are produced.",
                    "The lunula is white because the thick matrix region obscures blood vessels.",
                    "Fingernails grow approximately 1 mm per week; toenails grow more slowly.",
                    "The cuticle (eponychium) is the skin fold at the proximal nail border."
                ]
            ),
            // Section 3 — Glands
            LessonSection(
                id: "w6-l10-s3",
                heading: "Skin Glands",
                content: """
                The skin contains several types of exocrine glands:

                Sebaceous (oil) glands are found nearly everywhere on the body except the palms and soles. \
                Most are associated with hair follicles and secrete sebum (an oily mixture of lipids and \
                fragmented cells) via holocrine secretion into the hair follicle. Sebum softens and \
                lubricates hair and skin, prevents water loss, and has mild bactericidal properties. \
                Overactive sebaceous glands can lead to acne; blocked glands produce whiteheads (closed \
                comedones) and blackheads (open comedones, dark from oxidized melanin and lipids).

                Sudoriferous (sweat) glands are of two types: \
                Eccrine (merocrine) sweat glands are the most numerous and widely distributed glands in \
                the skin, found over nearly the entire body but especially concentrated on the palms, soles, \
                and forehead. They are simple coiled tubular glands that secrete a watery, hypotonic sweat \
                onto the skin surface via merocrine secretion. Their primary function is thermoregulation \
                through evaporative cooling. Eccrine sweat is mostly water with small amounts of NaCl, \
                urea, uric acid, and ammonia.

                Apocrine sweat glands are found primarily in the axillary (armpit) and anogenital regions. \
                They are larger than eccrine glands and empty into hair follicles rather than directly onto \
                the skin surface. They produce a thicker, milky secretion containing lipids and proteins. \
                Apocrine sweat is odorless when secreted but becomes odorous when bacteria on the skin \
                metabolize its organic components. These glands become active at puberty. Despite the name, \
                they actually secrete via merocrine (exocytosis) rather than true apocrine secretion.

                Ceruminous glands are modified apocrine glands found in the lining of the external ear \
                canal. They secrete cerumen (earwax), which traps foreign particles and repels insects.
                """,
                keyTerms: [
                    KeyTerm(id: "w6-l10s3-k1", term: "Sebaceous Gland", definition: "An oil gland associated with hair follicles that secretes sebum via holocrine secretion to lubricate skin and hair."),
                    KeyTerm(id: "w6-l10s3-k2", term: "Eccrine Gland", definition: "The most numerous sweat gland; a simple coiled tubular gland that produces watery sweat for thermoregulation via evaporative cooling."),
                    KeyTerm(id: "w6-l10s3-k3", term: "Apocrine Gland", definition: "A sweat gland in axillary and anogenital regions that produces thicker secretions into hair follicles; becomes active at puberty."),
                    KeyTerm(id: "w6-l10s3-k4", term: "Ceruminous Gland", definition: "Modified apocrine gland in the external ear canal that secretes cerumen (earwax) to trap debris.")
                ],
                testablesFacts: [
                    "Sebaceous glands secrete sebum via holocrine secretion; absent on palms and soles.",
                    "Eccrine sweat glands are most abundant and produce watery sweat for thermoregulation.",
                    "Apocrine sweat glands are in axillary and anogenital areas and empty into hair follicles.",
                    "Apocrine sweat is odorless until bacteria metabolize its organic components.",
                    "Ceruminous glands produce cerumen (earwax) in the external ear canal."
                ]
            )
        ],
        clinicalApplication: ClinicalApplication(
            title: "Cyanosis Assessment via Nail Beds",
            scenario: "An EMT evaluates a patient with difficulty breathing. The patient's fingernail beds appear bluish.",
            connection: "Cyanosis — a bluish discoloration of the skin and nail beds — indicates inadequate oxygenation of hemoglobin. Because the nail body is translucent and overlies a highly vascular nail bed, it is one of the first and most reliable sites to assess peripheral cyanosis. Blue nail beds suggest the patient may have hypoxia (low blood oxygen) and needs supplemental oxygen. In dark-skinned patients, check the nail beds, lips, and mucous membranes where pigmentation is less dense."
        )
    )

    // =========================================================================
    // MARK: - LESSON 11: Integumentary System Part 2 (Week 6, Wed May 13, Ch 5.4-5.5)
    // =========================================================================

    static let lesson11 = Lesson(
        id: "w6-lesson-11",
        weekNumber: 6,
        classNumber: 11,
        title: "Integumentary System Part 2",
        subtitle: "Skin functions, wound healing, skin cancer, and the Rule of Nines",
        textbookChapter: "Chapter 5",
        textbookSections: "5.4 - 5.5",
        sections: [
            // Section 1 — Functions of the Integumentary System
            LessonSection(
                id: "w6-l11-s1",
                heading: "Functions of the Integumentary System",
                content: """
                The integumentary system performs several vital functions:

                Protection — the skin provides a physical barrier against abrasion, pathogens, chemical \
                damage, and UV radiation. Keratin resists abrasion, melanin absorbs UV, the acid mantle \
                (low pH of skin secretions) inhibits bacterial growth, and Langerhans cells provide immune \
                surveillance. The intact epidermis prevents water loss and blocks entry of most pathogens.

                Thermoregulation — the skin is the body's primary organ of heat exchange. When body \
                temperature rises, dermal blood vessels dilate (vasodilation) to bring warm blood to the \
                skin surface for heat radiation, and eccrine sweat glands produce sweat for evaporative \
                cooling. When body temperature drops, dermal blood vessels constrict (vasoconstriction) to \
                reduce heat loss, and the arrector pili muscles may contract. These responses are controlled \
                by the hypothalamus.

                Sensation — the skin is richly supplied with sensory receptors (cutaneous receptors) that \
                detect touch (Meissner's and Merkel), pressure (Pacinian), temperature (thermoreceptors), \
                and pain (nociceptors). This makes the skin the body's largest sensory organ.

                Vitamin D synthesis — when UV-B radiation strikes the skin, a precursor molecule in \
                keratinocytes (7-dehydrocholesterol) is converted to cholecalciferol (vitamin D₃). This is \
                further modified by the liver and kidneys to produce calcitriol, the active form of vitamin D, \
                which is essential for calcium absorption and bone health.

                Excretion — sweat contains small amounts of nitrogenous wastes (urea, uric acid, ammonia) \
                and salts, providing a minor excretory function.

                Metabolic functions — the skin serves as a blood reservoir (the dermis holds up to 5% of \
                total blood volume) and synthesizes several proteins important to immunity.
                """,
                keyTerms: [
                    KeyTerm(id: "w6-l11s1-k1", term: "Thermoregulation", definition: "The process by which the skin regulates body temperature through vasodilation/vasoconstriction and sweating, controlled by the hypothalamus."),
                    KeyTerm(id: "w6-l11s1-k2", term: "Vitamin D Synthesis", definition: "UV-B converts 7-dehydrocholesterol in keratinocytes to cholecalciferol (vitamin D₃), which the liver and kidneys convert to active calcitriol."),
                    KeyTerm(id: "w6-l11s1-k3", term: "Acid Mantle", definition: "The slightly acidic film on the skin surface from sweat and sebum secretions that inhibits bacterial growth.")
                ],
                testablesFacts: [
                    "Five major functions: protection, thermoregulation, sensation, vitamin D synthesis, excretion.",
                    "Vasodilation releases heat; vasoconstriction conserves heat — both controlled by the hypothalamus.",
                    "UV-B converts 7-dehydrocholesterol to vitamin D₃ (cholecalciferol) in keratinocytes.",
                    "Active vitamin D (calcitriol) requires further processing by the liver and kidneys.",
                    "The dermis holds up to 5% of total blood volume, acting as a blood reservoir."
                ]
            ),
            // Section 2 — Wound Healing
            LessonSection(
                id: "w6-l11-s2",
                heading: "Wound Healing",
                content: """
                The skin's wound healing process occurs in three overlapping phases:

                1. Inflammatory phase (0-3 days) — begins immediately after injury. Damaged cells and mast \
                cells release histamine and other inflammatory mediators that cause vasodilation and increased \
                capillary permeability. Blood clot formation (hemostasis) seals the wound. Neutrophils arrive \
                within hours to phagocytize bacteria and debris, followed by macrophages that clean the wound \
                and release growth factors.

                2. Proliferative phase (3-21 days) — fibroblasts migrate into the wound and produce collagen \
                and other extracellular matrix components. New blood vessels sprout from existing ones \
                (angiogenesis) to form granulation tissue — a pink, granular tissue rich in capillaries. \
                Epithelial cells at the wound edges divide and migrate across the wound surface \
                (re-epithelialization). If the wound is large, wound contraction by myofibroblasts pulls \
                the edges closer together.

                3. Maturation (remodeling) phase (21 days to 2 years) — collagen is reorganized and \
                strengthened; excess blood vessels regress. The scar tissue matures from pink to pale as \
                vascularity decreases. The final scar is only about 80% as strong as the original skin.

                Wound healing is categorized as primary intention (clean wound with edges brought together, \
                minimal scarring) or secondary intention (larger wound left open to fill in from the bottom, \
                more granulation tissue, more scarring).

                Factors that impair healing include poor nutrition (especially vitamin C and protein \
                deficiency), poor blood supply, infection, diabetes, corticosteroid use, and advanced age.
                """,
                keyTerms: [
                    KeyTerm(id: "w6-l11s2-k1", term: "Inflammatory Phase", definition: "The first phase of wound healing (days 0-3); involves hemostasis, vasodilation, and recruitment of neutrophils and macrophages."),
                    KeyTerm(id: "w6-l11s2-k2", term: "Proliferative Phase", definition: "The second phase of wound healing (days 3-21); fibroblasts produce collagen, angiogenesis forms granulation tissue, and epithelial cells re-cover the wound."),
                    KeyTerm(id: "w6-l11s2-k3", term: "Maturation Phase", definition: "The final phase of wound healing (day 21 to 2 years); collagen remodels, scar strengthens, vascularity decreases. Scar reaches ~80% original strength.")
                ],
                testablesFacts: [
                    "Three phases of wound healing: inflammatory → proliferative → maturation.",
                    "Neutrophils arrive first to phagocytize bacteria; macrophages follow to clean and release growth factors.",
                    "Granulation tissue is formed during the proliferative phase by fibroblasts and new capillaries.",
                    "Scar tissue reaches only about 80% the strength of the original skin.",
                    "Primary intention: wound edges together, minimal scar. Secondary intention: wound fills from bottom, more scar."
                ]
            ),
            // Section 3 — Skin Cancer
            LessonSection(
                id: "w6-l11-s3",
                heading: "Skin Cancer",
                content: """
                Skin cancer is the most common type of cancer. The primary risk factor is UV radiation \
                exposure. There are three major types:

                Basal cell carcinoma (BCC) is the most common and least dangerous skin cancer, accounting \
                for about 80% of cases. It arises from cells in the stratum basale. BCC typically appears \
                as a shiny, pearly nodule (often on sun-exposed areas like the face) that may develop a \
                central ulcer. It rarely metastasizes but can be locally destructive. It is slow-growing and \
                has an excellent prognosis with surgical removal.

                Squamous cell carcinoma (SCC) accounts for about 16% of skin cancers. It arises from \
                keratinocytes of the stratum spinosum. SCC typically appears as a scaly, reddened lesion or \
                a raised, ulcerated plaque on sun-exposed areas. It can metastasize if not treated, \
                especially in immunosuppressed patients. SCC has a good prognosis if caught early.

                Melanoma is the least common but most dangerous skin cancer, accounting for about 4% of \
                cases but causing the most deaths. It arises from melanocytes in the stratum basale. \
                Melanoma appears as an irregularly shaped, multicolored lesion that changes over time. \
                It metastasizes rapidly through the lymphatic and vascular systems if not detected early.

                The ABCDE rule helps identify suspicious lesions: \
                A = Asymmetry (one half does not match the other) \
                B = Border irregularity (edges are ragged or notched) \
                C = Color variation (multiple colors: tan, brown, black, red, white, blue) \
                D = Diameter (greater than 6 mm, about the size of a pencil eraser) \
                E = Evolving (the lesion is changing in size, shape, or color)
                """,
                keyTerms: [
                    KeyTerm(id: "w6-l11s3-k1", term: "Basal Cell Carcinoma", definition: "The most common skin cancer; arises from stratum basale cells; appears as a shiny, pearly nodule; rarely metastasizes."),
                    KeyTerm(id: "w6-l11s3-k2", term: "Squamous Cell Carcinoma", definition: "Skin cancer arising from keratinocytes of the stratum spinosum; appears as a scaly, reddened plaque; can metastasize if untreated."),
                    KeyTerm(id: "w6-l11s3-k3", term: "Melanoma", definition: "The most dangerous skin cancer; arises from melanocytes; metastasizes rapidly; identified by the ABCDE rule."),
                    KeyTerm(id: "w6-l11s3-k4", term: "ABCDE Rule", definition: "Criteria for identifying melanoma: Asymmetry, Border irregularity, Color variation, Diameter >6mm, Evolving.")
                ],
                testablesFacts: [
                    "Basal cell carcinoma is most common (80%) but least dangerous; rarely metastasizes.",
                    "Squamous cell carcinoma arises from stratum spinosum keratinocytes; can metastasize.",
                    "Melanoma arises from melanocytes, is least common but most lethal, and metastasizes rapidly.",
                    "ABCDE: Asymmetry, Border irregularity, Color variation, Diameter >6mm, Evolving.",
                    "UV radiation is the primary risk factor for all skin cancers."
                ]
            ),
            // Section 4 — Rule of Nines
            LessonSection(
                id: "w6-l11-s4",
                heading: "Rule of Nines for Burn Assessment",
                content: """
                The Rule of Nines is a clinical tool used by EMTs, paramedics, and emergency physicians to \
                quickly estimate the total body surface area (TBSA) affected by burns. It is essential for \
                determining fluid resuscitation needs (Parkland formula) and assessing burn severity.

                In an adult, the body is divided into regions, each representing approximately 9% (or a \
                multiple of 9%) of TBSA: \
                • Head and neck = 9% \
                • Each upper extremity (arm) = 9% (total 18%) \
                • Anterior trunk (chest and abdomen) = 18% \
                • Posterior trunk (back) = 18% \
                • Each lower extremity (leg) = 18% (total 36%) \
                • Perineum (genitalia) = 1% \
                Total = 100%

                In children, the Rule of Nines is modified because children have proportionally larger heads \
                and smaller legs. For infants: head = 18%, each leg = 14%.

                The palm of the patient's hand (including fingers) represents approximately 1% of their TBSA \
                and can be used to estimate smaller or irregularly shaped burns.

                Burns affecting more than 20% TBSA in adults (or 10% in children and elderly) are considered \
                critical and require immediate hospital transport with IV fluid resuscitation.
                """,
                keyTerms: [
                    KeyTerm(id: "w6-l11s4-k1", term: "Rule of Nines", definition: "A clinical estimation tool dividing the adult body into regions of 9% (or multiples) of total body surface area for rapid burn assessment."),
                    KeyTerm(id: "w6-l11s4-k2", term: "Total Body Surface Area (TBSA)", definition: "The percentage of skin surface affected by a burn; determines treatment urgency and fluid resuscitation requirements.")
                ],
                testablesFacts: [
                    "Head/neck = 9%, each arm = 9%, anterior trunk = 18%, posterior trunk = 18%, each leg = 18%, perineum = 1%.",
                    "The patient's palm (with fingers) ≈ 1% TBSA for estimating small burns.",
                    "In infants, the head is 18% and each leg is 14% due to different body proportions.",
                    "Burns >20% TBSA in adults are critical and require IV fluid resuscitation.",
                    "The Rule of Nines guides fluid resuscitation calculations (Parkland formula)."
                ]
            )
        ],
        clinicalApplication: ClinicalApplication(
            title: "Rule of Nines for Burn Assessment",
            scenario: "An EMT responds to a house fire. The patient has burns covering the entire anterior trunk, the entire right arm, and the anterior portion of both legs.",
            connection: "Using the Rule of Nines: anterior trunk = 18% + right arm = 9% + anterior right leg = 9% + anterior left leg = 9% = 45% TBSA. This exceeds the 20% threshold for critical burns. The EMT should initiate IV access for fluid resuscitation, cover burns with sterile dressings, maintain body temperature, and arrange rapid transport to a burn center. Accurate TBSA estimation directly determines the volume of IV fluids needed (Parkland formula: 4 mL × body weight in kg × %TBSA)."
        )
    )

    // =========================================================================
    // MARK: - QUIZ 3: Tissues & Integumentary Tissue (Week 5)
    // =========================================================================

    static let quiz3 = Quiz(
        id: "w5-quiz-3",
        title: "Quiz 3: Tissues & Integumentary Tissue",
        weekNumber: 5,
        lessonIds: ["w5-lesson-8", "w5-lesson-9"],
        questions: [
            // Q1 - Easy / Recall
            QuizQuestion(
                id: "w5-q3-01",
                question: "Which type of muscle tissue is voluntary and striated?",
                choices: [
                    "Cardiac muscle",
                    "Smooth muscle",
                    "Skeletal muscle",
                    "Visceral muscle"
                ],
                correctIndex: 2,
                explanation: "Skeletal muscle is the only muscle type that is both voluntary (consciously controlled) and striated (has visible banding pattern from organized sarcomeres).",
                difficulty: .easy,
                category: .recall
            ),
            // Q2 - Easy / Recall
            QuizQuestion(
                id: "w5-q3-02",
                question: "What is the basic contractile unit of skeletal and cardiac muscle?",
                choices: [
                    "Myofilament",
                    "Sarcomere",
                    "Intercalated disc",
                    "Motor unit"
                ],
                correctIndex: 1,
                explanation: "The sarcomere is the basic contractile unit, extending from one Z-disc to the next, containing overlapping actin and myosin filaments.",
                difficulty: .easy,
                category: .recall
            ),
            // Q3 - Easy / Recall
            QuizQuestion(
                id: "w5-q3-03",
                question: "Intercalated discs are a unique feature of which tissue type?",
                choices: [
                    "Skeletal muscle",
                    "Nervous tissue",
                    "Smooth muscle",
                    "Cardiac muscle"
                ],
                correctIndex: 3,
                explanation: "Intercalated discs are specialized junctions found only in cardiac muscle. They contain desmosomes for mechanical coupling and gap junctions for electrical coupling.",
                difficulty: .easy,
                category: .recall
            ),
            // Q4 - Medium / Application
            QuizQuestion(
                id: "w5-q3-04",
                question: "A patient has a tumor in the wall of the small intestine. The tumor likely involves which type of muscle tissue?",
                choices: [
                    "Skeletal muscle",
                    "Cardiac muscle",
                    "Smooth muscle",
                    "Striated muscle"
                ],
                correctIndex: 2,
                explanation: "Smooth muscle is found in the walls of hollow organs including the small intestine. It is involuntary and produces peristalsis for moving food through the GI tract.",
                difficulty: .medium,
                category: .application
            ),
            // Q5 - Easy / Recall
            QuizQuestion(
                id: "w5-q3-05",
                question: "Which part of a neuron receives incoming signals?",
                choices: [
                    "Axon",
                    "Cell body (soma)",
                    "Dendrite",
                    "Synapse"
                ],
                correctIndex: 2,
                explanation: "Dendrites are short, branching extensions that receive incoming signals and conduct them toward the cell body.",
                difficulty: .easy,
                category: .recall
            ),
            // Q6 - Easy / Recall
            QuizQuestion(
                id: "w5-q3-06",
                question: "What is the function of the myelin sheath?",
                choices: [
                    "To produce neurotransmitters",
                    "To increase the speed of nerve impulse conduction",
                    "To connect neurons at synapses",
                    "To provide nutrients to the neuron cell body"
                ],
                correctIndex: 1,
                explanation: "The myelin sheath is a lipid-rich insulating layer that dramatically increases nerve impulse conduction speed via saltatory conduction.",
                difficulty: .easy,
                category: .recall
            ),
            // Q7 - Medium / Recall
            QuizQuestion(
                id: "w5-q3-07",
                question: "Which type of membrane lines body cavities that open to the exterior?",
                choices: [
                    "Serous membrane",
                    "Synovial membrane",
                    "Cutaneous membrane",
                    "Mucous membrane"
                ],
                correctIndex: 3,
                explanation: "Mucous membranes (mucosae) line body cavities that open to the exterior, such as the digestive, respiratory, urinary, and reproductive tracts.",
                difficulty: .medium,
                category: .recall
            ),
            // Q8 - Medium / Recall
            QuizQuestion(
                id: "w5-q3-08",
                question: "Which serous membrane surrounds the heart?",
                choices: [
                    "Pleura",
                    "Peritoneum",
                    "Pericardium",
                    "Mesentery"
                ],
                correctIndex: 2,
                explanation: "The pericardium is the serous membrane surrounding the heart. The pleura surrounds the lungs, and the peritoneum lines the abdominal cavity.",
                difficulty: .medium,
                category: .recall
            ),
            // Q9 - Hard / Analysis
            QuizQuestion(
                id: "w5-q3-09",
                question: "A synovial membrane differs from other tissue membranes because it:",
                choices: [
                    "Is found in the respiratory tract",
                    "Contains no epithelial component",
                    "Secretes mucus instead of serous fluid",
                    "Is composed of dense regular connective tissue"
                ],
                correctIndex: 1,
                explanation: "Synovial membranes are unique because they are composed entirely of connective tissue with no epithelial layer, unlike mucous, serous, and cutaneous membranes.",
                difficulty: .hard,
                category: .analysis
            ),
            // Q10 - Medium / Recall
            QuizQuestion(
                id: "w5-q3-10",
                question: "The four cardinal signs of inflammation are:",
                choices: [
                    "Fever, chills, nausea, fatigue",
                    "Redness, heat, swelling, pain",
                    "Itching, blistering, bruising, numbness",
                    "Pallor, edema, tenderness, stiffness"
                ],
                correctIndex: 1,
                explanation: "The four cardinal signs of inflammation are redness and heat (from vasodilation), swelling (from increased capillary permeability), and pain (from chemical mediators stimulating nerve endings).",
                difficulty: .medium,
                category: .recall
            ),
            // Q11 - Medium / Application
            QuizQuestion(
                id: "w5-q3-11",
                question: "Cardiac muscle can contract as a coordinated unit because intercalated discs contain:",
                choices: [
                    "Collagen fibers for strength",
                    "Gap junctions for electrical coupling",
                    "Tight junctions to prevent leakage",
                    "Elastic fibers for recoil"
                ],
                correctIndex: 1,
                explanation: "Intercalated discs contain gap junctions that allow electrical signals (ions) to pass directly between cardiac cells, enabling the heart to contract as a functional syncytium.",
                difficulty: .medium,
                category: .application
            ),
            // Q12 - Easy / Recall
            QuizQuestion(
                id: "w5-q3-12",
                question: "The epidermis is composed of which tissue type?",
                choices: [
                    "Dense irregular connective tissue",
                    "Areolar connective tissue",
                    "Keratinized stratified squamous epithelium",
                    "Simple squamous epithelium"
                ],
                correctIndex: 2,
                explanation: "The epidermis is composed of keratinized stratified squamous epithelium, which provides a tough, waterproof protective barrier.",
                difficulty: .easy,
                category: .recall
            ),
            // Q13 - Easy / Recall
            QuizQuestion(
                id: "w5-q3-13",
                question: "Which layer of the epidermis contains actively dividing stem cells?",
                choices: [
                    "Stratum corneum",
                    "Stratum granulosum",
                    "Stratum spinosum",
                    "Stratum basale"
                ],
                correctIndex: 3,
                explanation: "The stratum basale (stratum germinativum) is the deepest epidermal layer and contains actively dividing stem cells that produce new keratinocytes.",
                difficulty: .easy,
                category: .recall
            ),
            // Q14 - Medium / Recall
            QuizQuestion(
                id: "w5-q3-14",
                question: "The stratum lucidum is found only in:",
                choices: [
                    "The scalp and face",
                    "Mucous membranes",
                    "Thick skin of palms and soles",
                    "The dermis of all body regions"
                ],
                correctIndex: 2,
                explanation: "The stratum lucidum is a thin, translucent layer found only in thick skin — the palms of the hands and the soles of the feet.",
                difficulty: .medium,
                category: .recall
            ),
            // Q15 - Easy / Recall
            QuizQuestion(
                id: "w5-q3-15",
                question: "Which epidermal cell type produces melanin?",
                choices: [
                    "Keratinocyte",
                    "Merkel cell",
                    "Langerhans cell",
                    "Melanocyte"
                ],
                correctIndex: 3,
                explanation: "Melanocytes are found in the stratum basale and produce melanin, a pigment that absorbs UV radiation to protect underlying cells from DNA damage.",
                difficulty: .easy,
                category: .recall
            ),
            // Q16 - Hard / Analysis
            QuizQuestion(
                id: "w5-q3-16",
                question: "From deepest to most superficial, the correct order of epidermal layers is:",
                choices: [
                    "Corneum → Lucidum → Granulosum → Spinosum → Basale",
                    "Basale → Granulosum → Spinosum → Lucidum → Corneum",
                    "Basale → Spinosum → Granulosum → Lucidum → Corneum",
                    "Spinosum → Basale → Granulosum → Corneum → Lucidum"
                ],
                correctIndex: 2,
                explanation: "From deep to superficial: Basale → Spinosum → Granulosum → Lucidum → Corneum. Mnemonic: 'Before Signing, Get Legal Counsel.'",
                difficulty: .hard,
                category: .analysis
            ),
            // Q17 - Medium / Application
            QuizQuestion(
                id: "w5-q3-17",
                question: "Langerhans cells in the epidermis function primarily as:",
                choices: [
                    "Touch receptors",
                    "Pigment producers",
                    "Antigen-presenting immune cells",
                    "Keratin synthesizers"
                ],
                correctIndex: 2,
                explanation: "Langerhans cells are dendritic (immune) cells found in the stratum spinosum. They detect foreign invaders and present antigens to activate the immune response.",
                difficulty: .medium,
                category: .application
            ),
            // Q18 - Medium / Recall
            QuizQuestion(
                id: "w5-q3-18",
                question: "The papillary layer of the dermis is composed of:",
                choices: [
                    "Dense irregular connective tissue",
                    "Areolar connective tissue",
                    "Adipose tissue",
                    "Reticular connective tissue"
                ],
                correctIndex: 1,
                explanation: "The papillary layer (superficial 20% of dermis) is composed of areolar connective tissue with collagen and elastic fibers, forming dermal papillae.",
                difficulty: .medium,
                category: .recall
            ),
            // Q19 - Hard / Clinical
            QuizQuestion(
                id: "w5-q3-19",
                question: "A burn patient has blisters, severe pain, and red, moist skin. This is classified as a:",
                choices: [
                    "First-degree (superficial) burn",
                    "Second-degree (partial-thickness) burn",
                    "Third-degree (full-thickness) burn",
                    "Fourth-degree burn"
                ],
                correctIndex: 1,
                explanation: "Second-degree (partial-thickness) burns damage the epidermis and part of the dermis, causing blisters, severe pain, and a red, moist appearance. First-degree burns have no blisters; third-degree burns are painless due to nerve destruction.",
                difficulty: .hard,
                category: .clinical
            ),
            // Q20 - Medium / Clinical
            QuizQuestion(
                id: "w5-q3-20",
                question: "An EMT notes that a third-degree burn area is painless. This is because:",
                choices: [
                    "The patient is in shock and cannot feel pain",
                    "Anti-inflammatory chemicals numb the area",
                    "Sensory nerve endings in the dermis have been destroyed",
                    "Endorphins released during the burn block all pain"
                ],
                correctIndex: 2,
                explanation: "Third-degree (full-thickness) burns destroy the entire epidermis and dermis, including the sensory nerve endings. The burned area is painless, though surrounding areas with partial-thickness burns may be extremely painful.",
                difficulty: .medium,
                category: .clinical
            )
        ],
        timeLimit: 1800  // 30 minutes
    )

    // =========================================================================
    // MARK: - QUIZ 4: Integumentary System (Week 6)
    // =========================================================================

    static let quiz4 = Quiz(
        id: "w6-quiz-4",
        title: "Quiz 4: Integumentary System",
        weekNumber: 6,
        lessonIds: ["w6-lesson-10", "w6-lesson-11"],
        questions: [
            // Q1 - Easy / Recall
            QuizQuestion(
                id: "w6-q4-01",
                question: "The arrector pili muscle is responsible for:",
                choices: [
                    "Hair growth",
                    "Sebum production",
                    "Producing goosebumps",
                    "Sweat secretion"
                ],
                correctIndex: 2,
                explanation: "The arrector pili is a smooth muscle attached to each hair follicle. When it contracts (from cold or fright), it pulls the hair upright, producing goosebumps.",
                difficulty: .easy,
                category: .recall
            ),
            // Q2 - Easy / Recall
            QuizQuestion(
                id: "w6-q4-02",
                question: "The growth zone of a nail is called the:",
                choices: [
                    "Lunula",
                    "Nail matrix",
                    "Nail bed",
                    "Cuticle"
                ],
                correctIndex: 1,
                explanation: "The nail matrix is the growth zone located beneath the proximal nail fold. Actively dividing cells here produce the nail plate.",
                difficulty: .easy,
                category: .recall
            ),
            // Q3 - Easy / Recall
            QuizQuestion(
                id: "w6-q4-03",
                question: "Which type of sweat gland is most important for thermoregulation?",
                choices: [
                    "Apocrine gland",
                    "Sebaceous gland",
                    "Eccrine (merocrine) gland",
                    "Ceruminous gland"
                ],
                correctIndex: 2,
                explanation: "Eccrine (merocrine) sweat glands are the most numerous skin glands and are primarily responsible for thermoregulation through evaporative cooling.",
                difficulty: .easy,
                category: .recall
            ),
            // Q4 - Medium / Recall
            QuizQuestion(
                id: "w6-q4-04",
                question: "Apocrine sweat glands differ from eccrine glands in that they:",
                choices: [
                    "Are found all over the body",
                    "Produce watery, hypotonic sweat",
                    "Empty into hair follicles in the axillary and anogenital regions",
                    "Are the primary glands for body cooling"
                ],
                correctIndex: 2,
                explanation: "Apocrine sweat glands are found primarily in axillary and anogenital regions and empty into hair follicles. They produce a thicker secretion that becomes odorous when metabolized by skin bacteria.",
                difficulty: .medium,
                category: .recall
            ),
            // Q5 - Medium / Recall
            QuizQuestion(
                id: "w6-q4-05",
                question: "Sebaceous glands secrete sebum via which mode of secretion?",
                choices: [
                    "Merocrine (exocytosis)",
                    "Apocrine",
                    "Holocrine",
                    "Endocrine"
                ],
                correctIndex: 2,
                explanation: "Sebaceous glands use holocrine secretion — the entire cell ruptures and becomes part of the secretion. The cell's contents (sebum) are released when the cell disintegrates.",
                difficulty: .medium,
                category: .recall
            ),
            // Q6 - Easy / Recall
            QuizQuestion(
                id: "w6-q4-06",
                question: "The whitish, crescent-shaped area at the base of a nail is called the:",
                choices: [
                    "Nail matrix",
                    "Eponychium",
                    "Lunula",
                    "Hyponychium"
                ],
                correctIndex: 2,
                explanation: "The lunula is the whitish, crescent-shaped area visible at the proximal base of the nail. It appears white because the thick matrix region obscures the underlying blood vessels.",
                difficulty: .easy,
                category: .recall
            ),
            // Q7 - Medium / Application
            QuizQuestion(
                id: "w6-q4-07",
                question: "When body temperature rises, the skin promotes heat loss by:",
                choices: [
                    "Vasoconstriction and arrector pili contraction",
                    "Vasodilation and increased eccrine sweat secretion",
                    "Increased sebum production and vasoconstriction",
                    "Decreased blood flow and shivering"
                ],
                correctIndex: 1,
                explanation: "When body temperature rises, dermal blood vessels dilate (vasodilation) to bring warm blood to the surface for radiation, and eccrine glands produce sweat for evaporative cooling.",
                difficulty: .medium,
                category: .application
            ),
            // Q8 - Medium / Application
            QuizQuestion(
                id: "w6-q4-08",
                question: "Vitamin D synthesis in the skin begins when:",
                choices: [
                    "Melanocytes absorb infrared radiation",
                    "UV-B radiation converts 7-dehydrocholesterol to cholecalciferol",
                    "Keratinocytes release calcitriol directly into the blood",
                    "Sebaceous glands secrete vitamin D precursors"
                ],
                correctIndex: 1,
                explanation: "UV-B radiation converts 7-dehydrocholesterol in keratinocytes to cholecalciferol (vitamin D₃). This precursor is then further processed by the liver and kidneys into active calcitriol.",
                difficulty: .medium,
                category: .application
            ),
            // Q9 - Easy / Recall
            QuizQuestion(
                id: "w6-q4-09",
                question: "Which phase of wound healing involves the formation of granulation tissue?",
                choices: [
                    "Inflammatory phase",
                    "Proliferative phase",
                    "Maturation phase",
                    "Hemostasis phase"
                ],
                correctIndex: 1,
                explanation: "Granulation tissue forms during the proliferative phase (days 3-21). Fibroblasts produce collagen and new capillaries sprout (angiogenesis) to create this pink, granular tissue.",
                difficulty: .easy,
                category: .recall
            ),
            // Q10 - Medium / Recall
            QuizQuestion(
                id: "w6-q4-10",
                question: "During the inflammatory phase of wound healing, which cells arrive first?",
                choices: [
                    "Fibroblasts",
                    "Macrophages",
                    "Neutrophils",
                    "Mast cells"
                ],
                correctIndex: 2,
                explanation: "Neutrophils arrive first (within hours) to phagocytize bacteria and debris. They are followed by macrophages, which clean the wound and release growth factors.",
                difficulty: .medium,
                category: .recall
            ),
            // Q11 - Hard / Analysis
            QuizQuestion(
                id: "w6-q4-11",
                question: "A healed wound scar is weaker than original skin because scar tissue reaches approximately what percentage of original skin strength?",
                choices: [
                    "50%",
                    "65%",
                    "80%",
                    "95%"
                ],
                correctIndex: 2,
                explanation: "Scar tissue from wound repair reaches only about 80% of the original skin's tensile strength, because the collagen fibers in scar tissue are less organized than in normal dermis.",
                difficulty: .hard,
                category: .analysis
            ),
            // Q12 - Easy / Recall
            QuizQuestion(
                id: "w6-q4-12",
                question: "Which type of skin cancer is the most common?",
                choices: [
                    "Melanoma",
                    "Squamous cell carcinoma",
                    "Basal cell carcinoma",
                    "Kaposi sarcoma"
                ],
                correctIndex: 2,
                explanation: "Basal cell carcinoma is the most common skin cancer (about 80% of cases). It arises from cells in the stratum basale, is slow-growing, and rarely metastasizes.",
                difficulty: .easy,
                category: .recall
            ),
            // Q13 - Easy / Recall
            QuizQuestion(
                id: "w6-q4-13",
                question: "Which skin cancer is the most dangerous and most likely to metastasize?",
                choices: [
                    "Basal cell carcinoma",
                    "Melanoma",
                    "Squamous cell carcinoma",
                    "Actinic keratosis"
                ],
                correctIndex: 1,
                explanation: "Melanoma is the most dangerous skin cancer. Although it accounts for only about 4% of skin cancer cases, it metastasizes rapidly and causes the most skin cancer deaths.",
                difficulty: .easy,
                category: .recall
            ),
            // Q14 - Medium / Recall
            QuizQuestion(
                id: "w6-q4-14",
                question: "In the ABCDE rule for melanoma detection, the 'D' stands for:",
                choices: [
                    "Darkness of color",
                    "Diameter greater than 6 mm",
                    "Depth of the lesion",
                    "Distribution across the body"
                ],
                correctIndex: 1,
                explanation: "D = Diameter greater than 6 mm (about the size of a pencil eraser). The full ABCDE: Asymmetry, Border irregularity, Color variation, Diameter >6mm, Evolving.",
                difficulty: .medium,
                category: .recall
            ),
            // Q15 - Medium / Clinical
            QuizQuestion(
                id: "w6-q4-15",
                question: "Using the Rule of Nines, what percentage of TBSA does the entire anterior trunk represent in an adult?",
                choices: [
                    "9%",
                    "18%",
                    "27%",
                    "36%"
                ],
                correctIndex: 1,
                explanation: "The anterior trunk (chest and abdomen) represents 18% of total body surface area in an adult according to the Rule of Nines.",
                difficulty: .medium,
                category: .clinical
            ),
            // Q16 - Hard / Clinical
            QuizQuestion(
                id: "w6-q4-16",
                question: "An adult patient has burns covering the entire right arm and the entire anterior trunk. Using the Rule of Nines, the estimated TBSA burned is:",
                choices: [
                    "18%",
                    "27%",
                    "36%",
                    "45%"
                ],
                correctIndex: 1,
                explanation: "Right arm = 9% + anterior trunk = 18% = 27% TBSA. This exceeds the 20% threshold for critical burns in adults and requires IV fluid resuscitation and burn center transport.",
                difficulty: .hard,
                category: .clinical
            ),
            // Q17 - Medium / Application
            QuizQuestion(
                id: "w6-q4-17",
                question: "Ceruminous glands are modified apocrine glands found in the:",
                choices: [
                    "Axillary region",
                    "External ear canal",
                    "Scalp",
                    "Nasal cavity"
                ],
                correctIndex: 1,
                explanation: "Ceruminous glands are modified apocrine glands found in the external ear canal. They produce cerumen (earwax), which traps debris and repels insects.",
                difficulty: .medium,
                category: .application
            ),
            // Q18 - Medium / Clinical
            QuizQuestion(
                id: "w6-q4-18",
                question: "An EMT observes bluish fingernail beds in a patient with respiratory distress. This finding is called:",
                choices: [
                    "Jaundice",
                    "Erythema",
                    "Cyanosis",
                    "Pallor"
                ],
                correctIndex: 2,
                explanation: "Cyanosis is a bluish discoloration of the skin and nail beds indicating inadequate oxygenation of hemoglobin. Nail beds are a reliable assessment site because they are translucent and highly vascular.",
                difficulty: .medium,
                category: .clinical
            ),
            // Q19 - Hard / Analysis
            QuizQuestion(
                id: "w6-q4-19",
                question: "Which statement about wound healing by secondary intention is correct?",
                choices: [
                    "Wound edges are brought together with sutures",
                    "There is minimal granulation tissue and scarring",
                    "The wound fills from the bottom with more granulation tissue and results in more scarring",
                    "It only occurs in first-degree burns"
                ],
                correctIndex: 2,
                explanation: "Secondary intention occurs with larger wounds left open. The wound must fill in from the bottom, requiring more granulation tissue, more wound contraction, and resulting in more scarring than primary intention healing.",
                difficulty: .hard,
                category: .analysis
            ),
            // Q20 - Hard / Clinical
            QuizQuestion(
                id: "w6-q4-20",
                question: "In an infant, the Rule of Nines allocates what percentage of TBSA to the head?",
                choices: [
                    "9%",
                    "14%",
                    "18%",
                    "27%"
                ],
                correctIndex: 2,
                explanation: "In infants, the head represents 18% of TBSA (compared to 9% in adults) because infants have proportionally larger heads. Each leg is 14% (compared to 18% in adults).",
                difficulty: .hard,
                category: .clinical
            )
        ],
        timeLimit: 1800  // 30 minutes
    )

    // =========================================================================
    // MARK: - FLASHCARD DECK: Muscle & Nervous Tissue
    // =========================================================================

    static let deckMuscleNervousTissue = FlashcardDeck(
        id: "w5-deck-muscle-nervous",
        title: "Muscle & Nervous Tissue",
        weekNumber: 5,
        category: "Tissues",
        cards: [
            Flashcard(id: "w5-fc-mn-01", front: "What are the three types of muscle tissue?", back: "Skeletal (voluntary, striated), cardiac (involuntary, striated), and smooth (involuntary, non-striated).", hint: "Think about voluntary vs. involuntary and striated vs. non-striated.", repetition: w56SR),
            Flashcard(id: "w5-fc-mn-02", front: "What is a sarcomere?", back: "The basic contractile unit of skeletal and cardiac muscle, extending from one Z-disc to the next, containing overlapping actin (thin) and myosin (thick) filaments.", hint: "Z-disc to Z-disc.", repetition: w56SR),
            Flashcard(id: "w5-fc-mn-03", front: "What are intercalated discs and where are they found?", back: "Specialized junctions found only in cardiac muscle cells. They contain desmosomes (mechanical coupling) and gap junctions (electrical coupling), allowing the heart to beat as a coordinated unit.", hint: "Unique to cardiac muscle.", repetition: w56SR),
            Flashcard(id: "w5-fc-mn-04", front: "Describe smooth muscle: location, shape, and control.", back: "Found in walls of hollow organs (stomach, intestines, blood vessels). Cells are spindle-shaped (fusiform), uninucleate, and non-striated. Involuntary, controlled by the autonomic nervous system.", hint: "Hollow organs, spindle shape, no stripes.", repetition: w56SR),
            Flashcard(id: "w5-fc-mn-05", front: "What are the three main parts of a neuron?", back: "1) Cell body (soma) — contains nucleus. 2) Dendrites — receive signals toward cell body. 3) Axon — conducts impulses away from cell body.", hint: "Think: receive → integrate → transmit.", repetition: w56SR),
            Flashcard(id: "w5-fc-mn-06", front: "What is a synapse?", back: "The junction between a neuron and another cell (neuron, muscle, or gland) where neurotransmitter chemicals relay the signal across the synaptic cleft.", hint: "The gap where chemicals carry the message.", repetition: w56SR),
            Flashcard(id: "w5-fc-mn-07", front: "What is the myelin sheath and what does it do?", back: "A lipid-rich insulating layer around axons formed by Schwann cells (PNS) or oligodendrocytes (CNS). It increases conduction speed via saltatory conduction (impulse jumps between nodes of Ranvier).", hint: "Insulation = faster signals.", repetition: w56SR),
            Flashcard(id: "w5-fc-mn-08", front: "What are neuroglia (glial cells)?", back: "Supporting cells of the nervous system that protect, nourish, and insulate neurons. They outnumber neurons ~10:1 but do not transmit nerve impulses.", hint: "Support staff, not signal transmitters.", repetition: w56SR),
            Flashcard(id: "w5-fc-mn-09", front: "Name the four types of tissue membranes.", back: "1) Mucous — lines cavities open to exterior. 2) Serous — lines closed cavities (pleura, pericardium, peritoneum). 3) Cutaneous — the skin. 4) Synovial — lines joint cavities (connective tissue only).", hint: "M-S-C-S.", repetition: w56SR),
            Flashcard(id: "w5-fc-mn-10", front: "What are the four cardinal signs of inflammation?", back: "Redness (rubor), heat (calor), swelling (tumor), and pain (dolor). Caused by vasodilation, increased capillary permeability, and chemical mediators.", hint: "Latin: rubor, calor, tumor, dolor.", repetition: w56SR),
            Flashcard(id: "w5-fc-mn-11", front: "What is the difference between regeneration and fibrosis in tissue repair?", back: "Regeneration replaces damaged tissue with the same cell type. Fibrosis replaces it with scar tissue (dense connective tissue). Tissues with limited regenerative capacity (cardiac, nervous) rely on fibrosis.", hint: "Same tissue vs. scar tissue.", repetition: w56SR),
            Flashcard(id: "w5-fc-mn-12", front: "Which tissues regenerate well and which do not?", back: "Good regeneration: epithelial tissue, bone, areolar connective tissue. Moderate: skeletal muscle. Poor: cardiac muscle, nervous tissue — these repair mainly by fibrosis (scar tissue).", hint: "Heart and brain don't regenerate well.", repetition: w56SR)
        ]
    )

    // =========================================================================
    // MARK: - FLASHCARD DECK: Skin Layers
    // =========================================================================

    static let deckSkinLayers = FlashcardDeck(
        id: "w5-deck-skin-layers",
        title: "Skin Layers",
        weekNumber: 5,
        category: "Integumentary",
        cards: [
            Flashcard(id: "w5-fc-sl-01", front: "What are the three main layers of the skin (superficial to deep)?", back: "Epidermis (keratinized stratified squamous epithelium), dermis (connective tissue), and hypodermis/subcutaneous layer (adipose tissue — technically not part of skin).", hint: "Epi = above, derm = skin, hypo = below.", repetition: w56SR),
            Flashcard(id: "w5-fc-sl-02", front: "List the five layers of the epidermis from deep to superficial.", back: "Stratum basale → stratum spinosum → stratum granulosum → stratum lucidum → stratum corneum. Mnemonic: 'Before Signing, Get Legal Counsel.'", hint: "B-S-G-L-C.", repetition: w56SR),
            Flashcard(id: "w5-fc-sl-03", front: "What is the stratum basale?", back: "The deepest epidermal layer; a single row of actively dividing stem cells (keratinocytes) attached to the basement membrane. Also contains melanocytes and Merkel cells. Also called stratum germinativum.", hint: "The 'birth' layer of the epidermis.", repetition: w56SR),
            Flashcard(id: "w5-fc-sl-04", front: "What is the stratum corneum?", back: "The outermost and thickest epidermal layer; 20-30 rows of dead, flat, fully keratinized cells (corneocytes) that are continuously shed. Provides the main barrier against water loss, abrasion, and pathogens.", hint: "Corneum = 'horny layer,' the dead protective shield.", repetition: w56SR),
            Flashcard(id: "w5-fc-sl-05", front: "Where is the stratum lucidum found?", back: "Only in thick skin — the palms of the hands and the soles of the feet. It is a thin, translucent layer of clear, dead keratinocytes between the granulosum and corneum.", hint: "Lucidum = clear/light. Only thick skin.", repetition: w56SR),
            Flashcard(id: "w5-fc-sl-06", front: "Name the four cell types of the epidermis and their functions.", back: "1) Keratinocytes (90%) — produce keratin. 2) Melanocytes — produce melanin (UV protection). 3) Langerhans cells — immune surveillance (antigen-presenting). 4) Merkel cells — touch receptors.", hint: "K-M-L-M: keratin, melanin, Langerhans, Merkel.", repetition: w56SR),
            Flashcard(id: "w5-fc-sl-07", front: "What three pigments contribute to skin color?", back: "1) Melanin — brown/black pigment from melanocytes (UV protection). 2) Carotene — yellow-orange pigment in stratum corneum and hypodermis. 3) Hemoglobin — red pigment in blood visible through epidermis.", hint: "Brown + yellow + red/pink.", repetition: w56SR),
            Flashcard(id: "w5-fc-sl-08", front: "What are dermal papillae?", back: "Finger-like projections of the papillary dermis that extend into the epidermis. They increase surface area for nutrient exchange, anchor the epidermis, and create fingerprints on hands and feet.", hint: "Papilla = nipple-like projections.", repetition: w56SR),
            Flashcard(id: "w5-fc-sl-09", front: "Compare the two layers of the dermis.", back: "Papillary layer (superficial 20%): areolar CT, dermal papillae, Meissner's corpuscles. Reticular layer (deep 80%): dense irregular CT, thick collagen bundles, Pacinian corpuscles, hair follicles, glands.", hint: "Papillary = thin/loose, reticular = thick/dense.", repetition: w56SR),
            Flashcard(id: "w5-fc-sl-10", front: "What is the hypodermis?", back: "The subcutaneous layer deep to the dermis, composed mainly of adipose and areolar connective tissue. Not technically part of the skin. Functions: anchors skin, insulates, absorbs shock, stores energy.", hint: "Sub-Q: fat layer below the skin.", repetition: w56SR),
            Flashcard(id: "w5-fc-sl-11", front: "Classify burns by degree/depth.", back: "1st degree (superficial): epidermis only, red, painful, no blisters. 2nd degree (partial-thickness): epidermis + part of dermis, blisters, severe pain. 3rd degree (full-thickness): epidermis + entire dermis destroyed, white/charred, painless (nerves destroyed).", hint: "More depth = less pain (nerve destruction).", repetition: w56SR),
            Flashcard(id: "w5-fc-sl-12", front: "Why is the epidermis avascular?", back: "The epidermis contains no blood vessels. It receives nutrients by diffusion from capillaries in the dermis (papillary layer). This is why superficial cuts in the epidermis do not bleed.", hint: "No vessels = nutrients diffuse up from dermis.", repetition: w56SR)
        ]
    )

    // =========================================================================
    // MARK: - FLASHCARD DECK: Integumentary Structures
    // =========================================================================

    static let deckIntegumentaryStructures = FlashcardDeck(
        id: "w6-deck-integumentary-structures",
        title: "Integumentary Structures",
        weekNumber: 6,
        category: "Integumentary",
        cards: [
            Flashcard(id: "w6-fc-is-01", front: "What are the three layers of a hair shaft?", back: "Medulla (central core, may be absent in fine hair), cortex (bulk of hair, contains melanin for color), and cuticle (outermost layer of overlapping keratinized cells).", hint: "Inside → outside: M-C-C.", repetition: w56SR),
            Flashcard(id: "w6-fc-is-02", front: "What is the arrector pili muscle?", back: "A small smooth muscle attached to each hair follicle. When it contracts (cold/fright), it pulls the hair upright (goosebumps) and compresses the sebaceous gland to release sebum.", hint: "Goosebumps + oil release.", repetition: w56SR),
            Flashcard(id: "w6-fc-is-03", front: "What are the three phases of hair growth?", back: "Anagen (active growth, 2-6 years), catagen (regression, 2-3 weeks), telogen (rest, 1-5 months, then hair falls out). ~90% of scalp hairs are in anagen at any time.", hint: "A-C-T: Active, Change, Time out.", repetition: w56SR),
            Flashcard(id: "w6-fc-is-04", front: "What is the nail matrix?", back: "The growth zone of the nail located beneath the proximal nail fold. Actively dividing cells here produce the nail plate (nail body). Fingernails grow ~1 mm/week.", hint: "Matrix = factory that makes the nail.", repetition: w56SR),
            Flashcard(id: "w6-fc-is-05", front: "What is the lunula?", back: "The whitish, crescent-shaped area at the base of the nail, visible through the nail body. It appears white because the thicker nail matrix region obscures the underlying blood vessels.", hint: "Luna = moon shape at the nail base.", repetition: w56SR),
            Flashcard(id: "w6-fc-is-06", front: "Compare eccrine and apocrine sweat glands.", back: "Eccrine: most numerous, entire body, watery sweat, thermoregulation, open onto skin surface. Apocrine: axillary/anogenital, thicker secretion, empty into hair follicles, active at puberty, odorous when bacteria metabolize secretion.", hint: "Eccrine = everywhere/cooling. Apocrine = armpits/puberty.", repetition: w56SR),
            Flashcard(id: "w6-fc-is-07", front: "How do sebaceous glands secrete?", back: "Via holocrine secretion — the entire cell ruptures and its contents (sebum) become the secretion. Sebum lubricates skin/hair, prevents water loss, and has mild bactericidal properties.", hint: "Holocrine = whole cell becomes the product.", repetition: w56SR),
            Flashcard(id: "w6-fc-is-08", front: "What are the five major functions of the integumentary system?", back: "1) Protection (barrier). 2) Thermoregulation (vasodilation/constriction, sweating). 3) Sensation (touch, pressure, temperature, pain). 4) Vitamin D synthesis. 5) Excretion (minor, via sweat).", hint: "P-T-S-V-E.", repetition: w56SR),
            Flashcard(id: "w6-fc-is-09", front: "Name the three phases of wound healing.", back: "1) Inflammatory (days 0-3): hemostasis, neutrophils, macrophages. 2) Proliferative (days 3-21): fibroblasts, collagen, granulation tissue, re-epithelialization. 3) Maturation (day 21 - 2 years): collagen remodeling, scar reaches ~80% strength.", hint: "Inflame → Proliferate → Mature.", repetition: w56SR),
            Flashcard(id: "w6-fc-is-10", front: "Compare the three types of skin cancer.", back: "Basal cell carcinoma: most common (80%), least dangerous, rarely metastasizes, shiny pearly nodule. Squamous cell carcinoma: 16%, can metastasize, scaly reddened plaque. Melanoma: 4% but most lethal, arises from melanocytes, metastasizes rapidly.", hint: "BCC = common/safe. Melanoma = rare/deadly.", repetition: w56SR),
            Flashcard(id: "w6-fc-is-11", front: "What is the ABCDE rule for melanoma?", back: "A = Asymmetry (halves don't match). B = Border irregularity (ragged/notched edges). C = Color variation (multiple colors). D = Diameter >6 mm (pencil eraser). E = Evolving (changing over time).", hint: "A-B-C-D-E: the alphabet of suspicious moles.", repetition: w56SR),
            Flashcard(id: "w6-fc-is-12", front: "What is the Rule of Nines? (Adult values)", back: "A burn assessment tool: Head/neck = 9%, each arm = 9%, anterior trunk = 18%, posterior trunk = 18%, each leg = 18%, perineum = 1%. Patient's palm ≈ 1% TBSA. Burns >20% TBSA in adults are critical.", hint: "Everything is 9 or a multiple of 9.", repetition: w56SR)
        ]
    )
}
