import Foundation

// MARK: - Course Content for Bio 40A, Weeks 7-8
// Bone Tissue (Ch 6) and Skeletal System (Ch 7-8)

extension CourseContent {

    // MARK: - Convenience alias
    private static let sr78 = Flashcard.SpacedRepetitionData()

    // MARK: - Aggregated arrays for weeks 7-8
    static let lessonsWeeks7_8: [Lesson] = [lesson12, lesson13]
    static let quizzesWeeks7_8: [Quiz] = [quizWeeks7_8]
    static let flashcardDecksWeeks7_8: [FlashcardDeck] = [
        deckBoneTissue,
        deckSkeletalBones
    ]

    // =========================================================================
    // MARK: - LESSON 12: Bone Tissue
    // =========================================================================

    static let lesson12 = Lesson(
        id: "lesson-12",
        weekNumber: 7,
        classNumber: 12,
        title: "Bone Tissue",
        subtitle: "Bone classification, structure, cells, formation, and remodeling",
        textbookChapter: "Chapter 6",
        textbookSections: "6.1 - 6.7",
        sections: [
            LessonSection(
                id: "l12-s1",
                heading: "Bone Classification",
                content: """
                Bones are classified by their shape into five categories. Long bones are longer than they \
                are wide and function primarily as levers; examples include the femur, humerus, tibia, \
                fibula, phalanges, and metacarpals. Short bones are roughly cube-shaped and provide \
                stability with limited movement; examples include the carpals (wrist) and tarsals (ankle). \
                Flat bones are thin, flattened, and somewhat curved; they protect underlying organs and \
                provide broad surfaces for muscle attachment — examples include the frontal bone, parietal \
                bones, sternum, ribs, and scapulae. Irregular bones have complex shapes that do not fit \
                the other categories; examples include the vertebrae, hip bones, and several skull bones \
                (sphenoid, ethmoid). Sesamoid bones are small, round bones embedded within tendons where \
                considerable pressure develops; the patella (kneecap) is the largest sesamoid bone. \
                Sesamoid bones protect tendons from excessive wear and change the direction of pull of \
                a tendon to improve the mechanical advantage of the associated muscle.
                """,
                keyTerms: [
                    KeyTerm(id: "l12s1-k1", term: "Long Bone", definition: "A bone that is longer than it is wide; functions as a lever. Examples: femur, humerus, tibia, phalanges."),
                    KeyTerm(id: "l12s1-k2", term: "Short Bone", definition: "A roughly cube-shaped bone that provides stability with limited motion. Examples: carpals, tarsals."),
                    KeyTerm(id: "l12s1-k3", term: "Flat Bone", definition: "A thin, flattened bone that protects organs and provides surfaces for muscle attachment. Examples: frontal bone, sternum, ribs."),
                    KeyTerm(id: "l12s1-k4", term: "Irregular Bone", definition: "A bone with a complex shape not fitting other categories. Examples: vertebrae, hip bones, sphenoid."),
                    KeyTerm(id: "l12s1-k5", term: "Sesamoid Bone", definition: "A small, round bone embedded in a tendon; protects the tendon and improves mechanical advantage. Example: patella.")
                ],
                testablesFacts: [
                    "The five bone classifications are: long, short, flat, irregular, and sesamoid.",
                    "Long bones function as levers (femur, humerus, tibia, phalanges).",
                    "Short bones are cube-shaped and include carpals and tarsals.",
                    "Flat bones protect organs and provide muscle attachment surfaces (sternum, ribs, skull bones).",
                    "The patella is the largest sesamoid bone; sesamoid bones are embedded in tendons."
                ]
            ),
            LessonSection(
                id: "l12-s2",
                heading: "Bone Structure: Compact vs Spongy Bone",
                content: """
                A typical long bone has a cylindrical shaft called the diaphysis and expanded ends called \
                epiphyses (singular: epiphysis). The region where the diaphysis transitions to the epiphysis \
                is the metaphysis; in growing bone this contains the epiphyseal (growth) plate of hyaline \
                cartilage. The outer surface of bone is covered by the periosteum, a tough double-layered \
                membrane. The outer fibrous layer of the periosteum provides attachment for tendons and \
                ligaments; the inner osteogenic layer contains osteoblasts and osteoclasts for bone growth \
                and repair. Lining the internal surfaces (medullary cavity, trabeculae) is the endosteum, \
                a thin membrane also containing osteoblasts and osteoclasts. The hollow center of the \
                diaphysis is the medullary (marrow) cavity, which contains yellow bone marrow (fat) in adults. \
                \
                Compact (cortical) bone forms the dense outer shell of every bone and most of the diaphysis. \
                Its structural unit is the osteon (Haversian system). Each osteon consists of concentric \
                rings of calcified matrix called lamellae surrounding a central (Haversian) canal that \
                contains blood vessels and nerves. Between the lamellae are small spaces called lacunae, \
                each housing an osteocyte (mature bone cell). Tiny channels called canaliculi radiate from \
                each lacuna, connecting osteocytes to one another and to the central canal, allowing nutrient \
                and waste exchange. Perforating (Volkmann's) canals run perpendicular to the central canals, \
                connecting adjacent osteons and the periosteum to the medullary cavity. \
                \
                Spongy (cancellous or trabecular) bone is found in the epiphyses of long bones, in the \
                interior of short, flat, and irregular bones, and lining the medullary cavity. It consists \
                of a lattice of thin plates and rods called trabeculae. Spongy bone does not contain \
                osteons; instead, its trabeculae contain irregularly arranged lamellae with osteocytes in \
                lacunae nourished by diffusion from the surrounding marrow. The spaces between trabeculae \
                are filled with red bone marrow, which is the site of blood cell formation (hematopoiesis).
                """,
                keyTerms: [
                    KeyTerm(id: "l12s2-k1", term: "Diaphysis", definition: "The cylindrical shaft of a long bone; composed mainly of compact bone surrounding the medullary cavity."),
                    KeyTerm(id: "l12s2-k2", term: "Epiphysis", definition: "The expanded end of a long bone; composed of spongy bone covered by a thin layer of compact bone. Articular cartilage covers its joint surface."),
                    KeyTerm(id: "l12s2-k3", term: "Metaphysis", definition: "The region between the diaphysis and epiphysis; contains the epiphyseal plate (growth plate) in growing bone."),
                    KeyTerm(id: "l12s2-k4", term: "Periosteum", definition: "A tough double-layered membrane covering the outer surface of bone. The outer fibrous layer anchors tendons/ligaments; the inner osteogenic layer contains bone-forming cells."),
                    KeyTerm(id: "l12s2-k5", term: "Endosteum", definition: "A thin membrane lining the internal surfaces of bone (medullary cavity, trabeculae); contains osteoblasts and osteoclasts."),
                    KeyTerm(id: "l12s2-k6", term: "Medullary Cavity", definition: "The hollow interior of the diaphysis; contains yellow marrow (fat) in adults."),
                    KeyTerm(id: "l12s2-k7", term: "Osteon (Haversian System)", definition: "The structural unit of compact bone; concentric lamellae surrounding a central (Haversian) canal containing blood vessels and nerves."),
                    KeyTerm(id: "l12s2-k8", term: "Lamellae", definition: "Concentric rings of calcified extracellular matrix within an osteon."),
                    KeyTerm(id: "l12s2-k9", term: "Lacunae", definition: "Small spaces between lamellae that house osteocytes (mature bone cells)."),
                    KeyTerm(id: "l12s2-k10", term: "Canaliculi", definition: "Tiny channels radiating from lacunae that connect osteocytes to each other and to the central canal, enabling nutrient and waste exchange."),
                    KeyTerm(id: "l12s2-k11", term: "Haversian Canal", definition: "The central canal of an osteon; contains blood vessels and nerves that supply the osteocytes."),
                    KeyTerm(id: "l12s2-k12", term: "Volkmann's Canal", definition: "Perforating canals that run perpendicular to Haversian canals, connecting adjacent osteons and linking periosteal and endosteal blood supplies."),
                    KeyTerm(id: "l12s2-k13", term: "Trabeculae", definition: "Thin plates and rods of bone forming the lattice of spongy bone; spaces between trabeculae contain red marrow.")
                ],
                testablesFacts: [
                    "The diaphysis is the shaft; the epiphyses are the expanded ends; the metaphysis is the transitional region containing the growth plate.",
                    "The periosteum covers the outer bone surface; the endosteum lines internal surfaces.",
                    "Compact bone's structural unit is the osteon (Haversian system): concentric lamellae around a central canal.",
                    "Lacunae house osteocytes; canaliculi connect osteocytes to each other and to the central canal.",
                    "Volkmann's canals run perpendicular to Haversian canals, connecting adjacent osteons.",
                    "Spongy bone has trabeculae instead of osteons; red marrow fills the spaces between trabeculae.",
                    "Red bone marrow is the site of hematopoiesis (blood cell formation)."
                ]
            ),
            LessonSection(
                id: "l12-s3",
                heading: "Bone Cells",
                content: """
                Three principal cell types maintain bone tissue. Osteoblasts are bone-building cells found \
                on bone surfaces (periosteum and endosteum). They synthesize and secrete osteoid, the \
                unmineralized organic matrix of bone composed primarily of collagen fibers. When osteoid \
                calcifies, osteoblasts become trapped in lacunae and differentiate into osteocytes. \
                \
                Osteocytes are the most abundant bone cells. They are mature bone cells residing in lacunae \
                and connected by cytoplasmic extensions through the canaliculi. Osteocytes maintain the \
                mineralized matrix by sensing mechanical stress (mechanotransduction) and signaling \
                osteoblasts and osteoclasts to remodel bone accordingly. They play a critical role in \
                calcium and phosphate homeostasis. \
                \
                Osteoclasts are large, multinucleated cells derived from monocyte/macrophage lineage. They \
                reside on bone surfaces in shallow depressions called Howship's lacunae (resorption bays). \
                Osteoclasts break down (resorb) bone tissue by secreting hydrochloric acid (to dissolve \
                minerals) and lysosomal enzymes (to digest collagen). This process releases calcium and \
                phosphate into the blood. The balanced activity of osteoblasts (building) and osteoclasts \
                (breaking down) is essential for bone remodeling and calcium homeostasis.
                """,
                keyTerms: [
                    KeyTerm(id: "l12s3-k1", term: "Osteoblasts", definition: "Bone-building cells that synthesize and secrete osteoid (organic bone matrix). Found on bone surfaces. When trapped in matrix, they become osteocytes."),
                    KeyTerm(id: "l12s3-k2", term: "Osteocytes", definition: "Mature bone cells trapped in lacunae; the most abundant bone cell type. Maintain the matrix and sense mechanical stress to regulate remodeling."),
                    KeyTerm(id: "l12s3-k3", term: "Osteoclasts", definition: "Large, multinucleated cells that resorb (break down) bone by secreting acid and enzymes. Derived from the monocyte/macrophage lineage. Release calcium into the blood."),
                    KeyTerm(id: "l12s3-k4", term: "Osteoid", definition: "The unmineralized organic component of bone matrix, composed primarily of collagen fibers, secreted by osteoblasts before calcification.")
                ],
                testablesFacts: [
                    "Osteoblasts build bone by secreting osteoid; when trapped in the matrix they become osteocytes.",
                    "Osteocytes are the most abundant bone cells and reside in lacunae; they sense mechanical stress.",
                    "Osteoclasts are large, multinucleated cells that resorb bone by secreting HCl and lysosomal enzymes.",
                    "Osteoclasts are derived from monocyte/macrophage lineage (not from osteoblasts).",
                    "The balance of osteoblast and osteoclast activity is critical for bone remodeling and calcium homeostasis."
                ]
            ),
            LessonSection(
                id: "l12-s4",
                heading: "Bone Formation and Remodeling",
                content: """
                Bone develops by two processes. Intramembranous ossification forms bone directly from \
                mesenchymal (embryonic connective) tissue without a cartilage precursor. Mesenchymal cells \
                cluster and differentiate into osteoblasts, which secrete osteoid that calcifies to form \
                bone. This process forms the flat bones of the skull, the mandible, and the clavicle. \
                \
                Endochondral ossification forms bone by replacing a hyaline cartilage model. A cartilage \
                template forms first; then a bone collar develops around the diaphysis, and a primary \
                ossification center forms in the center of the diaphysis as blood vessels invade, bringing \
                osteoblasts. Bone replaces cartilage from the center outward. Secondary ossification \
                centers later develop in the epiphyses. The epiphyseal plate (growth plate) remains \
                between the diaphysis and epiphysis, allowing longitudinal growth until puberty when \
                increasing sex hormones cause the plate to ossify into the epiphyseal line. Most bones \
                of the body form by endochondral ossification. \
                \
                Bone remodeling is a continuous process in which osteoclasts resorb old or damaged bone \
                and osteoblasts deposit new bone. Remodeling responds to mechanical stress (Wolff's law: \
                bone grows thicker and stronger where stress is greatest) and hormonal signals. Parathyroid \
                hormone (PTH) stimulates osteoclast activity to raise blood calcium; calcitonin (from the \
                thyroid) inhibits osteoclasts to lower blood calcium. Vitamin D promotes calcium absorption \
                from the intestines and is essential for proper bone mineralization. \
                \
                Fracture repair occurs in stages: (1) hematoma formation — blood clot at the break site; \
                (2) fibrocartilaginous callus — fibroblasts and chondroblasts bridge the gap with collagen \
                and cartilage; (3) bony (hard) callus — osteoblasts replace cartilage with spongy bone; \
                (4) bone remodeling — osteoclasts and osteoblasts reshape the bone to its original form.
                """,
                keyTerms: [
                    KeyTerm(id: "l12s4-k1", term: "Intramembranous Ossification", definition: "Bone formation directly from mesenchymal tissue without a cartilage model. Forms flat bones of the skull, mandible, and clavicle."),
                    KeyTerm(id: "l12s4-k2", term: "Endochondral Ossification", definition: "Bone formation by replacing a hyaline cartilage model. Forms most bones of the body. Begins at a primary ossification center in the diaphysis."),
                    KeyTerm(id: "l12s4-k3", term: "Epiphyseal Plate", definition: "The growth plate of hyaline cartilage between the metaphysis and epiphysis; allows long bones to grow in length. Ossifies at puberty into the epiphyseal line."),
                    KeyTerm(id: "l12s4-k4", term: "Wolff's Law", definition: "The principle that bone grows stronger and thicker in areas subjected to greater mechanical stress."),
                    KeyTerm(id: "l12s4-k5", term: "Parathyroid Hormone (PTH)", definition: "Hormone that stimulates osteoclast activity, increasing bone resorption and raising blood calcium levels."),
                    KeyTerm(id: "l12s4-k6", term: "Calcitonin", definition: "Hormone from the thyroid gland that inhibits osteoclast activity, promoting calcium deposition in bone and lowering blood calcium.")
                ],
                testablesFacts: [
                    "Intramembranous ossification forms bone directly from mesenchyme (no cartilage model) — forms flat skull bones, mandible, clavicle.",
                    "Endochondral ossification replaces a hyaline cartilage model with bone — forms most body bones.",
                    "The epiphyseal plate allows longitudinal growth; it ossifies into the epiphyseal line at puberty.",
                    "Wolff's law: bone strengthens where stress is applied; weakens where stress is absent.",
                    "PTH raises blood calcium (stimulates osteoclasts); calcitonin lowers blood calcium (inhibits osteoclasts).",
                    "Fracture repair stages: hematoma → fibrocartilaginous callus → bony callus → remodeling."
                ]
            )
        ],
        clinicalApplication: ClinicalApplication(
            title: "Fracture Types for EMTs",
            scenario: "EMTs encounter various fracture types in the field. A greenstick fracture is an incomplete break common in children — the bone bends and cracks on one side like a green twig. A comminuted fracture shatters the bone into three or more fragments, often from high-energy trauma. A spiral fracture results from a twisting force and wraps around the bone shaft; it can indicate torsional injury. A compound (open) fracture is especially dangerous because the bone penetrates through the skin, creating a risk of infection, hemorrhage, and fat embolism. A transverse fracture crosses the bone at a right angle to its long axis, while an oblique fracture crosses at an angle.",
            connection: "EMTs must immobilize fractures to prevent further injury (splinting above and below the injury). Compound fractures require sterile dressing over the wound before splinting — never push a protruding bone back in. Assessing distal circulation, sensation, and movement (CSM) before and after splinting is essential. Femur fractures can cause life-threatening blood loss (up to 1-2 liters into the thigh), requiring rapid transport and traction splints."
        )
    )

