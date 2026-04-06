import Foundation

struct ImageQuizData {

    // MARK: - All Questions

    static let allQuestions: [ImageQuestion] = bodyQuestions + cellQuestions + skinQuestions + boneQuestions + sarcomereQuestions + feedbackQuestions

    // MARK: - Body Planes & Regions (5 questions)

    static let bodyQuestions: [ImageQuestion] = [
        ImageQuestion(
            id: "img-body-1",
            diagramType: .bodyPlanes,
            highlightLabel: "sagittal plane",
            question: "Which anatomical plane is shown by the dashed line on this diagram?",
            choices: ["Frontal (coronal) plane", "Sagittal plane", "Transverse plane", "Oblique plane"],
            correctIndex: 1,
            explanation: "The sagittal plane runs vertically through the body, dividing it into left and right portions. A midsagittal (median) plane divides the body into equal left and right halves."
        ),
        ImageQuestion(
            id: "img-body-2",
            diagramType: .bodyPlanes,
            highlightLabel: "transverse plane",
            question: "Identify the anatomical plane indicated by the arrow.",
            choices: ["Sagittal plane", "Frontal plane", "Transverse plane", "Parasagittal plane"],
            correctIndex: 2,
            explanation: "The transverse (horizontal) plane divides the body into superior (upper) and inferior (lower) portions. It is perpendicular to the long axis of the body."
        ),
        ImageQuestion(
            id: "img-body-3",
            diagramType: .bodyCavities,
            highlightLabel: "thoracic cavity",
            question: "The arrow points to which body cavity?",
            choices: ["Abdominal cavity", "Pelvic cavity", "Thoracic cavity", "Cranial cavity"],
            correctIndex: 2,
            explanation: "The thoracic cavity is located in the chest region, superior to the diaphragm. It contains the heart, lungs, and major blood vessels."
        ),
        ImageQuestion(
            id: "img-body-4",
            diagramType: .bodyCavities,
            highlightLabel: "abdominal cavity",
            question: "Which body cavity is indicated by the red arrow?",
            choices: ["Thoracic cavity", "Pelvic cavity", "Abdominal cavity", "Spinal cavity"],
            correctIndex: 2,
            explanation: "The abdominal cavity lies between the diaphragm and the pelvis. It contains the stomach, liver, intestines, spleen, and kidneys."
        ),
        ImageQuestion(
            id: "img-body-5",
            diagramType: .bodyPlanes,
            highlightLabel: "frontal plane",
            question: "Which plane divides the body into anterior and posterior portions?",
            choices: ["Sagittal plane", "Transverse plane", "Frontal (coronal) plane", "Midsagittal plane"],
            correctIndex: 2,
            explanation: "The frontal (coronal) plane divides the body into anterior (front) and posterior (back) portions. It runs vertically from side to side."
        ),
    ]

    // MARK: - Cell Structure (4 questions)

    static let cellQuestions: [ImageQuestion] = [
        ImageQuestion(
            id: "img-cell-1",
            diagramType: .cellStructure,
            highlightLabel: "nucleus",
            question: "Identify the organelle indicated by the arrow.",
            choices: ["Mitochondrion", "Lysosome", "Nucleus", "Golgi apparatus"],
            correctIndex: 2,
            explanation: "The nucleus is the largest organelle and serves as the cell's control center. It contains DNA organized into chromosomes and is surrounded by a double membrane (nuclear envelope)."
        ),
        ImageQuestion(
            id: "img-cell-2",
            diagramType: .cellStructure,
            highlightLabel: "mitochondria",
            question: "The arrow points to which organelle?",
            choices: ["Rough ER", "Mitochondrion", "Lysosome", "Ribosome"],
            correctIndex: 1,
            explanation: "Mitochondria are the 'powerhouses' of the cell, producing ATP through cellular respiration. They have a double membrane with inner folds called cristae that increase surface area."
        ),
        ImageQuestion(
            id: "img-cell-3",
            diagramType: .cellStructure,
            highlightLabel: "golgi apparatus",
            question: "Which organelle is indicated by the arrow in this cell diagram?",
            choices: ["Smooth ER", "Golgi apparatus", "Nucleus", "Centriole"],
            correctIndex: 1,
            explanation: "The Golgi apparatus (Golgi body) modifies, packages, and sorts proteins received from the rough ER. It looks like a stack of flattened membranous sacs (cisternae)."
        ),
        ImageQuestion(
            id: "img-cell-4",
            diagramType: .cellStructure,
            highlightLabel: "rough er",
            question: "Identify the structure shown by the arrow near the nucleus.",
            choices: ["Smooth endoplasmic reticulum", "Rough endoplasmic reticulum", "Golgi apparatus", "Cell membrane"],
            correctIndex: 1,
            explanation: "The rough endoplasmic reticulum (rough ER) is studded with ribosomes, giving it a 'rough' appearance. It synthesizes proteins destined for membranes, secretion, or lysosomes."
        ),
    ]

