import Foundation

struct TrueFalseData {
    static let allStatements: [TrueFalseStatement] = [
        // MARK: - Week 1: Anatomical Terminology
        TrueFalseStatement(
            id: "tf_1", statement: "The heart is located in the thoracic cavity.",
            isTrue: true, explanation: "The heart is in the mediastinum within the thoracic cavity.", weekNumber: 1),
        TrueFalseStatement(
            id: "tf_2", statement: "Proximal means farther from the trunk.",
            isTrue: false, explanation: "Proximal means closer to the point of attachment to the trunk. Distal means farther.", weekNumber: 1),
        TrueFalseStatement(
            id: "tf_3", statement: "The transverse plane divides the body into left and right halves.",
            isTrue: false, explanation: "The transverse plane divides the body into superior and inferior portions. The sagittal plane divides left and right.", weekNumber: 1),
        TrueFalseStatement(
            id: "tf_4", statement: "Anterior and ventral mean the same thing in humans.",
            isTrue: true, explanation: "In human anatomical position, anterior (front) and ventral (belly side) refer to the same direction.", weekNumber: 1),

        // MARK: - Week 2: Chemistry
        TrueFalseStatement(
            id: "tf_5", statement: "Covalent bonds involve the transfer of electrons.",
            isTrue: false, explanation: "Covalent bonds involve the sharing of electrons. Ionic bonds involve electron transfer.", weekNumber: 2),
        TrueFalseStatement(
            id: "tf_6", statement: "The pH of blood is normally between 7.35 and 7.45.",
            isTrue: true, explanation: "Normal blood pH is tightly regulated between 7.35 and 7.45, making it slightly alkaline.", weekNumber: 2),
        TrueFalseStatement(
            id: "tf_7", statement: "Enzymes are proteins that speed up chemical reactions.",
            isTrue: true, explanation: "Enzymes are biological catalysts, mostly proteins, that lower activation energy.", weekNumber: 2),
        TrueFalseStatement(
            id: "tf_8", statement: "Lipids are hydrophilic molecules.",
            isTrue: false, explanation: "Lipids are hydrophobic (water-fearing). They do not dissolve well in water.", weekNumber: 2),
        TrueFalseStatement(
            id: "tf_9", statement: "A solution with a pH of 3 is more acidic than one with a pH of 5.",
            isTrue: true, explanation: "Lower pH means higher H+ concentration and greater acidity.", weekNumber: 2),
        TrueFalseStatement(
            id: "tf_10", statement: "Carbohydrates are made of amino acids.",
            isTrue: false, explanation: "Carbohydrates are made of monosaccharides. Proteins are made of amino acids.", weekNumber: 2),

        // MARK: - Week 3: Cells
        TrueFalseStatement(
            id: "tf_11", statement: "The nucleus contains the cell's DNA.",
            isTrue: true, explanation: "The nucleus houses the cell's genetic material (DNA) and controls cell activities.", weekNumber: 3),
        TrueFalseStatement(
            id: "tf_12", statement: "Ribosomes are the site of lipid synthesis.",
            isTrue: false, explanation: "Ribosomes are the site of protein synthesis. The smooth ER is involved in lipid synthesis.", weekNumber: 3),
        TrueFalseStatement(
            id: "tf_13", statement: "Mitochondria have their own DNA.",
            isTrue: true, explanation: "Mitochondria contain their own circular DNA and can self-replicate.", weekNumber: 3),
        TrueFalseStatement(
            id: "tf_14", statement: "The Golgi apparatus packages and ships proteins.",
            isTrue: true, explanation: "The Golgi apparatus modifies, packages, and sorts proteins for secretion or use within the cell.", weekNumber: 3),

        // MARK: - Week 4: Tissues
        TrueFalseStatement(
            id: "tf_15", statement: "Epithelial tissue is highly vascular.",
            isTrue: false, explanation: "Epithelial tissue is avascular (no blood vessels). It receives nutrients by diffusion from connective tissue.", weekNumber: 4),
        TrueFalseStatement(
            id: "tf_16", statement: "Connective tissue always has an extracellular matrix.",
            isTrue: true, explanation: "All connective tissues have cells surrounded by an extracellular matrix of ground substance and fibers.", weekNumber: 4),
        TrueFalseStatement(
            id: "tf_17", statement: "Cardiac muscle is voluntary.",
            isTrue: false, explanation: "Cardiac muscle is involuntary. It contracts rhythmically without conscious control.", weekNumber: 4),
        TrueFalseStatement(
            id: "tf_18", statement: "Simple squamous epithelium is a single layer of flat cells.",
            isTrue: true, explanation: "Simple means one layer, squamous means flat cells.", weekNumber: 4),

        // MARK: - Week 5: Integumentary System
        TrueFalseStatement(
            id: "tf_19", statement: "The dermis is the outermost layer of skin.",
            isTrue: false, explanation: "The epidermis is the outermost layer. The dermis lies beneath it.", weekNumber: 5),
        TrueFalseStatement(
            id: "tf_20", statement: "Melanin protects the skin from UV radiation.",
            isTrue: true, explanation: "Melanin absorbs UV radiation and protects deeper skin layers from DNA damage.", weekNumber: 5),
        TrueFalseStatement(
            id: "tf_21", statement: "Hair and nails are made of keratin.",
            isTrue: true, explanation: "Hair and nails are composed of hard keratin, a tough structural protein.", weekNumber: 5),
        TrueFalseStatement(
            id: "tf_22", statement: "First-degree burns damage only the epidermis.",
            isTrue: true, explanation: "First-degree burns affect only the epidermis, causing redness and pain but no blistering.", weekNumber: 5),

        // MARK: - Week 6: Bone Tissue
        TrueFalseStatement(
            id: "tf_23", statement: "Osteoclasts build new bone tissue.",
            isTrue: false, explanation: "Osteoclasts break down (resorb) bone. Osteoblasts build new bone tissue.", weekNumber: 6),
        TrueFalseStatement(
            id: "tf_24", statement: "Red bone marrow produces blood cells.",
            isTrue: true, explanation: "Red bone marrow is the site of hematopoiesis (blood cell formation).", weekNumber: 6),
        TrueFalseStatement(
            id: "tf_25", statement: "Compact bone is found in the diaphysis of long bones.",
            isTrue: true, explanation: "The diaphysis (shaft) of long bones is primarily compact bone surrounding the medullary cavity.", weekNumber: 6),
        TrueFalseStatement(
            id: "tf_26", statement: "The epiphyseal plate is found in adults.",
            isTrue: false, explanation: "In adults, the epiphyseal plate has ossified into the epiphyseal line. The plate is present during growth.", weekNumber: 6),

        // MARK: - Week 7: Axial Skeleton
        TrueFalseStatement(
            id: "tf_27", statement: "The skull contains 22 bones.",
            isTrue: true, explanation: "The skull has 8 cranial bones and 14 facial bones, totaling 22.", weekNumber: 7),
        TrueFalseStatement(
            id: "tf_28", statement: "There are 12 pairs of ribs.",
            isTrue: true, explanation: "Humans have 12 pairs of ribs: 7 true, 3 false, and 2 floating.", weekNumber: 7),
        TrueFalseStatement(
            id: "tf_29", statement: "The sacrum is part of the appendicular skeleton.",
            isTrue: false, explanation: "The sacrum is part of the axial skeleton (vertebral column).", weekNumber: 7),
        TrueFalseStatement(
            id: "tf_30", statement: "Lumbar vertebrae are found in the lower back.",
            isTrue: true, explanation: "The 5 lumbar vertebrae (L1-L5) make up the lower back region.", weekNumber: 7),

        // MARK: - Week 8: Appendicular Skeleton
        TrueFalseStatement(
            id: "tf_31", statement: "The femur is the longest bone in the body.",
            isTrue: true, explanation: "The femur (thigh bone) is the longest, heaviest, and strongest bone.", weekNumber: 8),
        TrueFalseStatement(
            id: "tf_32", statement: "The ulna is on the thumb side of the forearm.",
            isTrue: false, explanation: "The radius is on the thumb (lateral) side. The ulna is on the pinky (medial) side.", weekNumber: 8),
        TrueFalseStatement(
            id: "tf_33", statement: "The pelvic girdle consists of two hip bones.",
            isTrue: true, explanation: "The pelvic girdle is formed by two hip (coxal) bones, each made of the ilium, ischium, and pubis.", weekNumber: 8),

        // MARK: - Week 9: Joints
        TrueFalseStatement(
            id: "tf_34", statement: "Synovial joints are the most movable type of joint.",
            isTrue: true, explanation: "Synovial joints (diarthroses) are freely movable and are the most common joint type.", weekNumber: 9),
        TrueFalseStatement(
            id: "tf_35", statement: "Sutures are examples of synovial joints.",
            isTrue: false, explanation: "Sutures are fibrous joints (synarthroses) found between skull bones. They are immovable.", weekNumber: 9),
        TrueFalseStatement(
            id: "tf_36", statement: "The knee joint is a hinge joint.",
            isTrue: true, explanation: "The knee is primarily a hinge joint allowing flexion and extension.", weekNumber: 9),

        // MARK: - Week 10: Muscular System
        TrueFalseStatement(
            id: "tf_37", statement: "Skeletal muscle is involuntary.",
            isTrue: false, explanation: "Skeletal muscle is voluntary. Smooth and cardiac muscle are involuntary.", weekNumber: 10),
        TrueFalseStatement(
            id: "tf_38", statement: "The sarcomere is the functional unit of muscle contraction.",
            isTrue: true, explanation: "The sarcomere, from Z-disc to Z-disc, is the basic contractile unit of striated muscle.", weekNumber: 10),
        TrueFalseStatement(
            id: "tf_39", statement: "Tendons connect bones to bones.",
            isTrue: false, explanation: "Tendons connect muscle to bone. Ligaments connect bone to bone.", weekNumber: 10),
        TrueFalseStatement(
            id: "tf_40", statement: "The biceps brachii is a flexor of the elbow.",
            isTrue: true, explanation: "The biceps brachii flexes the elbow and supinates the forearm.", weekNumber: 10),

        // MARK: - Week 11: Membrane Transport
        TrueFalseStatement(
            id: "tf_41", statement: "Osmosis is the diffusion of water across a selectively permeable membrane.",
            isTrue: true, explanation: "Osmosis specifically refers to the movement of water down its concentration gradient across a membrane.", weekNumber: 11),
        TrueFalseStatement(
            id: "tf_42", statement: "Active transport moves substances down their concentration gradient.",
            isTrue: false, explanation: "Active transport moves substances against their concentration gradient, requiring ATP.", weekNumber: 11),
        TrueFalseStatement(
            id: "tf_43", statement: "A cell placed in a hypotonic solution will swell.",
            isTrue: true, explanation: "In a hypotonic solution, water moves into the cell by osmosis, causing it to swell.", weekNumber: 11),
        TrueFalseStatement(
            id: "tf_44", statement: "Facilitated diffusion requires energy from ATP.",
            isTrue: false, explanation: "Facilitated diffusion is passive transport using carrier or channel proteins but no ATP.", weekNumber: 11),
    ]
}