    // =========================================================================
    // MARK: - LESSON 13: Skeletal System
    // =========================================================================

    static let lesson13 = Lesson(
        id: "lesson-13",
        weekNumber: 8,
        classNumber: 13,
        title: "Skeletal System",
        subtitle: "Axial and appendicular skeleton: skull, vertebral column, thoracic cage, and limbs",
        textbookChapter: "Chapters 7-8",
        textbookSections: "7.1 - 7.7, 8.1 - 8.5",
        sections: [
            LessonSection(
                id: "l13-s1",
                heading: "Axial Skeleton: Skull",
                content: """
                The adult skeleton has 206 bones divided into the axial skeleton (80 bones) and the \
                appendicular skeleton (126 bones). The axial skeleton forms the central axis: skull, \
                vertebral column, and thoracic cage. \
                \
                The skull has 22 bones: 8 cranial bones and 14 facial bones. The cranial bones form the \
                cranium, which protects the brain. The frontal bone forms the forehead and the superior \
                part of the orbit. The two parietal bones form most of the superior and lateral walls of \
                the cranium. The two temporal bones form the inferolateral cranium and house the middle \
                and inner ear structures; the mastoid process (a bony projection behind the ear) serves \
                as a muscle attachment site. The occipital bone forms the posterior and inferior cranium \
                and contains the foramen magnum, the large opening through which the spinal cord connects \
                to the brainstem. The sphenoid bone is a butterfly-shaped bone in the middle of the skull \
                base that articulates with nearly every other cranial bone; it contains the sella turcica, \
                which houses the pituitary gland. The ethmoid bone lies between the orbits and forms part \
                of the nasal septum, the medial orbital walls, and the superior nasal conchae; its \
                cribriform plate allows olfactory nerves to pass from the nasal cavity to the brain. \
                \
                Sutures are immovable fibrous joints between skull bones. The four major sutures are: \
                the coronal suture (between the frontal and parietal bones), the sagittal suture (between \
                the two parietal bones), the lambdoid suture (between the parietal bones and the occipital \
                bone), and the squamous suture (between the temporal and parietal bones). In infants, \
                fontanelles (soft spots) are membrane-filled spaces between cranial bones that allow the \
                skull to compress during birth and accommodate brain growth.
                """,
                keyTerms: [
                    KeyTerm(id: "l13s1-k1", term: "Frontal Bone", definition: "Forms the forehead and superior part of the orbit."),
                    KeyTerm(id: "l13s1-k2", term: "Parietal Bones", definition: "Paired bones forming most of the superior and lateral cranial walls."),
                    KeyTerm(id: "l13s1-k3", term: "Temporal Bones", definition: "Paired bones forming the inferolateral cranium; house the middle and inner ear. Feature the mastoid process."),
                    KeyTerm(id: "l13s1-k4", term: "Occipital Bone", definition: "Forms the posterior and inferior cranium; contains the foramen magnum through which the spinal cord passes."),
                    KeyTerm(id: "l13s1-k5", term: "Sphenoid Bone", definition: "Butterfly-shaped bone at the skull base; articulates with nearly every cranial bone. Contains the sella turcica (houses the pituitary gland)."),
                    KeyTerm(id: "l13s1-k6", term: "Ethmoid Bone", definition: "Lies between the orbits; contributes to the nasal septum, medial orbital walls, and contains the cribriform plate for olfactory nerves."),
                    KeyTerm(id: "l13s1-k7", term: "Foramen Magnum", definition: "The large opening in the occipital bone through which the spinal cord connects to the brainstem."),
                    KeyTerm(id: "l13s1-k8", term: "Suture", definition: "An immovable fibrous joint between skull bones. Major sutures: coronal, sagittal, lambdoid, squamous.")
                ],
                testablesFacts: [
                    "The skull has 22 bones: 8 cranial and 14 facial bones.",
                    "The 8 cranial bones are: frontal (1), parietal (2), temporal (2), occipital (1), sphenoid (1), ethmoid (1).",
                    "The foramen magnum is in the occipital bone — the spinal cord passes through it.",
                    "The sphenoid contains the sella turcica, which houses the pituitary gland.",
                    "The four major sutures are: coronal, sagittal, lambdoid, and squamous.",
                    "Fontanelles in infants are membrane-filled spaces that allow skull compression during birth."
                ]
            ),
            LessonSection(
                id: "l13-s2",
                heading: "Axial Skeleton: Vertebral Column",
                content: """
                The vertebral column (spine) consists of 26 bones: 7 cervical vertebrae (C1-C7), \
                12 thoracic vertebrae (T1-T12), 5 lumbar vertebrae (L1-L5), the sacrum (5 fused \
                vertebrae), and the coccyx (3-5 fused vertebrae, the tailbone). The spine has four \
                curves: cervical (lordosis — concave posteriorly), thoracic (kyphosis — convex posteriorly), \
                lumbar (lordosis), and sacral (kyphosis). These curves increase the spine's strength, \
                flexibility, and shock absorption. \
                \
                A typical vertebra has a vertebral body (anterior weight-bearing portion), a vertebral \
                arch (posterior), and a vertebral foramen (the opening that forms the vertebral canal \
                housing the spinal cord). Processes project from the arch: the spinous process projects \
                posteriorly (what you feel running down someone's back), two transverse processes project \
                laterally, and articular processes (superior and inferior) form joints with adjacent \
                vertebrae. \
                \
                The first cervical vertebra is the atlas (C1); it has no body and no spinous process. \
                It supports the skull and allows the nodding (yes) motion of the head (atlanto-occipital \
                joint). The second cervical vertebra is the axis (C2); it has a unique projection called \
                the dens (odontoid process) that projects upward into the atlas. The atlas rotates around \
                the dens, allowing the head-shaking (no) motion (atlanto-axial joint). Cervical vertebrae \
                have transverse foramina for vertebral arteries. Thoracic vertebrae articulate with ribs \
                and have long, inferiorly-angled spinous processes. Lumbar vertebrae are the largest and \
                strongest, supporting the most body weight. \
                \
                Intervertebral discs are pads of fibrocartilage between adjacent vertebral bodies. Each \
                disc has a tough outer ring (annulus fibrosus) and a gel-like center (nucleus pulposus). \
                Discs absorb shock and allow flexibility. A herniated (slipped) disc occurs when the \
                nucleus pulposus protrudes through the annulus fibrosus and may compress a spinal nerve.
                """,
                keyTerms: [
                    KeyTerm(id: "l13s2-k1", term: "Atlas (C1)", definition: "The first cervical vertebra; has no body or spinous process. Supports the skull; allows nodding (yes) motion at the atlanto-occipital joint."),
                    KeyTerm(id: "l13s2-k2", term: "Axis (C2)", definition: "The second cervical vertebra; features the dens (odontoid process). Allows head rotation (no motion) at the atlanto-axial joint."),
                    KeyTerm(id: "l13s2-k3", term: "Intervertebral Disc", definition: "A pad of fibrocartilage between vertebral bodies with a tough outer annulus fibrosus and gel-like inner nucleus pulposus. Absorbs shock and allows movement."),
                    KeyTerm(id: "l13s2-k4", term: "Vertebral Foramen", definition: "The opening in a vertebra through which the spinal cord passes; the series of foramina forms the vertebral (spinal) canal."),
                    KeyTerm(id: "l13s2-k5", term: "Sacrum", definition: "Five fused vertebrae forming the posterior wall of the pelvis; articulates with the hip bones at the sacroiliac joints.")
                ],
                testablesFacts: [
                    "The vertebral column has 7 cervical, 12 thoracic, 5 lumbar, 1 sacrum (5 fused), and 1 coccyx (3-5 fused) — 26 bones total.",
                    "C1 (atlas) supports the skull; allows nodding. C2 (axis) has the dens; allows head rotation.",
                    "Cervical vertebrae have transverse foramina; thoracic vertebrae articulate with ribs; lumbar vertebrae are the largest.",
                    "Intervertebral discs: annulus fibrosus (outer ring) + nucleus pulposus (gel center).",
                    "A herniated disc occurs when the nucleus pulposus protrudes and may compress a spinal nerve.",
                    "The four spinal curves are: cervical lordosis, thoracic kyphosis, lumbar lordosis, sacral kyphosis."
                ]
            ),
            LessonSection(
                id: "l13-s3",
                heading: "Axial Skeleton: Thoracic Cage",
                content: """
                The thoracic cage (rib cage) consists of the sternum, 12 pairs of ribs, and the 12 \
                thoracic vertebrae. It protects the heart, lungs, and great vessels, and supports the \
                muscles of respiration. \
                \
                The sternum (breastbone) has three parts: the manubrium (superior portion; articulates \
                with the clavicles and the first two pairs of ribs), the body (middle portion; ribs 2-7 \
                attach here), and the xiphoid process (the small inferior projection; made of cartilage \
                in young people, ossifies with age). The sternal angle (angle of Louis) is the junction \
                between the manubrium and body; it marks the level of the second rib and is a palpable \
                landmark used in clinical practice. The xiphoid process is an important CPR landmark — \
                improper hand placement over the xiphoid can cause it to fracture and lacerate the liver. \
                \
                There are 12 pairs of ribs. True ribs (ribs 1-7) attach directly to the sternum via \
                their own costal cartilage. False ribs (ribs 8-10) attach to the sternum indirectly \
                through the costal cartilage of rib 7. Floating ribs (ribs 11-12) have no anterior \
                attachment to the sternum at all. All ribs articulate posteriorly with the thoracic \
                vertebrae. Each rib has a head, neck, tubercle, and body (shaft); the costal groove on \
                the inferior internal surface shelters the intercostal vein, artery, and nerve (VAN, \
                from superior to inferior).
                """,
                keyTerms: [
                    KeyTerm(id: "l13s3-k1", term: "Manubrium", definition: "The superior portion of the sternum; articulates with the clavicles and the first two pairs of ribs."),
                    KeyTerm(id: "l13s3-k2", term: "Xiphoid Process", definition: "The small inferior projection of the sternum. Important CPR landmark — hand placement must be above it to avoid liver laceration."),
                    KeyTerm(id: "l13s3-k3", term: "True Ribs", definition: "Ribs 1-7; each attaches directly to the sternum via its own costal cartilage."),
                    KeyTerm(id: "l13s3-k4", term: "False Ribs", definition: "Ribs 8-10; attach to the sternum indirectly through the costal cartilage of rib 7."),
                    KeyTerm(id: "l13s3-k5", term: "Floating Ribs", definition: "Ribs 11-12; have no anterior attachment to the sternum."),
                    KeyTerm(id: "l13s3-k6", term: "Sternal Angle", definition: "The junction between the manubrium and body of the sternum; marks the level of the second rib. Also called the angle of Louis.")
                ],
                testablesFacts: [
                    "The sternum has three parts: manubrium (superior), body (middle), xiphoid process (inferior).",
                    "The sternal angle (angle of Louis) marks the junction of manubrium and body — palpable landmark at rib 2.",
                    "True ribs (1-7) attach directly to the sternum; false ribs (8-10) attach indirectly; floating ribs (11-12) have no sternal attachment.",
                    "The xiphoid process is a critical CPR landmark — hands go above it, not on it.",
                    "The costal groove on the inferior rib surface shelters the intercostal vein, artery, and nerve (VAN)."
                ]
            ),
            LessonSection(
                id: "l13-s4",
                heading: "Appendicular Skeleton Overview",
                content: """
                The appendicular skeleton (126 bones) consists of the bones of the upper and lower \
                limbs and the girdles that attach them to the axial skeleton. \
                \
                The pectoral (shoulder) girdle consists of the clavicle (collarbone) and the scapula \
                (shoulder blade) on each side. The clavicle articulates medially with the manubrium of \
                the sternum and laterally with the acromion of the scapula. The clavicle is the most \
                frequently fractured bone in the body. The scapula is a flat, triangular bone on the \
                posterior thorax; its key landmarks include the spine, acromion (the lateral projection \
                that forms the tip of the shoulder), coracoid process, and glenoid cavity (the shallow \
                socket for the head of the humerus). \
                \
                The upper limb consists of the humerus (arm), radius and ulna (forearm), carpals (8 wrist \
                bones), metacarpals (5 palm bones), and phalanges (14 finger bones). The radius is lateral \
                (thumb side) and the ulna is medial (pinky side). The olecranon of the ulna forms the \
                point of the elbow. \
                \
                The pelvic girdle consists of two hip bones (os coxae), each formed by three fused bones: \
                the ilium (superior, broad), ischium (posteroinferior — you sit on the ischial tuberosities), \
                and pubis (anterior). The two hip bones articulate anteriorly at the pubic symphysis and \
                posteriorly with the sacrum at the sacroiliac joints. Together with the sacrum and coccyx, \
                they form the bony pelvis. \
                \
                The lower limb consists of the femur (thigh — the longest, strongest bone), patella \
                (kneecap — largest sesamoid bone), tibia and fibula (leg), tarsals (7 ankle bones, \
                including the talus and calcaneus/heel bone), metatarsals (5), and phalanges (14 toe \
                bones). The tibia is the weight-bearing medial bone of the leg; the fibula is the \
                thin lateral bone that does not bear weight but provides muscle attachment.
                """,
                keyTerms: [
                    KeyTerm(id: "l13s4-k1", term: "Clavicle", definition: "The collarbone; articulates with the manubrium and scapula. The most frequently fractured bone in the body."),
                    KeyTerm(id: "l13s4-k2", term: "Scapula", definition: "The shoulder blade; a flat, triangular bone. Key features: spine, acromion, coracoid process, glenoid cavity."),
                    KeyTerm(id: "l13s4-k3", term: "Humerus", definition: "The bone of the arm (upper limb between shoulder and elbow)."),
                    KeyTerm(id: "l13s4-k4", term: "Femur", definition: "The thighbone; the longest and strongest bone in the body."),
                    KeyTerm(id: "l13s4-k5", term: "Patella", definition: "The kneecap; the largest sesamoid bone. Embedded in the quadriceps tendon."),
                    KeyTerm(id: "l13s4-k6", term: "Tibia", definition: "The shinbone; the large, weight-bearing medial bone of the leg."),
                    KeyTerm(id: "l13s4-k7", term: "Fibula", definition: "The thin, lateral bone of the leg; does not bear weight but provides lateral stability and muscle attachment.")
                ],
                testablesFacts: [
                    "The pectoral girdle consists of the clavicle and scapula on each side.",
                    "The clavicle is the most frequently fractured bone in the body.",
                    "The glenoid cavity of the scapula is the socket for the shoulder joint.",
                    "The femur is the longest, strongest bone in the body.",
                    "The tibia is the weight-bearing bone of the leg (medial); the fibula is lateral and non-weight-bearing.",
                    "The pelvic girdle consists of two hip bones, each formed by the fused ilium, ischium, and pubis.",
                    "You sit on the ischial tuberosities of the ischium."
                ]
            )
        ],
        clinicalApplication: ClinicalApplication(
            title: "Spinal Immobilization & Rib Fractures for EMTs",
            scenario: "Cervical spine injuries can damage the spinal cord and cause paralysis or death. Any trauma patient with a mechanism of injury involving the head, neck, or back — such as a motor vehicle collision, fall from height, or diving injury — must be assessed for spinal injury. Rib fractures are common in blunt chest trauma; fractures of ribs 4-9 are most common because they are the most exposed. A flail chest occurs when three or more adjacent ribs are each fractured in two places, creating a free-floating segment that moves paradoxically during breathing (inward on inspiration). Lower rib fractures (ribs 10-12) raise suspicion for liver (right) or spleen (left) injury.",
            connection: "EMTs apply cervical spine motion restriction (C-collar, head blocks, backboard) when spinal injury is suspected. The key principle is to maintain the cervical spine in a neutral, in-line position and avoid flexion, extension, or rotation. For rib fractures, EMTs assess for respiratory distress, monitor oxygen saturation, provide supplemental oxygen, and position the patient for comfort (usually sitting upright on the injured side). Flail chest is a life-threatening emergency requiring positive-pressure ventilation."
        )
    )