    // MARK: - Skin Layers (4 questions)

    static let skinQuestions: [ImageQuestion] = [
        ImageQuestion(
            id: "img-skin-1",
            diagramType: .skinLayers,
            highlightLabel: "epidermis",
            question: "Which layer of skin is indicated by the arrow?",
            choices: ["Dermis", "Hypodermis", "Epidermis", "Subcutaneous fascia"],
            correctIndex: 2,
            explanation: "The epidermis is the outermost layer of skin. It is composed of stratified squamous epithelium and contains keratinocytes, melanocytes, and Langerhans cells. It has no blood vessels (avascular)."
        ),
        ImageQuestion(
            id: "img-skin-2",
            diagramType: .skinLayers,
            highlightLabel: "dermis",
            question: "The arrow points to which skin layer in this cross-section?",
            choices: ["Epidermis", "Dermis", "Hypodermis", "Stratum basale"],
            correctIndex: 1,
            explanation: "The dermis lies beneath the epidermis and contains blood vessels, nerve endings, hair follicles, sweat glands, and collagen fibers. It has two sublayers: the papillary and reticular dermis."
        ),
        ImageQuestion(
            id: "img-skin-3",
            diagramType: .skinLayers,
            highlightLabel: "hypodermis",
            question: "Identify the layer indicated by the arrow at the base of this skin diagram.",
            choices: ["Dermis", "Epidermis", "Hypodermis (subcutaneous layer)", "Reticular layer"],
            correctIndex: 2,
            explanation: "The hypodermis (subcutaneous layer) lies deep to the dermis. It is primarily composed of adipose tissue (fat) and serves as insulation, energy storage, and cushioning."
        ),
        ImageQuestion(
            id: "img-skin-4",
            diagramType: .skinLayers,
            highlightLabel: "hair follicle",
            question: "Which structure is indicated by the arrow extending through the dermis?",
            choices: ["Sweat gland", "Hair follicle", "Sebaceous gland", "Arrector pili muscle"],
            correctIndex: 1,
            explanation: "Hair follicles are tube-like structures that extend from the epidermis into the dermis (and sometimes hypodermis). The hair bulb at the base contains the matrix of actively dividing cells."
        ),
    ]

    // MARK: - Bone Structure (4 questions)

    static let boneQuestions: [ImageQuestion] = [
        ImageQuestion(
            id: "img-bone-1",
            diagramType: .boneStructure,
            highlightLabel: "diaphysis",
            question: "Which part of the long bone is indicated by the arrow?",
            choices: ["Epiphysis", "Diaphysis", "Metaphysis", "Periosteum"],
            correctIndex: 1,
            explanation: "The diaphysis is the shaft (middle portion) of a long bone. It is composed primarily of compact bone surrounding the medullary (marrow) cavity."
        ),
        ImageQuestion(
            id: "img-bone-2",
            diagramType: .boneStructure,
            highlightLabel: "epiphysis",
            question: "The arrow points to which region of this long bone?",
            choices: ["Diaphysis", "Epiphysis", "Periosteum", "Endosteum"],
            correctIndex: 1,
            explanation: "The epiphysis is the rounded end of a long bone. It is composed mainly of spongy (cancellous) bone covered by a thin layer of compact bone and articular cartilage."
        ),
        ImageQuestion(
            id: "img-bone-3",
            diagramType: .boneStructure,
            highlightLabel: "medullary cavity",
            question: "Identify the space indicated by the arrow inside the bone shaft.",
            choices: ["Haversian canal", "Medullary cavity", "Volkmann's canal", "Lacuna"],
            correctIndex: 1,
            explanation: "The medullary (marrow) cavity is the hollow space inside the diaphysis. In adults, it contains yellow bone marrow (mostly fat). Red bone marrow, which produces blood cells, is found in spongy bone."
        ),
        ImageQuestion(
            id: "img-bone-4",
            diagramType: .boneStructure,
            highlightLabel: "periosteum",
            question: "Which structure is shown by the thin outer covering on the bone shaft?",
            choices: ["Endosteum", "Articular cartilage", "Periosteum", "Compact bone"],
            correctIndex: 2,
            explanation: "The periosteum is a tough, fibrous membrane covering the outer surface of bone (except at joint surfaces). It contains osteoblasts for bone growth and repair, and serves as an attachment site for tendons and ligaments."
        ),
    ]

    // MARK: - Sarcomere (4 questions)