    // =========================================================================
    // MARK: - QUIZ: Weeks 7-8 Review (Bone Tissue & Skeletal System)
    // =========================================================================

    static let quizWeeks7_8 = Quiz(
        id: "quiz-weeks7-8",
        title: "Weeks 7-8 Review: Bone Tissue & Skeletal System",
        weekNumber: 8,
        lessonIds: ["lesson-12", "lesson-13"],
        questions: [
            // Q1 - Easy / Recall
            QuizQuestion(
                id: "w7-q01",
                question: "What are the five classifications of bones by shape?",
                choices: [
                    "Long, short, flat, irregular, sesamoid",
                    "Compact, spongy, cancellous, cortical, trabecular",
                    "Cranial, facial, axial, appendicular, sesamoid",
                    "Dense, loose, cartilage, bone, blood"
                ],
                correctIndex: 0,
                explanation: "Bones are classified by shape into five categories: long (femur), short (carpals), flat (sternum), irregular (vertebrae), and sesamoid (patella).",
                difficulty: .easy,
                category: .recall
            ),
            // Q2 - Easy / Recall
            QuizQuestion(
                id: "w7-q02",
                question: "Which bone cell type is responsible for building new bone by secreting osteoid?",
                choices: [
                    "Osteocyte",
                    "Osteoclast",
                    "Osteoblast",
                    "Chondroblast"
                ],
                correctIndex: 2,
                explanation: "Osteoblasts are bone-building cells that synthesize and secrete osteoid (the organic bone matrix). When trapped in the matrix they become osteocytes.",
                difficulty: .easy,
                category: .recall
            ),
            // Q3 - Easy / Recall
            QuizQuestion(
                id: "w7-q03",
                question: "What is the structural unit of compact bone?",
                choices: [
                    "Trabecula",
                    "Osteon (Haversian system)",
                    "Lamella",
                    "Lacuna"
                ],
                correctIndex: 1,
                explanation: "The osteon (Haversian system) is the structural unit of compact bone, consisting of concentric lamellae around a central (Haversian) canal.",
                difficulty: .easy,
                category: .recall
            ),
            // Q4 - Easy / Recall
            QuizQuestion(
                id: "w7-q04",
                question: "How many bones are in the adult human skeleton?",
                choices: [
                    "186",
                    "196",
                    "206",
                    "216"
                ],
                correctIndex: 2,
                explanation: "The adult human skeleton has 206 bones: 80 in the axial skeleton and 126 in the appendicular skeleton.",
                difficulty: .easy,
                category: .recall
            ),
            // Q5 - Easy / Recall
            QuizQuestion(
                id: "w7-q05",
                question: "Which bone contains the foramen magnum?",
                choices: [
                    "Frontal bone",
                    "Sphenoid bone",
                    "Temporal bone",
                    "Occipital bone"
                ],
                correctIndex: 3,
                explanation: "The foramen magnum is a large opening in the occipital bone through which the spinal cord passes to connect with the brainstem.",
                difficulty: .easy,
                category: .recall
            ),
            // Q6 - Easy / Recall
            QuizQuestion(
                id: "w7-q06",
                question: "What are the three parts of the sternum (from superior to inferior)?",
                choices: [
                    "Body, xiphoid process, manubrium",
                    "Manubrium, body, xiphoid process",
                    "Xiphoid process, body, manubrium",
                    "Manubrium, xiphoid process, body"
                ],
                correctIndex: 1,
                explanation: "The sternum has three parts from superior to inferior: manubrium (articulates with clavicles), body (middle), and xiphoid process (small inferior projection).",
                difficulty: .easy,
                category: .recall
            ),
            // Q7 - Easy / Recall
            QuizQuestion(
                id: "w7-q07",
                question: "How many cervical vertebrae are in the human vertebral column?",
                choices: [
                    "5",
                    "7",
                    "12",
                    "33"
                ],
                correctIndex: 1,
                explanation: "There are 7 cervical vertebrae (C1-C7). Remember: 7 cervical, 12 thoracic, 5 lumbar, plus the sacrum and coccyx.",
                difficulty: .easy,
                category: .recall
            ),
            // Q8 - Easy / Recall
            QuizQuestion(
                id: "w7-q08",
                question: "Which bone is the most frequently fractured bone in the body?",
                choices: [
                    "Femur",
                    "Radius",
                    "Clavicle",
                    "Humerus"
                ],
                correctIndex: 2,
                explanation: "The clavicle (collarbone) is the most frequently fractured bone in the body, often from falls onto an outstretched hand or direct shoulder impact.",
                difficulty: .easy,
                category: .recall
            ),
            // Q9 - Medium / Application
            QuizQuestion(
                id: "w7-q09",
                question: "A child's long bone grows in length at which structure?",
                choices: [
                    "Periosteum",
                    "Endosteum",
                    "Epiphyseal plate",
                    "Articular cartilage"
                ],
                correctIndex: 2,
                explanation: "The epiphyseal (growth) plate is a layer of hyaline cartilage between the metaphysis and epiphysis that allows longitudinal bone growth. It ossifies at puberty.",
                difficulty: .medium,
                category: .application
            ),
            // Q10 - Medium / Application
            QuizQuestion(
                id: "w7-q10",
                question: "A patient's blood calcium is dangerously low. Which hormone would the body release to correct this?",
                choices: [
                    "Calcitonin",
                    "Parathyroid hormone (PTH)",
                    "Insulin",
                    "Growth hormone"
                ],
                correctIndex: 1,
                explanation: "Parathyroid hormone (PTH) is released when blood calcium is low. PTH stimulates osteoclasts to resorb bone, releasing calcium into the blood. Calcitonin does the opposite — it lowers blood calcium.",
                difficulty: .medium,
                category: .application
            ),
            // Q11 - Medium / Application
            QuizQuestion(
                id: "w7-q11",
                question: "The atlas (C1) allows which type of head movement?",
                choices: [
                    "Rotation (shaking 'no')",
                    "Nodding (saying 'yes')",
                    "Lateral flexion (ear to shoulder)",
                    "Extension (looking up)"
                ],
                correctIndex: 1,
                explanation: "The atlas (C1) articulates with the occipital condyles of the skull at the atlanto-occipital joint, allowing the nodding (yes) motion. Head rotation (no) occurs at the atlanto-axial joint between C1 and C2 (axis).",
                difficulty: .medium,
                category: .application
            ),
            // Q12 - Medium / Application
            QuizQuestion(
                id: "w7-q12",
                question: "Red bone marrow, the site of hematopoiesis, is primarily found in which type of bone tissue?",
                choices: [
                    "Compact bone within osteons",
                    "The periosteum",
                    "Spongy bone between trabeculae",
                    "The medullary cavity of the diaphysis"
                ],
                correctIndex: 2,
                explanation: "Red bone marrow fills the spaces between trabeculae in spongy bone. In adults, red marrow is found in the epiphyses of long bones and in flat/irregular bones (sternum, pelvis, vertebrae).",
                difficulty: .medium,
                category: .application
            ),
            // Q13 - Medium / Analysis
            QuizQuestion(
                id: "w7-q13",
                question: "Which type of ossification forms the flat bones of the skull?",
                choices: [
                    "Endochondral ossification",
                    "Intramembranous ossification",
                    "Appositional growth",
                    "Interstitial growth"
                ],
                correctIndex: 1,
                explanation: "Intramembranous ossification forms bone directly from mesenchymal tissue without a cartilage model. It produces the flat bones of the skull, the mandible, and the clavicle. Endochondral ossification replaces a cartilage model and forms most other bones.",
                difficulty: .medium,
                category: .analysis
            ),
            // Q14 - Medium / Application
            QuizQuestion(
                id: "w7-q14",
                question: "Ribs 8-10 are classified as false ribs because they:",
                choices: [
                    "Have no posterior attachment to vertebrae",
                    "Attach to the sternum indirectly through the costal cartilage of rib 7",
                    "Have no anterior attachment to the sternum at all",
                    "Are made entirely of cartilage"
                ],
                correctIndex: 1,
                explanation: "False ribs (8-10) attach to the sternum indirectly — their costal cartilage connects to the cartilage of rib 7 rather than directly to the sternum. Floating ribs (11-12) have no sternal attachment at all.",
                difficulty: .medium,
                category: .application
            ),
            // Q15 - Hard / Analysis
            QuizQuestion(
                id: "w7-q15",
                question: "Canaliculi in compact bone are important because they:",
                choices: [
                    "Contain red bone marrow for blood cell production",
                    "Serve as channels for blood vessels to enter the bone",
                    "Connect osteocytes to each other and to the central canal for nutrient exchange",
                    "Produce osteoid for new bone formation"
                ],
                correctIndex: 2,
                explanation: "Canaliculi are tiny channels that radiate from each lacuna, connecting osteocytes to neighboring osteocytes and to the central (Haversian) canal. This network allows diffusion of nutrients and waste, which is essential because osteocytes are embedded in hard, calcified matrix.",
                difficulty: .hard,
                category: .analysis
            ),
            // Q16 - Hard / Analysis
            QuizQuestion(
                id: "w7-q16",
                question: "According to Wolff's law, what would happen to the bones of an astronaut who spends months in microgravity?",
                choices: [
                    "Bones would become denser due to increased osteoblast activity",
                    "Bones would lose density because reduced mechanical stress decreases bone deposition",
                    "Bones would remain unchanged because bone remodeling is purely hormonal",
                    "Only flat bones would be affected; long bones would stay the same"
                ],
                correctIndex: 1,
                explanation: "Wolff's law states that bone grows thicker where stress is applied and weakens where stress is absent. In microgravity, reduced mechanical loading means less stimulation for bone deposition, leading to bone density loss — a major health concern for astronauts.",
                difficulty: .hard,
                category: .analysis
            ),
            // Q17 - Hard / Analysis
            QuizQuestion(
                id: "w7-q17",
                question: "During endochondral ossification, the PRIMARY ossification center forms in which location?",
                choices: [
                    "The epiphysis",
                    "The center of the diaphysis",
                    "The epiphyseal plate",
                    "The periosteum"
                ],
                correctIndex: 1,
                explanation: "In endochondral ossification, the primary ossification center forms in the center of the diaphysis when blood vessels invade the cartilage model and bring osteoblasts. Secondary ossification centers form later in the epiphyses.",
                difficulty: .hard,
                category: .analysis
            ),
            // Q18 - Hard / Analysis
            QuizQuestion(
                id: "w7-q18",
                question: "The sphenoid bone is clinically significant because it:",
                choices: [
                    "Contains the foramen magnum",
                    "Forms the entire nasal septum",
                    "Contains the sella turcica, which houses the pituitary gland",
                    "Forms the superior wall of the orbit only"
                ],
                correctIndex: 2,
                explanation: "The sphenoid is a butterfly-shaped bone at the skull base that contains the sella turcica ('Turkish saddle'), a depression that houses and protects the pituitary gland. It articulates with nearly every other cranial bone.",
                difficulty: .hard,
                category: .analysis
            ),
            // Q19 - Clinical
            QuizQuestion(
                id: "w7-q19",
                question: "An EMT arrives at the scene of a motorcycle accident. The patient has a bone protruding through the skin of the forearm. What type of fracture is this, and what is the EMT's priority?",
                choices: [
                    "Greenstick fracture — apply a traction splint",
                    "Comminuted fracture — push the bone back in and splint",
                    "Compound (open) fracture — cover with sterile dressing, splint, never push the bone back in",
                    "Spiral fracture — apply ice and elevate"
                ],
                correctIndex: 2,
                explanation: "A compound (open) fracture means the bone has broken through the skin. EMTs must cover the wound with a sterile dressing, splint the fracture (above and below the injury), and NEVER attempt to push the bone back in. Infection and hemorrhage are major concerns.",
                difficulty: .hard,
                category: .clinical
            ),
            // Q20 - Clinical
            QuizQuestion(
                id: "w8-q20",
                question: "A trauma patient has fractures of ribs 5, 6, and 7 on the left side, each broken in two places. The patient is in severe respiratory distress, and you notice a segment of the chest wall moving INWARD during inspiration. What is this condition?",
                choices: [
                    "Simple rib fracture",
                    "Pneumothorax",
                    "Flail chest",
                    "Hemothorax"
                ],
                correctIndex: 2,
                explanation: "Flail chest occurs when 3 or more adjacent ribs are each fractured in 2 or more places, creating a free-floating segment that moves paradoxically (inward on inspiration, outward on expiration). It is a life-threatening emergency requiring positive-pressure ventilation.",
                difficulty: .hard,
                category: .clinical
            )
        ],
        timeLimit: 1800  // 30 minutes
    )