    static let sarcomereQuestions: [ImageQuestion] = [
        ImageQuestion(
            id: "img-sarc-1",
            diagramType: .sarcomere,
            highlightLabel: "z-disc",
            question: "Identify the dark vertical structure at the boundary of the sarcomere.",
            choices: ["M-line", "Z-disc (Z-line)", "A-band", "I-band"],
            correctIndex: 1,
            explanation: "Z-discs (Z-lines) mark the boundaries of each sarcomere. Actin (thin) filaments are anchored to Z-discs. The distance from one Z-disc to the next defines one sarcomere."
        ),
        ImageQuestion(
            id: "img-sarc-2",
            diagramType: .sarcomere,
            highlightLabel: "a-band",
            question: "The arrow points to which band/region of the sarcomere?",
            choices: ["I-band", "H-zone", "A-band", "Z-disc"],
            correctIndex: 2,
            explanation: "The A-band is the dark band that spans the entire length of the thick (myosin) filaments. It includes regions of overlap with thin (actin) filaments. The A-band does NOT change length during contraction."
        ),
        ImageQuestion(
            id: "img-sarc-3",
            diagramType: .sarcomere,
            highlightLabel: "myosin",
            question: "The arrow indicates which type of filament in the sarcomere?",
            choices: ["Actin (thin filament)", "Myosin (thick filament)", "Titin", "Tropomyosin"],
            correctIndex: 1,
            explanation: "Myosin (thick filaments) are located in the center of the sarcomere. Each myosin molecule has a head region that forms cross-bridges with actin during muscle contraction (sliding filament mechanism)."
        ),
        ImageQuestion(
            id: "img-sarc-4",
            diagramType: .sarcomere,
            highlightLabel: "h-zone",
            question: "Which zone/region is indicated by the arrow in the center of the sarcomere?",
            choices: ["I-band", "A-band", "Z-disc region", "H-zone"],
            correctIndex: 3,
            explanation: "The H-zone is the lighter central region of the A-band where only thick (myosin) filaments are present with no overlap of thin filaments. The H-zone shortens during muscle contraction."
        ),
    ]

    // MARK: - Feedback Loop (3 questions)

    static let feedbackQuestions: [ImageQuestion] = [
        ImageQuestion(
            id: "img-fb-1",
            diagramType: .feedbackLoop,
            highlightLabel: "receptor",
            question: "In this feedback loop diagram, which component detects the stimulus?",
            choices: ["Effector", "Control center", "Receptor", "Response"],
            correctIndex: 2,
            explanation: "The receptor (sensor) detects changes in the internal or external environment. For example, thermoreceptors in the skin detect changes in body temperature and send signals to the control center."
        ),
        ImageQuestion(
            id: "img-fb-2",
            diagramType: .feedbackLoop,
            highlightLabel: "effector",
            question: "Which component of the feedback loop carries out the corrective response?",
            choices: ["Receptor", "Stimulus", "Control center", "Effector"],
            correctIndex: 3,
            explanation: "The effector carries out the response directed by the control center. Effectors can be muscles or glands. For example, sweat glands (effectors) release sweat to cool the body when temperature rises."
        ),
        ImageQuestion(
            id: "img-fb-3",
            diagramType: .feedbackLoop,
            highlightLabel: "control center",
            question: "The arrow points to which component that processes information and determines the response?",
            choices: ["Receptor", "Effector", "Control center (integration center)", "Stimulus"],
            correctIndex: 2,
            explanation: "The control center (integration center) receives input from the receptor, compares it to a set point, and sends output commands to the effector. The hypothalamus is a common control center for homeostatic mechanisms."
        ),
    ]

    // MARK: - Quiz Sets (grouped for the list view)

    static let quizSets: [ImageQuizSet] = [
        ImageQuizSet(
            id: "imgquiz-body",
            title: "Body Planes & Cavities",
            diagramType: .bodyPlanes,
            questions: bodyQuestions
        ),
        ImageQuizSet(
            id: "imgquiz-cell",
            title: "Cell Organelles",
            diagramType: .cellStructure,
            questions: cellQuestions
        ),
        ImageQuizSet(
            id: "imgquiz-skin",
            title: "Skin Layers & Structures",
            diagramType: .skinLayers,
            questions: skinQuestions
        ),
        ImageQuizSet(
            id: "imgquiz-bone",
            title: "Long Bone Anatomy",
            diagramType: .boneStructure,
            questions: boneQuestions
        ),
        ImageQuizSet(
            id: "imgquiz-sarcomere",
            title: "Sarcomere Structure",
            diagramType: .sarcomere,
            questions: sarcomereQuestions
        ),
        ImageQuizSet(
            id: "imgquiz-feedback",
            title: "Feedback Loops",
            diagramType: .feedbackLoop,
            questions: feedbackQuestions
        ),
    ]
}