    // =========================================================================
    // MARK: - FLASHCARD DECK: Bone Tissue & Structure
    // =========================================================================

    static let deckBoneTissue = FlashcardDeck(
        id: "deck-bone-tissue",
        title: "Bone Tissue & Structure",
        weekNumber: 7,
        category: "Bone Tissue",
        cards: [
            Flashcard(id: "w7-fc01", front: "Five Bone Classifications", back: "Long (femur, humerus), Short (carpals, tarsals), Flat (sternum, ribs, skull), Irregular (vertebrae, hip bones), Sesamoid (patella — embedded in tendons).", hint: "Think of one example for each shape", repetition: sr78),
            Flashcard(id: "w7-fc02", front: "Diaphysis vs Epiphysis", back: "Diaphysis = the cylindrical shaft of a long bone (compact bone + medullary cavity). Epiphysis = the expanded ends (spongy bone covered by compact bone + articular cartilage).", hint: "Dia = through (shaft); Epi = upon (ends)", repetition: sr78),
            Flashcard(id: "w7-fc03", front: "Periosteum", back: "Tough double-layered membrane covering the outer bone surface. Outer fibrous layer: anchors tendons/ligaments. Inner osteogenic layer: contains osteoblasts and osteoclasts for growth and repair.", hint: "Peri = around; osteum = bone", repetition: sr78),
            Flashcard(id: "w7-fc04", front: "Endosteum", back: "A thin membrane lining the internal surfaces of bone (medullary cavity, trabeculae). Contains osteoblasts and osteoclasts.", hint: "Endo = within", repetition: sr78),
            Flashcard(id: "w7-fc05", front: "Osteon (Haversian System)", back: "The structural unit of compact bone. Concentric lamellae surround a central (Haversian) canal containing blood vessels and nerves. Lacunae between lamellae house osteocytes connected by canaliculi.", hint: "Osteon = the bull's-eye target pattern", repetition: sr78),
            Flashcard(id: "w7-fc06", front: "Osteoblasts", back: "Bone-BUILDING cells found on bone surfaces. They secrete osteoid (organic matrix) which then calcifies. When trapped in the matrix, they become osteocytes.", hint: "Blast = build (like 'blastoff' = create)", repetition: sr78),
            Flashcard(id: "w7-fc07", front: "Osteocytes", back: "Mature bone cells trapped in lacunae. The most abundant bone cell. Maintain the matrix, sense mechanical stress, and signal remodeling.", hint: "Cyte = cell (mature, settled in)", repetition: sr78),
            Flashcard(id: "w7-fc08", front: "Osteoclasts", back: "Large, multinucleated cells that RESORB (break down) bone. Derived from monocyte/macrophage lineage. Secrete HCl and enzymes. Release calcium into the blood.", hint: "Clast = break (like 'iconoclast')", repetition: sr78),
            Flashcard(id: "w7-fc09", front: "Intramembranous vs Endochondral Ossification", back: "Intramembranous: bone forms directly from mesenchyme (no cartilage model) — flat skull bones, mandible, clavicle. Endochondral: bone replaces a hyaline cartilage model — most other bones.", hint: "Intra-membranous = in the membrane; Endo-chondral = within cartilage", repetition: sr78),
            Flashcard(id: "w7-fc10", front: "Epiphyseal Plate (Growth Plate)", back: "A disc of hyaline cartilage between the metaphysis and epiphysis allowing longitudinal bone growth. Ossifies into the epiphyseal LINE at puberty (growth stops).", hint: "Plate = still growing; Line = done growing", repetition: sr78),
            Flashcard(id: "w7-fc11", front: "Wolff's Law", back: "Bone grows thicker and stronger where mechanical stress is applied; it weakens where stress is absent. Explains why weight-bearing exercise strengthens bones and why astronauts lose bone density.", hint: "Use it or lose it", repetition: sr78),
            Flashcard(id: "w7-fc12", front: "PTH vs Calcitonin", back: "PTH (parathyroid hormone): raises blood calcium by stimulating osteoCLASTs to resorb bone. Calcitonin (thyroid): lowers blood calcium by inhibiting osteoclasts and promoting calcium deposition.", hint: "PTH = Pour The calcium Higher; CalciTONin = TONES it down", repetition: sr78),
            Flashcard(id: "w7-fc13", front: "Fracture Repair Stages", back: "1) Hematoma (blood clot). 2) Fibrocartilaginous callus (collagen + cartilage bridge). 3) Bony (hard) callus (osteoblasts deposit spongy bone). 4) Bone remodeling (compact bone replaces spongy).", hint: "Clot → soft patch → hard patch → reshape", repetition: sr78),
            Flashcard(id: "w7-fc14", front: "Volkmann's (Perforating) Canals", back: "Canals that run PERPENDICULAR to Haversian canals, connecting adjacent osteons and linking periosteal blood supply to endosteal blood supply.", hint: "Volkmann's = vertical (perpendicular) connections", repetition: sr78),
            Flashcard(id: "w7-fc15", front: "Fracture Types (EMT)", back: "Greenstick: incomplete, one side (children). Comminuted: shattered into 3+ fragments. Spiral: twisting force. Compound (open): bone through skin — infection risk. Transverse: straight across. Oblique: angled across.", hint: "Green = young tree bends; Compound = complicated/open", repetition: sr78)
        ]
    )

    // =========================================================================
    // MARK: - FLASHCARD DECK: Skeletal System Bones
    // =========================================================================

    static let deckSkeletalBones = FlashcardDeck(
        id: "deck-skeletal-bones",
        title: "Skeletal System Bones",
        weekNumber: 8,
        category: "Skeletal System",
        cards: [
            Flashcard(id: "w8-fc01", front: "8 Cranial Bones", back: "Frontal (1), Parietal (2), Temporal (2), Occipital (1), Sphenoid (1), Ethmoid (1). Total = 8. The cranium protects the brain.", hint: "1 Front, 2 Parietal Tops, 2 Temporal sides, 1 Occipital back, 1 Sphenoid base, 1 Ethmoid nose", repetition: sr78),
            Flashcard(id: "w8-fc02", front: "Foramen Magnum", back: "Large opening in the OCCIPITAL bone through which the spinal cord passes to connect with the brainstem.", hint: "Magnum = large; it's in the back bottom of the skull", repetition: sr78),
            Flashcard(id: "w8-fc03", front: "Sella Turcica", back: "A saddle-shaped depression in the SPHENOID bone that houses and protects the pituitary gland.", hint: "Turkish saddle sits on the butterfly bone", repetition: sr78),
            Flashcard(id: "w8-fc04", front: "Four Major Skull Sutures", back: "Coronal (frontal-parietal), Sagittal (parietal-parietal), Lambdoid (parietal-occipital), Squamous (temporal-parietal). Sutures are immovable fibrous joints.", hint: "Crown, arrow, lambda, scales", repetition: sr78),
            Flashcard(id: "w8-fc05", front: "Atlas (C1) and Axis (C2)", back: "Atlas (C1): no body, no spinous process; supports skull, allows NODDING (yes). Axis (C2): has the dens (odontoid process); allows HEAD ROTATION (no).", hint: "Atlas holds the world (skull); Axis = axle for rotation", repetition: sr78),
            Flashcard(id: "w8-fc06", front: "Vertebral Formula", back: "7 Cervical + 12 Thoracic + 5 Lumbar + Sacrum (5 fused) + Coccyx (3-5 fused) = 26 bones. Four curves: cervical & lumbar lordosis; thoracic & sacral kyphosis.", hint: "Breakfast 7, Lunch 12, Dinner 5 (7-12-5)", repetition: sr78),
            Flashcard(id: "w8-fc07", front: "Intervertebral Disc", back: "Fibrocartilage pad between vertebral bodies. Annulus fibrosus = tough outer ring. Nucleus pulposus = gel-like center. Herniation = nucleus protrudes through annulus, may compress spinal nerves.", hint: "Like a jelly donut — the jelly can squirt out", repetition: sr78),
            Flashcard(id: "w8-fc08", front: "Sternum: Three Parts", back: "Manubrium (superior — articulates with clavicles and ribs 1-2), Body (middle — ribs 2-7), Xiphoid process (inferior — CPR landmark, avoid pressing on it).", hint: "Top handle, middle body, bottom tip", repetition: sr78),
            Flashcard(id: "w8-fc09", front: "True, False, and Floating Ribs", back: "True ribs (1-7): attach directly to sternum via own costal cartilage. False ribs (8-10): attach indirectly through rib 7's cartilage. Floating ribs (11-12): no sternal attachment.", hint: "7 true, 3 false, 2 floating = 12 pairs", repetition: sr78),
            Flashcard(id: "w8-fc10", front: "Clavicle", back: "The collarbone; connects the upper limb to the axial skeleton. Articulates with the manubrium (medially) and the acromion of the scapula (laterally). MOST FREQUENTLY FRACTURED BONE.", hint: "The 'key' bone — clavis = key in Latin", repetition: sr78),
            Flashcard(id: "w8-fc11", front: "Scapula", back: "The shoulder blade — a flat, triangular bone. Key landmarks: spine, acromion (tip of shoulder), coracoid process, glenoid cavity (socket for humerus head).", hint: "The 'wing bone' on your back", repetition: sr78),
            Flashcard(id: "w8-fc12", front: "Femur", back: "The thighbone — the LONGEST and STRONGEST bone in the body. Proximal end: head (fits in acetabulum), neck, greater and lesser trochanters. Distal end: medial and lateral condyles.", hint: "The big one in your thigh", repetition: sr78),
            Flashcard(id: "w8-fc13", front: "Tibia vs Fibula", back: "Tibia = shinbone, MEDIAL, WEIGHT-BEARING. Fibula = thin lateral bone, non-weight-bearing, provides muscle attachment and lateral ankle stability.", hint: "Tibia is THICK (weight); Fibula is thin (fib = little lie)", repetition: sr78),
            Flashcard(id: "w8-fc14", front: "Pelvic Girdle: Three Fused Bones", back: "Each hip bone (os coxae) = ilium (superior, broad flare) + ischium (posteroinferior, you sit on the ischial tuberosities) + pubis (anterior, meets at pubic symphysis).", hint: "I Like Ice cream: Ilium, Ischium (sit), Pubis (front)", repetition: sr78),
            Flashcard(id: "w8-fc15", front: "Sternal Angle (Angle of Louis)", back: "The junction between the manubrium and body of the sternum. Palpable landmark that marks the level of the 2nd rib — used to count ribs and locate intercostal spaces for clinical procedures.", hint: "Feel the bump on your chest — that's rib 2", repetition: sr78)
        ]
    )
}
