import Foundation

// MARK: - Course Content for Bio 40A, Weeks 9-10
// Appendicular Skeleton (Ch 8), Joints (Ch 9), Muscle Tissue (Ch 10), Muscular System (Ch 11)

extension CourseContent {

    // MARK: - Default SR shorthand
    private static let w910SR = Flashcard.SpacedRepetitionData()

    // MARK: - Lessons Weeks 9-10
    static let lessonsWeeks9_10: [Lesson] = [lesson14, lesson15, lesson16, lesson17]

    // MARK: - Quizzes Weeks 9-10
    static let quizzesWeeks9_10: [Quiz] = [quiz5, quiz6]

    // MARK: - Flashcard Decks Weeks 9-10
    static let flashcardDecksWeeks9_10: [FlashcardDeck] = [
        deckAppendicularSkeleton,
        deckJointsAndMovements,
        deckMuscleStructure,
        deckMajorMuscles
    ]

    // =========================================================================
    // MARK: - LESSON 14: Skeletal System Part 2 (Week 9, Mon Jun 1, Ch 8)
    // =========================================================================

    static let lesson14 = Lesson(
        id: "w9-lesson-14",
        weekNumber: 9,
        classNumber: 14,
        title: "Skeletal System Part 2",
        subtitle: "Appendicular skeleton: upper limb, pelvic girdle, and lower limb",
        textbookChapter: "Chapter 8",
        textbookSections: "8.4 - 8.7",
        sections: [
            // Section 1 — Upper Limb Bones
            LessonSection(
                id: "w9-l14-s1",
                heading: "Upper Limb Bones",
                content: """
                The upper limb (upper extremity) consists of 30 bones on each side. The arm (brachium) \
                contains a single bone, the humerus, which is the longest and largest bone of the upper \
                limb. The head of the humerus articulates with the glenoid cavity of the scapula at the \
                shoulder joint. Key landmarks include the greater and lesser tubercles (attachment sites \
                for rotator cuff muscles), the deltoid tuberosity (attachment for the deltoid muscle), \
                the capitulum (articulates with the radius), and the trochlea (articulates with the ulna).

                The forearm (antebrachium) contains two bones: the radius (lateral, thumb side) and the \
                ulna (medial, pinky side). The radius has a disc-shaped head proximally and a styloid \
                process distally. The ulna features the olecranon (the bony point of the elbow), the \
                coronoid process, and the trochlear notch, which wraps around the trochlea of the humerus. \
                The radius and ulna articulate with each other at proximal and distal radioulnar joints, \
                allowing pronation and supination.

                The hand consists of 8 carpal bones (arranged in two rows of four in the wrist), 5 \
                metacarpals (form the palm), and 14 phalanges (finger bones: 2 in the thumb/pollex, \
                3 in each of the other four digits — proximal, middle, and distal phalanges). A useful \
                mnemonic for the carpal bones (proximal row lateral to medial, then distal row lateral \
                to medial) is: Some Lovers Try Positions That They Can't Handle (Scaphoid, Lunate, \
                Triquetrum, Pisiform, Trapezium, Trapezoid, Capitate, Hamate).
                """,
                keyTerms: [
                    KeyTerm(id: "w9-l14s1-k1", term: "Humerus", definition: "The single bone of the arm (brachium); articulates with the scapula proximally and the radius and ulna distally."),
                    KeyTerm(id: "w9-l14s1-k2", term: "Radius", definition: "The lateral forearm bone (thumb side); its disc-shaped head articulates with the capitulum of the humerus; distally articulates with carpal bones."),
                    KeyTerm(id: "w9-l14s1-k3", term: "Ulna", definition: "The medial forearm bone (pinky side); the olecranon forms the elbow point; the trochlear notch articulates with the trochlea of the humerus."),
                    KeyTerm(id: "w9-l14s1-k4", term: "Carpals", definition: "Eight small bones of the wrist arranged in two rows of four; they form the carpus and allow wrist flexibility."),
                    KeyTerm(id: "w9-l14s1-k5", term: "Phalanges (Hand)", definition: "The 14 finger bones: 2 in the thumb (proximal and distal) and 3 in each of the other four digits (proximal, middle, distal).")
                ],
                testablesFacts: [
                    "The upper limb has 30 bones per side: 1 humerus, 1 radius, 1 ulna, 8 carpals, 5 metacarpals, 14 phalanges.",
                    "The radius is lateral (thumb side); the ulna is medial (pinky side).",
                    "The olecranon of the ulna forms the bony point of the elbow.",
                    "The thumb (pollex) has only 2 phalanges; the other digits each have 3.",
                    "There are 8 carpal bones arranged in two rows of four."
                ]
            ),
            // Section 2 — Pelvic Girdle
            LessonSection(
                id: "w9-l14-s2",
                heading: "Pelvic Girdle",
                content: """
                The pelvic girdle (hip girdle) consists of two hip bones (os coxae or innominate bones) \
                that articulate with each other anteriorly at the pubic symphysis and with the sacrum \
                posteriorly at the sacroiliac joints. Each hip bone is formed by the fusion of three \
                bones during adolescence: the ilium (superior, largest portion), the ischium (posteroinferior \
                portion), and the pubis (anteroinferior portion). These three bones fuse at the acetabulum, \
                the deep, cup-shaped socket that receives the head of the femur.

                Key landmarks of the ilium include the iliac crest (the superior ridge you can palpate at \
                the hip), the anterior superior iliac spine (ASIS, a key clinical landmark), and the \
                greater sciatic notch. The ischium features the ischial tuberosity (the "sit bones" — you \
                sit on these), the ischial spine, and the lesser sciatic notch. The pubis has superior and \
                inferior rami and contributes to the pubic symphysis. Between the pubis and ischium is the \
                obturator foramen, the largest foramen in the body, mostly covered by the obturator membrane.

                Male vs female pelvis differences are clinically important: The female pelvis is wider, \
                shallower, and has a larger pelvic inlet and outlet (adapted for childbirth). The female \
                pelvic inlet is oval/round; the male is heart-shaped. The subpubic angle is greater than \
                90° in females and less than 90° in males. The female ischial spines are farther apart, \
                and the sacrum is shorter, wider, and less curved.
                """,
                keyTerms: [
                    KeyTerm(id: "w9-l14s2-k1", term: "Acetabulum", definition: "The deep, cup-shaped socket on the lateral surface of the hip bone where the ilium, ischium, and pubis fuse; receives the head of the femur."),
                    KeyTerm(id: "w9-l14s2-k2", term: "Obturator Foramen", definition: "The largest foramen in the body, located between the pubis and ischium; mostly covered by the obturator membrane."),
                    KeyTerm(id: "w9-l14s2-k3", term: "Iliac Crest", definition: "The superior ridge of the ilium; palpable at the hip and a key clinical landmark for intramuscular injections."),
                    KeyTerm(id: "w9-l14s2-k4", term: "Ischial Tuberosity", definition: "The thick, roughened projection of the ischium; bears body weight when sitting ('sit bones')."),
                    KeyTerm(id: "w9-l14s2-k5", term: "Pubic Symphysis", definition: "The cartilaginous joint where the two pubic bones meet anteriorly in the midline.")
                ],
                testablesFacts: [
                    "Each hip bone is formed by fusion of ilium, ischium, and pubis at the acetabulum.",
                    "The obturator foramen is the largest foramen in the body.",
                    "The ischial tuberosity bears body weight when sitting.",
                    "Female pelvis: wider, shallower, round pelvic inlet, subpubic angle >90°.",
                    "Male pelvis: narrower, deeper, heart-shaped inlet, subpubic angle <90°.",
                    "ASIS (anterior superior iliac spine) is a key palpable clinical landmark."
                ]
            ),
            // Section 3 — Lower Limb Bones
            LessonSection(
                id: "w9-l14-s3",
                heading: "Lower Limb Bones",
                content: """
                The lower limb (lower extremity) consists of 30 bones on each side. The thigh contains \
                the femur, the longest, heaviest, and strongest bone in the body. The head of the femur \
                articulates with the acetabulum of the hip bone. Key landmarks include the greater \
                trochanter (a large, lateral projection palpable at the hip — attachment site for gluteal \
                muscles), the lesser trochanter (medial, attachment for the iliopsoas), the linea aspera \
                (a ridge on the posterior shaft for muscle attachment), and the lateral and medial condyles \
                (articulate with the tibia at the knee).

                The patella (kneecap) is a large sesamoid bone embedded in the tendon of the quadriceps \
                femoris muscle. It protects the knee joint anteriorly and improves the leverage of the \
                quadriceps during knee extension.

                The leg (crus) contains two bones: the tibia (the larger, medial, weight-bearing bone) \
                and the fibula (the slender, lateral bone). The tibia features the tibial tuberosity \
                (attachment for the patellar ligament), the medial malleolus (the bony bump on the medial \
                side of the ankle), and the medial and lateral condyles (articulate with the femur). The \
                fibula is not part of the knee joint; its distal end forms the lateral malleolus (the bony \
                bump on the lateral side of the ankle).

                The foot has 7 tarsal bones (the two largest are the calcaneus/heel bone and the talus, \
                which articulates with the tibia and fibula at the ankle joint), 5 metatarsals, and 14 \
                phalanges (2 in the great toe/hallux, 3 in each of the other four toes). The foot has \
                two main arches: the longitudinal arch (medial and lateral parts) and the transverse arch. \
                These arches absorb shock and distribute weight during walking.
                """,
                keyTerms: [
                    KeyTerm(id: "w9-l14s3-k1", term: "Greater Trochanter", definition: "A large, lateral projection of the proximal femur; palpable at the hip; attachment site for gluteal and hip rotator muscles."),
                    KeyTerm(id: "w9-l14s3-k2", term: "Lateral Malleolus", definition: "The distal end of the fibula forming the bony prominence on the lateral side of the ankle."),
                    KeyTerm(id: "w9-l14s3-k3", term: "Medial Malleolus", definition: "The distal end of the tibia forming the bony prominence on the medial side of the ankle."),
                    KeyTerm(id: "w9-l14s3-k4", term: "Calcaneus", definition: "The heel bone; the largest tarsal bone; receives the attachment of the calcaneal (Achilles) tendon."),
                    KeyTerm(id: "w9-l14s3-k5", term: "Talus", definition: "The tarsal bone that articulates superiorly with the tibia and fibula at the ankle joint; transfers body weight to the foot."),
                    KeyTerm(id: "w9-l14s3-k6", term: "Patella", definition: "The kneecap; a large sesamoid bone in the quadriceps tendon that protects the knee and improves leverage for knee extension.")
                ],
                testablesFacts: [
                    "The femur is the longest, heaviest, and strongest bone in the body.",
                    "The greater trochanter is a lateral projection of the femur palpable at the hip.",
                    "The tibia is medial and weight-bearing; the fibula is lateral and non-weight-bearing.",
                    "The medial malleolus is part of the tibia; the lateral malleolus is part of the fibula.",
                    "The calcaneus is the largest tarsal bone (heel bone); the talus articulates with the tibia/fibula.",
                    "The foot has 7 tarsals, 5 metatarsals, and 14 phalanges.",
                    "The great toe (hallux) has 2 phalanges; the other toes each have 3."
                ]
            )
        ],
        clinicalApplication: ClinicalApplication(
            title: "Common Fracture Sites",
            scenario: "EMTs encounter fractures regularly. Three of the most common fracture sites in the appendicular skeleton are: (1) Colles fracture — a distal radius fracture, typically from falling on an outstretched hand (FOOSH injury), producing a 'dinner fork' deformity. (2) Hip fracture — usually a fracture of the femoral neck or intertrochanteric region, most common in elderly patients with osteoporosis; the affected leg is often shortened and externally rotated. (3) Ankle fracture — may involve the lateral malleolus (fibula), medial malleolus (tibia), or both (bimalleolar fracture), commonly from twisting injuries.",
            connection: "For EMTs, recognizing these fracture patterns helps guide immobilization decisions. A Colles fracture requires wrist splinting. Hip fractures need full-leg immobilization and gentle handling; do not attempt to straighten the leg. Ankle fractures should be splinted in the position found. Always assess distal pulses, sensation, and motor function (CSM checks) before and after splinting."
        )
    )

    // =========================================================================
    // MARK: - LESSON 15: Joints (Week 9, Wed Jun 3, Ch 9)
    // =========================================================================

    static let lesson15 = Lesson(
        id: "w9-lesson-15",
        weekNumber: 9,
        classNumber: 15,
        title: "Joints",
        subtitle: "Joint classification, synovial joint structure, types, and movements",
        textbookChapter: "Chapter 9",
        textbookSections: "9.1 - 9.6",
        sections: [
            // Section 1 — Joint Classification
            LessonSection(
                id: "w9-l15-s1",
                heading: "Joint Classification",
                content: """
                A joint (articulation) is any point where two or more bones meet. Joints are classified \
                structurally (by the material binding the bones) and functionally (by the degree of \
                movement permitted).

                Structural classification: \
                1) Fibrous joints — bones are connected by dense connective tissue (collagen fibers) with \
                no joint cavity. Types include sutures (skull bones, immovable), syndesmoses (e.g., the \
                interosseous membrane between the tibia and fibula, slightly movable), and gomphoses \
                (tooth in socket, immovable). \
                2) Cartilaginous joints — bones are united by cartilage with no joint cavity. Types include \
                synchondroses (hyaline cartilage, e.g., epiphyseal plates, immovable) and symphyses \
                (fibrocartilage, e.g., pubic symphysis and intervertebral discs, slightly movable). \
                3) Synovial joints — the most common and most movable type. They have a joint cavity \
                (synovial cavity) filled with synovial fluid and are enclosed by an articular capsule.

                Functional classification: \
                Synarthroses = immovable (sutures, gomphoses, synchondroses). \
                Amphiarthroses = slightly movable (syndesmoses, symphyses). \
                Diarthroses = freely movable (all synovial joints).
                """,
                keyTerms: [
                    KeyTerm(id: "w9-l15s1-k1", term: "Fibrous Joint", definition: "A joint in which bones are connected by dense connective tissue with no joint cavity; includes sutures, syndesmoses, and gomphoses."),
                    KeyTerm(id: "w9-l15s1-k2", term: "Cartilaginous Joint", definition: "A joint in which bones are united by cartilage with no joint cavity; includes synchondroses (hyaline) and symphyses (fibrocartilage)."),
                    KeyTerm(id: "w9-l15s1-k3", term: "Synovial Joint", definition: "The most common and most movable joint type; features a joint cavity with synovial fluid, enclosed by an articular capsule."),
                    KeyTerm(id: "w9-l15s1-k4", term: "Synarthrosis", definition: "A functionally immovable joint (e.g., sutures of the skull)."),
                    KeyTerm(id: "w9-l15s1-k5", term: "Diarthrosis", definition: "A functionally freely movable joint; all synovial joints are diarthroses.")
                ],
                testablesFacts: [
                    "Structural classification: fibrous, cartilaginous, synovial.",
                    "Functional classification: synarthrosis (immovable), amphiarthrosis (slightly movable), diarthrosis (freely movable).",
                    "All synovial joints are diarthroses (freely movable).",
                    "Sutures are fibrous joints found in the skull; they are synarthroses.",
                    "Symphyses contain fibrocartilage and are slightly movable (amphiarthroses)."
                ]
            ),
            // Section 2 — Synovial Joint Structure
            LessonSection(
                id: "w9-l15-s2",
                heading: "Synovial Joint Structure",
                content: """
                All synovial joints share six distinguishing features:

                1) Articular cartilage — hyaline cartilage covers the ends of the opposing bones. It \
                absorbs compression, reduces friction, and prevents bone-on-bone contact. It is avascular \
                and heals poorly when damaged.

                2) Articular (joint) capsule — a two-layered capsule enclosing the joint. The outer \
                fibrous layer (fibrous capsule) is composed of dense irregular connective tissue and is \
                often reinforced by ligaments. The inner synovial membrane lines the capsule and produces \
                synovial fluid.

                3) Synovial fluid — a viscous, slippery fluid that fills the joint cavity. It lubricates \
                the articular surfaces, nourishes the avascular articular cartilage, and absorbs shock. \
                It is derived from filtration of blood plasma with added hyaluronic acid.

                4) Ligaments — bands of dense regular connective tissue that connect bone to bone and \
                reinforce the joint. They may be intrinsic (thickenings of the capsule) or extrinsic \
                (separate from the capsule).

                5) Bursae — small, fluid-filled sacs lined with synovial membrane found where tendons, \
                ligaments, or muscles rub against bone. They reduce friction and cushion the structures.

                6) Tendon sheaths — elongated bursae that wrap around tendons subjected to friction, \
                especially in the wrist and ankle. They allow tendons to slide smoothly.

                Some synovial joints also contain menisci (articular discs) — wedge-shaped pads of \
                fibrocartilage that improve joint fit, distribute weight, stabilize the joint, and absorb \
                shock. The knee contains a medial meniscus and lateral meniscus.
                """,
                keyTerms: [
                    KeyTerm(id: "w9-l15s2-k1", term: "Articular Cartilage", definition: "Hyaline cartilage covering bone ends in a synovial joint; absorbs shock and reduces friction; avascular and heals poorly."),
                    KeyTerm(id: "w9-l15s2-k2", term: "Articular Capsule", definition: "The two-layered joint capsule: an outer fibrous layer (dense CT) and an inner synovial membrane that produces synovial fluid."),
                    KeyTerm(id: "w9-l15s2-k3", term: "Synovial Fluid", definition: "Viscous fluid filling the joint cavity; lubricates surfaces, nourishes articular cartilage, and absorbs shock; contains hyaluronic acid."),
                    KeyTerm(id: "w9-l15s2-k4", term: "Bursa", definition: "A small, fluid-filled sac lined with synovial membrane that reduces friction where tendons, ligaments, or muscles rub against bone."),
                    KeyTerm(id: "w9-l15s2-k5", term: "Meniscus", definition: "A wedge-shaped pad of fibrocartilage in certain joints (e.g., knee) that improves fit, distributes weight, and absorbs shock."),
                    KeyTerm(id: "w9-l15s2-k6", term: "Tendon Sheath", definition: "An elongated bursa that wraps around a tendon to reduce friction; especially common in the wrist and ankle.")
                ],
                testablesFacts: [
                    "All synovial joints have: articular cartilage, articular capsule, synovial fluid, ligaments, and associated bursae.",
                    "Articular cartilage is hyaline cartilage — it is avascular and heals poorly.",
                    "Synovial fluid lubricates, nourishes cartilage, and absorbs shock.",
                    "Ligaments connect bone to bone; tendons connect muscle to bone.",
                    "Bursae reduce friction; menisci improve joint fit and distribute weight.",
                    "The knee contains medial and lateral menisci."
                ]
            ),
            // Section 3 — Types of Synovial Joints
            LessonSection(
                id: "w9-l15-s3",
                heading: "Types of Synovial Joints",
                content: """
                Synovial joints are classified into six types based on the shape of the articular surfaces \
                and the types of movement they allow:

                1) Plane (gliding) joint — flat or slightly curved articular surfaces; allows short \
                gliding or sliding movements. Examples: intercarpal joints, intertarsal joints, \
                acromioclavicular joint.

                2) Hinge joint — a convex surface fits into a concave surface; allows movement in one \
                plane (flexion and extension only). Examples: elbow (humeroulnar), knee (primarily), \
                ankle, interphalangeal joints.

                3) Pivot joint — a rounded or pointed process fits into a ring of bone and/or ligament; \
                allows rotation around a single axis. Examples: atlantoaxial joint (C1-C2, allows head \
                rotation — "no" movement), proximal radioulnar joint (allows pronation/supination).

                4) Condyloid (ellipsoid) joint — an oval convex surface fits into an oval concavity; \
                allows movement in two planes (flexion/extension and abduction/adduction, plus \
                circumduction). Examples: metacarpophalangeal (knuckle) joints, wrist (radiocarpal) joint.

                5) Saddle joint — each articular surface is saddle-shaped (concave in one direction, \
                convex in the other); allows the same movements as condyloid joints but with greater \
                range. Example: carpometacarpal joint of the thumb (allows opposition).

                6) Ball-and-socket joint — a spherical head fits into a cup-like socket; allows the \
                greatest range of motion in all axes, including rotation. Examples: shoulder \
                (glenohumeral) joint, hip (coxal) joint.
                """,
                keyTerms: [
                    KeyTerm(id: "w9-l15s3-k1", term: "Hinge Joint", definition: "A synovial joint allowing movement in one plane (flexion/extension); examples include the elbow and interphalangeal joints."),
                    KeyTerm(id: "w9-l15s3-k2", term: "Pivot Joint", definition: "A synovial joint allowing rotation around a single axis; examples include the atlantoaxial (C1-C2) and proximal radioulnar joints."),
                    KeyTerm(id: "w9-l15s3-k3", term: "Ball-and-Socket Joint", definition: "A synovial joint allowing the greatest range of motion in all planes; examples include the shoulder (glenohumeral) and hip joints."),
                    KeyTerm(id: "w9-l15s3-k4", term: "Saddle Joint", definition: "A synovial joint with reciprocally concave-convex surfaces; the carpometacarpal joint of the thumb is the classic example."),
                    KeyTerm(id: "w9-l15s3-k5", term: "Condyloid Joint", definition: "A synovial joint with an oval convex surface fitting into an oval concavity; allows biaxial movement; examples include the knuckle joints.")
                ],
                testablesFacts: [
                    "The six types of synovial joints: plane, hinge, pivot, condyloid, saddle, ball-and-socket.",
                    "Ball-and-socket joints (shoulder, hip) allow the greatest range of motion.",
                    "Hinge joints allow only flexion and extension (uniaxial).",
                    "The saddle joint of the thumb allows opposition — a uniquely human movement.",
                    "Pivot joints allow rotation; the atlantoaxial joint allows you to shake your head 'no'.",
                    "Condyloid joints are biaxial — they allow flexion/extension and abduction/adduction."
                ]
            ),
            // Section 4 — Joint Movements
            LessonSection(
                id: "w9-l15-s4",
                heading: "Joint Movements",
                content: """
                Joint movements are described in specific anatomical terms:

                Angular movements change the angle between bones: \
                Flexion — decreases the angle between bones (e.g., bending the elbow). \
                Extension — increases the angle between bones (e.g., straightening the elbow). \
                Hyperextension — extension beyond the normal anatomical position (e.g., bending the \
                head backward). \
                Abduction — movement away from the midline of the body (e.g., raising the arm sideways). \
                Adduction — movement toward the midline (e.g., lowering the raised arm). \
                Circumduction — a cone-shaped movement combining flexion, extension, abduction, and \
                adduction in sequence (e.g., drawing a circle with the arm).

                Rotational movements: \
                Rotation — turning a bone around its own long axis (e.g., turning the head side to side). \
                Medial (internal) rotation — anterior surface turns toward the midline. \
                Lateral (external) rotation — anterior surface turns away from the midline.

                Special movements: \
                Dorsiflexion — lifting the foot so the toes point upward (decreasing the angle at the ankle). \
                Plantar flexion — pointing the foot/toes downward (increasing the angle at the ankle). \
                Inversion — turning the sole of the foot medially (inward). \
                Eversion — turning the sole of the foot laterally (outward). \
                Pronation — rotating the forearm so the palm faces posteriorly (or downward). \
                Supination — rotating the forearm so the palm faces anteriorly (or upward). \
                Opposition — the movement of the thumb to touch the tips of the other fingers; unique \
                to the saddle joint of the thumb.
                """,
                keyTerms: [
                    KeyTerm(id: "w9-l15s4-k1", term: "Flexion", definition: "An angular movement that decreases the angle between articulating bones (e.g., bending the elbow or knee)."),
                    KeyTerm(id: "w9-l15s4-k2", term: "Extension", definition: "An angular movement that increases the angle between articulating bones; straightening a flexed limb."),
                    KeyTerm(id: "w9-l15s4-k3", term: "Abduction", definition: "Movement of a limb away from the midline of the body."),
                    KeyTerm(id: "w9-l15s4-k4", term: "Adduction", definition: "Movement of a limb toward the midline of the body."),
                    KeyTerm(id: "w9-l15s4-k5", term: "Dorsiflexion", definition: "Lifting the foot so toes point upward; decreases the angle at the ankle."),
                    KeyTerm(id: "w9-l15s4-k6", term: "Plantar Flexion", definition: "Pointing the foot/toes downward; increases the angle at the ankle (as in standing on tiptoe)."),
                    KeyTerm(id: "w9-l15s4-k7", term: "Pronation", definition: "Rotation of the forearm so the palm faces posteriorly or downward; the radius crosses over the ulna."),
                    KeyTerm(id: "w9-l15s4-k8", term: "Supination", definition: "Rotation of the forearm so the palm faces anteriorly or upward; the radius and ulna are parallel."),
                    KeyTerm(id: "w9-l15s4-k9", term: "Inversion", definition: "Turning the sole of the foot medially (inward)."),
                    KeyTerm(id: "w9-l15s4-k10", term: "Eversion", definition: "Turning the sole of the foot laterally (outward)."),
                    KeyTerm(id: "w9-l15s4-k11", term: "Circumduction", definition: "A cone-shaped movement that combines flexion, extension, abduction, and adduction in sequence.")
                ],
                testablesFacts: [
                    "Flexion decreases joint angle; extension increases joint angle.",
                    "Abduction = away from midline; adduction = toward midline.",
                    "Dorsiflexion = toes up; plantar flexion = toes down (think: planting the toe).",
                    "Inversion = sole faces medially; eversion = sole faces laterally.",
                    "Pronation = palm down (prone); supination = palm up (holding soup).",
                    "Circumduction is a combination movement tracing a cone shape.",
                    "Opposition is unique to the thumb (saddle joint)."
                ]
            )
        ],
        clinicalApplication: ClinicalApplication(
            title: "Joint Injuries: Sprains and Dislocations",
            scenario: "An EMT responds to a basketball game where a player has twisted an ankle and another player has a shoulder that appears deformed after a fall.",
            connection: "Sprains are stretching or tearing of ligaments at a joint, commonly at the ankle (often from inversion injury) and knee. EMTs assess by checking for swelling, pain, and instability. Dislocations occur when bones are forced out of their normal position in a joint, most commonly in the shoulder (anterior dislocation from abduction + external rotation). Signs include visible deformity, severe pain, and inability to move the joint. EMTs should splint in the position found, apply ice, check distal CSM (circulation, sensation, motor), and transport. Never attempt to reduce (relocate) a dislocation in the field."
        )
    )

    // =========================================================================
    // MARK: - LESSON 16: Muscle Tissue (Week 10, Mon Jun 8, Ch 10)
    // =========================================================================

    static let lesson16 = Lesson(
        id: "w10-lesson-16",
        weekNumber: 10,
        classNumber: 16,
        title: "Muscle Tissue",
        subtitle: "Skeletal muscle structure, sliding filament theory, and neuromuscular junction",
        textbookChapter: "Chapter 10",
        textbookSections: "10.1 - 10.6",
        sections: [
            // Section 1 — Three Muscle Types Review
            LessonSection(
                id: "w10-l16-s1",
                heading: "Three Muscle Types Review",
                content: """
                The body contains three types of muscle tissue, each with distinct structure and function:

                Skeletal muscle is attached to bones and produces voluntary movements. Its cells (muscle \
                fibers) are long, cylindrical, and multinucleated with prominent striations. Skeletal \
                muscle makes up approximately 40% of body mass and is responsible for locomotion, posture, \
                heat production, and protection of internal organs. It contracts rapidly but fatigues easily.

                Cardiac muscle is found only in the heart wall (myocardium). Its cells are short, branched, \
                and typically uninucleate, with striations and intercalated discs (containing desmosomes \
                and gap junctions). Cardiac muscle is involuntary and autorhythmic — it generates its own \
                contraction rhythm without nervous system stimulation.

                Smooth muscle is found in the walls of hollow organs (GI tract, blood vessels, urinary \
                bladder, airways) and other visceral structures. Its cells are spindle-shaped (fusiform), \
                uninucleate, and non-striated. Smooth muscle is involuntary, contracts slowly, and resists \
                fatigue. It can sustain prolonged contractions (tonic contractions) for peristalsis, \
                vasoconstriction, and other visceral functions.
                """,
                keyTerms: [
                    KeyTerm(id: "w10-l16s1-k1", term: "Skeletal Muscle", definition: "Voluntary, striated muscle attached to bones; long, cylindrical, multinucleated fibers; responsible for locomotion, posture, and heat production."),
                    KeyTerm(id: "w10-l16s1-k2", term: "Cardiac Muscle", definition: "Involuntary, striated muscle found only in the heart; short, branched, uninucleate cells with intercalated discs; autorhythmic."),
                    KeyTerm(id: "w10-l16s1-k3", term: "Smooth Muscle", definition: "Involuntary, non-striated muscle in walls of hollow organs; spindle-shaped, uninucleate cells; contracts slowly but resists fatigue.")
                ],
                testablesFacts: [
                    "Skeletal muscle: voluntary, striated, multinucleated, attached to bone.",
                    "Cardiac muscle: involuntary, striated, branched, uninucleate, intercalated discs, autorhythmic.",
                    "Smooth muscle: involuntary, non-striated, spindle-shaped, uninucleate, found in hollow organs.",
                    "Skeletal muscle makes up about 40% of body mass.",
                    "Only cardiac muscle is autorhythmic — it generates its own contraction rhythm."
                ]
            ),
            // Section 2 — Skeletal Muscle Structure
            LessonSection(
                id: "w10-l16-s2",
                heading: "Skeletal Muscle Structure",
                content: """
                Skeletal muscle has a hierarchical structure from whole muscle to molecular level:

                The whole muscle is wrapped in epimysium (dense irregular CT). Within the muscle, bundles \
                of muscle fibers called fascicles are each wrapped in perimysium. Each individual muscle \
                fiber (cell) is wrapped in endomysium (thin areolar CT). This CT framework carries blood \
                vessels and nerves to every fiber and merges at the ends of the muscle to form the tendon \
                or aponeurosis that attaches muscle to bone.

                Each muscle fiber (cell) is a single, long, multinucleated cell with a plasma membrane \
                called the sarcolemma and cytoplasm called the sarcoplasm. The sarcoplasm contains \
                hundreds of myofibrils — long, rod-shaped organelles that span the length of the fiber \
                and are the contractile elements. Each myofibril is made up of repeating units called \
                sarcomeres, the basic functional unit of contraction.

                The sarcomere extends from one Z-disc (Z-line) to the next. Within each sarcomere: \
                Thin filaments (actin) are anchored at the Z-discs and extend toward the center. \
                Thick filaments (myosin) occupy the center of the sarcomere. \
                The A-band is the dark band spanning the entire length of the thick filaments (includes \
                overlap zones). The I-band is the light band containing only thin filaments. The H-zone \
                is the center of the A-band where only thick filaments are present (no overlap). The \
                M-line is the very center of the sarcomere where thick filaments are anchored.

                The sarcoplasmic reticulum (SR) is a specialized smooth ER that wraps around each \
                myofibril and stores calcium ions (Ca²⁺). T-tubules (transverse tubules) are inward \
                extensions of the sarcolemma that conduct action potentials deep into the muscle fiber, \
                ensuring simultaneous contraction of all myofibrils.
                """,
                keyTerms: [
                    KeyTerm(id: "w10-l16s2-k1", term: "Sarcomere", definition: "The basic contractile unit of skeletal muscle, extending from one Z-disc to the next; contains overlapping actin (thin) and myosin (thick) filaments."),
                    KeyTerm(id: "w10-l16s2-k2", term: "Z-Disc", definition: "The boundary of a sarcomere; a protein disc to which thin (actin) filaments are anchored."),
                    KeyTerm(id: "w10-l16s2-k3", term: "A-Band", definition: "The dark band of the sarcomere spanning the entire length of thick (myosin) filaments; does NOT shorten during contraction."),
                    KeyTerm(id: "w10-l16s2-k4", term: "I-Band", definition: "The light band containing only thin (actin) filaments; it shortens during contraction as thin filaments slide inward."),
                    KeyTerm(id: "w10-l16s2-k5", term: "H-Zone", definition: "The center of the A-band containing only thick (myosin) filaments; it shortens during contraction as thin filaments slide inward."),
                    KeyTerm(id: "w10-l16s2-k6", term: "Sarcoplasmic Reticulum", definition: "A specialized smooth ER in muscle fibers that stores and releases calcium ions (Ca²⁺) to trigger contraction."),
                    KeyTerm(id: "w10-l16s2-k7", term: "T-Tubules", definition: "Transverse tubules; inward extensions of the sarcolemma that conduct action potentials deep into the fiber for simultaneous contraction."),
                    KeyTerm(id: "w10-l16s2-k8", term: "Myofibril", definition: "A long, rod-shaped organelle within a muscle fiber composed of repeating sarcomeres; the contractile element of the cell.")
                ],
                testablesFacts: [
                    "Organizational hierarchy: muscle → fascicle → muscle fiber → myofibril → sarcomere.",
                    "CT wrappings: epimysium (whole muscle), perimysium (fascicle), endomysium (fiber).",
                    "The sarcomere is the basic contractile unit, from Z-disc to Z-disc.",
                    "Thin filaments = actin (anchored at Z-disc); thick filaments = myosin (center of sarcomere).",
                    "A-band = dark (thick filaments); I-band = light (thin filaments only); H-zone = thick only.",
                    "During contraction: I-band and H-zone shorten; A-band stays the same length.",
                    "Sarcoplasmic reticulum stores Ca²⁺; T-tubules carry action potentials into the fiber."
                ]
            ),
            // Section 3 — Sliding Filament Theory and Contraction
            LessonSection(
                id: "w10-l16-s3",
                heading: "Sliding Filament Theory and Contraction",
                content: """
                The sliding filament theory explains how muscles contract: thin (actin) filaments slide \
                past thick (myosin) filaments, pulling the Z-discs closer together and shortening the \
                sarcomere. The filaments themselves do not shorten — they slide past each other.

                The key regulatory proteins on the thin filament are: \
                Tropomyosin — a long, coiled protein that wraps around actin, blocking the myosin-binding \
                sites when the muscle is at rest. \
                Troponin — a globular protein complex bound to tropomyosin. When Ca²⁺ binds to troponin, \
                it changes shape and shifts tropomyosin away from the binding sites, exposing them.

                Cross-bridge cycling (the contraction cycle) has four steps: \
                1) Cross-bridge formation — the energized myosin head (with ADP + Pi attached) binds to \
                the exposed binding site on actin, forming a cross-bridge. \
                2) Power stroke — the myosin head pivots, pulling the thin filament toward the center of \
                the sarcomere. ADP and Pi are released. \
                3) Cross-bridge detachment — a new ATP molecule binds to the myosin head, causing it to \
                detach from actin. \
                4) Myosin reactivation — ATP is hydrolyzed to ADP + Pi, and the energy re-cocks the \
                myosin head into the high-energy position, ready to bind again.

                This cycle repeats rapidly (hundreds of times per second) as long as Ca²⁺ and ATP are \
                available. When the nerve signal stops, Ca²⁺ is pumped back into the sarcoplasmic \
                reticulum, tropomyosin re-covers the binding sites, and the muscle relaxes.
                """,
                keyTerms: [
                    KeyTerm(id: "w10-l16s3-k1", term: "Actin", definition: "The protein that forms the thin filaments; contains binding sites for myosin heads; anchored at Z-discs."),
                    KeyTerm(id: "w10-l16s3-k2", term: "Myosin", definition: "The protein that forms the thick filaments; has heads that bind actin and pivot during the power stroke, pulling thin filaments inward."),
                    KeyTerm(id: "w10-l16s3-k3", term: "Tropomyosin", definition: "A regulatory protein on the thin filament that blocks myosin-binding sites on actin when the muscle is at rest."),
                    KeyTerm(id: "w10-l16s3-k4", term: "Troponin", definition: "A regulatory protein on the thin filament; when Ca²⁺ binds to it, troponin shifts tropomyosin to expose myosin-binding sites on actin."),
                    KeyTerm(id: "w10-l16s3-k5", term: "Cross-Bridge Cycling", definition: "The repetitive cycle of myosin binding actin, pivoting (power stroke), detaching (requires new ATP), and re-cocking; produces sarcomere shortening.")
                ],
                testablesFacts: [
                    "The sliding filament theory: thin filaments slide past thick filaments — filaments do not shorten.",
                    "Tropomyosin blocks myosin-binding sites at rest; troponin moves tropomyosin when Ca²⁺ binds.",
                    "Cross-bridge cycle: attach → pivot (power stroke) → detach (new ATP) → re-cock (ATP hydrolysis).",
                    "Both Ca²⁺ and ATP are required for contraction.",
                    "Relaxation occurs when Ca²⁺ is pumped back into the sarcoplasmic reticulum.",
                    "ATP is needed both for the power stroke (indirectly) and for detaching the myosin head."
                ]
            ),
            // Section 4 — Neuromuscular Junction
            LessonSection(
                id: "w10-l16-s4",
                heading: "Neuromuscular Junction",
                content: """
                The neuromuscular junction (NMJ) is the synapse between a motor neuron and a skeletal \
                muscle fiber. It is where the nervous system communicates with skeletal muscle to initiate \
                contraction.

                Structure: The axon terminal of the motor neuron contains vesicles filled with the \
                neurotransmitter acetylcholine (ACh). The motor end plate is the specialized region of \
                the sarcolemma at the NMJ, containing numerous ACh receptors. The synaptic cleft is the \
                tiny gap between the axon terminal and the motor end plate.

                Events at the NMJ: \
                1) A nerve impulse (action potential) arrives at the axon terminal. \
                2) Voltage-gated calcium channels open, allowing Ca²⁺ to flow into the axon terminal. \
                3) Ca²⁺ triggers exocytosis of ACh vesicles into the synaptic cleft. \
                4) ACh binds to receptors on the motor end plate, opening ligand-gated Na⁺ channels. \
                5) Na⁺ influx depolarizes the sarcolemma, generating a muscle action potential. \
                6) The action potential propagates along the sarcolemma and down T-tubules. \
                7) The SR releases Ca²⁺, which binds troponin and initiates cross-bridge cycling. \
                8) Acetylcholinesterase (AChE) in the synaptic cleft rapidly breaks down ACh, ending \
                stimulation.

                A motor unit consists of one motor neuron and all the muscle fibers it innervates. \
                Small motor units (few fibers per neuron) allow fine control (e.g., eye muscles). \
                Large motor units (many fibers per neuron) produce powerful but less precise movements \
                (e.g., quadriceps).
                """,
                keyTerms: [
                    KeyTerm(id: "w10-l16s4-k1", term: "Acetylcholine (ACh)", definition: "The neurotransmitter released at the neuromuscular junction; binds to receptors on the motor end plate to trigger muscle contraction."),
                    KeyTerm(id: "w10-l16s4-k2", term: "Motor End Plate", definition: "The specialized region of the sarcolemma at the NMJ, rich in ACh receptors and junctional folds that increase surface area."),
                    KeyTerm(id: "w10-l16s4-k3", term: "Acetylcholinesterase (AChE)", definition: "The enzyme in the synaptic cleft that rapidly degrades acetylcholine, terminating the signal at the NMJ."),
                    KeyTerm(id: "w10-l16s4-k4", term: "Motor Unit", definition: "One motor neuron and all the skeletal muscle fibers it innervates; the smallest functional unit of motor control.")
                ],
                testablesFacts: [
                    "ACh is the neurotransmitter at the neuromuscular junction.",
                    "NMJ sequence: nerve impulse → Ca²⁺ enters terminal → ACh released → binds motor end plate → Na⁺ influx → muscle AP → SR releases Ca²⁺ → contraction.",
                    "Acetylcholinesterase (AChE) breaks down ACh to stop stimulation.",
                    "A motor unit = one motor neuron + all the fibers it innervates.",
                    "Small motor units = fine control (eyes); large motor units = powerful movements (legs)."
                ]
            )
        ],
        clinicalApplication: ClinicalApplication(
            title: "Rigor Mortis and Muscle Fatigue",
            scenario: "EMTs encounter deceased individuals where the body is stiff (rigor mortis). They also see patients with severe muscle fatigue or cramping after prolonged exertion or heat exposure.",
            connection: "Rigor mortis occurs after death because ATP is no longer produced. Without ATP, myosin heads cannot detach from actin, locking muscles in contraction. Rigor begins 2-4 hours after death and lasts 24-48 hours until muscle proteins decompose. Understanding this helps EMTs estimate time of death. Muscle fatigue in living patients results from ATP depletion, lactic acid accumulation, and ionic imbalances. In the field, EMTs manage muscle cramps with gentle stretching, hydration, and electrolyte replacement. Severe heat-related muscle cramping (heat cramps) can progress to heat exhaustion or heatstroke if untreated."
        )
    )

    // =========================================================================
    // MARK: - LESSON 17: Muscular System (Week 10, Wed Jun 10, Ch 11)
    // =========================================================================

    static let lesson17 = Lesson(
        id: "w10-lesson-17",
        weekNumber: 10,
        classNumber: 17,
        title: "Muscular System",
        subtitle: "Muscle naming, functional groups, and major muscles of the body",
        textbookChapter: "Chapter 11",
        textbookSections: "11.1 - 11.6",
        sections: [
            // Section 1 — Muscle Naming and Functional Groups
            LessonSection(
                id: "w10-l17-s1",
                heading: "Muscle Naming and Functional Groups",
                content: """
                Muscles are named according to several criteria: \
                Location — named for the body region (e.g., tibialis anterior is on the anterior tibia). \
                Size — terms like maximus, minimus, longus, brevis (e.g., gluteus maximus = largest gluteal). \
                Shape — terms like deltoid (triangular), trapezius (trapezoid), orbicularis (circular). \
                Action — named for what the muscle does (e.g., flexor, extensor, adductor, abductor). \
                Number of origins — biceps (2), triceps (3), quadriceps (4). \
                Origin and insertion — named for attachment sites (e.g., sternocleidomastoid attaches to \
                the sternum, clavicle, and mastoid process). \
                Fiber direction — rectus (straight/parallel), oblique (diagonal), transversus (horizontal).

                Functional groups of muscles at a joint: \
                Origin — the less movable attachment (typically proximal). \
                Insertion — the more movable attachment (typically distal). The muscle pulls the insertion \
                toward the origin during contraction. \
                Agonist (prime mover) — the muscle primarily responsible for a specific movement. \
                Antagonist — the muscle that opposes or reverses the agonist's action. When the agonist \
                contracts, the antagonist must relax (and vice versa). \
                Synergist — a muscle that assists the agonist in performing a movement or stabilizes \
                intermediate joints. \
                Fixator — a synergist that stabilizes the origin of the agonist so the agonist can act \
                more efficiently (e.g., muscles stabilizing the scapula during arm movement).
                """,
                keyTerms: [
                    KeyTerm(id: "w10-l17s1-k1", term: "Origin", definition: "The less movable attachment of a muscle; typically the proximal end; remains relatively stationary during contraction."),
                    KeyTerm(id: "w10-l17s1-k2", term: "Insertion", definition: "The more movable attachment of a muscle; typically the distal end; pulled toward the origin during contraction."),
                    KeyTerm(id: "w10-l17s1-k3", term: "Agonist (Prime Mover)", definition: "The muscle primarily responsible for producing a specific movement."),
                    KeyTerm(id: "w10-l17s1-k4", term: "Antagonist", definition: "The muscle that opposes or reverses the action of the agonist; it must relax when the agonist contracts."),
                    KeyTerm(id: "w10-l17s1-k5", term: "Synergist", definition: "A muscle that assists the agonist in performing a movement or stabilizes intermediate joints to prevent unwanted movement."),
                    KeyTerm(id: "w10-l17s1-k6", term: "Fixator", definition: "A synergist that stabilizes the origin of the agonist, allowing the prime mover to act more efficiently.")
                ],
                testablesFacts: [
                    "Muscles are named by: location, size, shape, action, number of origins, origin/insertion, fiber direction.",
                    "Origin = less movable attachment (proximal); insertion = more movable attachment (distal).",
                    "Agonist = prime mover; antagonist = opposes agonist; synergist = assists agonist; fixator = stabilizes origin.",
                    "When an agonist contracts, its antagonist must relax (reciprocal inhibition).",
                    "Rectus = straight fibers; oblique = diagonal fibers; transversus = horizontal fibers."
                ]
            ),
            // Section 2 — Head, Neck, and Trunk Muscles
            LessonSection(
                id: "w10-l17-s2",
                heading: "Head, Neck, and Trunk Muscles",
                content: """
                Head muscles: \
                Orbicularis oculi — the circular muscle around the eye; closes the eyelid (blinking, \
                squinting). \
                Orbicularis oris — the circular muscle around the mouth; closes and protrudes the lips \
                (kissing, whistling). \
                Masseter — the powerful jaw muscle; elevates the mandible (closes the jaw for chewing). \
                It is one of the strongest muscles in the body relative to its size. \
                Temporalis — a fan-shaped muscle on the lateral skull; also elevates and retracts the mandible.

                Neck muscles: \
                Sternocleidomastoid (SCM) — runs from the sternum and clavicle to the mastoid process. \
                When both sides contract together, it flexes the neck (chin to chest). When one side \
                contracts alone, it rotates the head to the opposite side and laterally flexes the neck \
                to the same side. Injury to one SCM causes torticollis (wry neck). \
                Trapezius — a large, diamond-shaped muscle of the upper back and neck; elevates, retracts, \
                and depresses the scapula; extends the head.

                Trunk muscles: \
                Pectoralis major — large, fan-shaped muscle of the anterior chest; flexes, adducts, and \
                medially rotates the arm at the shoulder. \
                Rectus abdominis — the "six-pack" muscle; runs vertically on the anterior abdomen; flexes \
                the vertebral column (crunches) and compresses the abdomen. \
                External oblique — the largest and most superficial of the lateral abdominal muscles; \
                flexes and rotates the trunk. \
                Internal oblique — deep to the external oblique; fibers run perpendicular to the external. \
                Transversus abdominis — the deepest abdominal muscle; compresses the abdomen. \
                Latissimus dorsi — the large, flat muscle of the lower back; extends, adducts, and \
                medially rotates the arm; the "swimmer's muscle" or "lat." \
                Erector spinae — a group of three muscle columns running along the vertebral column; \
                extends and laterally flexes the spine; maintains upright posture.
                """,
                keyTerms: [
                    KeyTerm(id: "w10-l17s2-k1", term: "Masseter", definition: "A powerful jaw muscle that elevates the mandible (closes the jaw); one of the strongest muscles by size; used in chewing."),
                    KeyTerm(id: "w10-l17s2-k2", term: "Sternocleidomastoid (SCM)", definition: "A neck muscle from sternum/clavicle to mastoid process; bilateral contraction flexes the neck; unilateral contraction rotates head to opposite side."),
                    KeyTerm(id: "w10-l17s2-k3", term: "Trapezius", definition: "A large, diamond-shaped muscle of the upper back and neck; elevates, retracts, and depresses the scapula; extends the head."),
                    KeyTerm(id: "w10-l17s2-k4", term: "Pectoralis Major", definition: "A large, fan-shaped anterior chest muscle; flexes, adducts, and medially rotates the arm at the shoulder."),
                    KeyTerm(id: "w10-l17s2-k5", term: "Rectus Abdominis", definition: "The 'six-pack' muscle on the anterior abdomen; flexes the vertebral column and compresses the abdomen."),
                    KeyTerm(id: "w10-l17s2-k6", term: "Latissimus Dorsi", definition: "A large, flat muscle of the lower back; extends, adducts, and medially rotates the arm; the 'swimmer's muscle.'"),
                    KeyTerm(id: "w10-l17s2-k7", term: "Erector Spinae", definition: "A group of three muscle columns along the spine; extends and laterally flexes the vertebral column; maintains upright posture.")
                ],
                testablesFacts: [
                    "Orbicularis oculi closes the eye; orbicularis oris closes and protrudes the lips.",
                    "The masseter elevates the mandible (chewing) and is one of the strongest muscles by size.",
                    "SCM: bilateral = flex neck; unilateral = rotate head to opposite side.",
                    "Pectoralis major: flexes, adducts, and medially rotates the arm.",
                    "Rectus abdominis: flexes vertebral column ('crunches'); the 'six-pack' muscle.",
                    "Latissimus dorsi: extends, adducts, medially rotates the arm ('swimmer's muscle').",
                    "Erector spinae maintains upright posture and extends the spine."
                ]
            ),
            // Section 3 — Upper Limb Muscles
            LessonSection(
                id: "w10-l17-s3",
                heading: "Upper Limb Muscles",
                content: """
                Shoulder muscles: \
                Deltoid — a thick, triangular muscle capping the shoulder; the most common site for \
                intramuscular (IM) injections. It has anterior, middle, and posterior fibers. The middle \
                fibers are the major abductor of the arm. The anterior fibers flex and medially rotate; \
                the posterior fibers extend and laterally rotate the arm.

                Arm muscles: \
                Biceps brachii — a two-headed muscle on the anterior arm. Actions: flexes the elbow and \
                supinates the forearm (its most powerful action). It is the agonist for elbow flexion. \
                Triceps brachii — a three-headed muscle on the posterior arm. Action: extends the elbow. \
                It is the antagonist to the biceps brachii. The triceps is the only muscle in the \
                posterior arm compartment.

                Forearm muscles: \
                Brachioradialis — on the lateral forearm; flexes the elbow (especially in a neutral \
                forearm position — neither pronated nor supinated). It is a synergist for elbow flexion. \
                Flexor group (anterior forearm) — muscles that flex the wrist and fingers. \
                Extensor group (posterior forearm) — muscles that extend the wrist and fingers.
                """,
                keyTerms: [
                    KeyTerm(id: "w10-l17s3-k1", term: "Deltoid", definition: "A thick, triangular muscle capping the shoulder; its middle fibers abduct the arm; a common IM injection site."),
                    KeyTerm(id: "w10-l17s3-k2", term: "Biceps Brachii", definition: "A two-headed anterior arm muscle; the prime mover for elbow flexion and forearm supination."),
                    KeyTerm(id: "w10-l17s3-k3", term: "Triceps Brachii", definition: "A three-headed posterior arm muscle; the prime mover for elbow extension; antagonist to the biceps brachii."),
                    KeyTerm(id: "w10-l17s3-k4", term: "Brachioradialis", definition: "A lateral forearm muscle that flexes the elbow; acts as a synergist for elbow flexion.")
                ],
                testablesFacts: [
                    "The deltoid is the most common site for IM injections; its middle fibers abduct the arm.",
                    "Biceps brachii: flexes elbow (agonist) and supinates the forearm.",
                    "Triceps brachii: extends the elbow; it is the antagonist to the biceps.",
                    "Brachioradialis: flexes the elbow as a synergist; located on the lateral forearm.",
                    "Anterior forearm muscles = flexors; posterior forearm muscles = extensors."
                ]
            ),
            // Section 4 — Lower Limb Muscles
            LessonSection(
                id: "w10-l17-s4",
                heading: "Lower Limb Muscles",
                content: """
                Hip muscles: \
                Iliopsoas — the primary hip flexor (actually two muscles: iliacus + psoas major). It \
                flexes the thigh at the hip and is important for walking and maintaining upright posture. \
                Gluteus maximus — the largest muscle in the body; the primary hip extensor. It is most \
                active during climbing stairs, rising from a seated position, and running. It is also \
                a common site for intramuscular injections (dorsogluteal site, though the ventrogluteal \
                site is now preferred). \
                Gluteus medius — lies deep to gluteus maximus; abducts and medially rotates the thigh. \
                The ventrogluteal site (gluteus medius) is the preferred IM injection site for adults.

                Thigh muscles: \
                Quadriceps femoris group (anterior thigh) — four muscles (rectus femoris, vastus lateralis, \
                vastus medialis, vastus intermedius) that extend the knee. The rectus femoris also flexes \
                the hip. The vastus lateralis (lateral thigh) is a common IM injection site in infants. \
                Hamstrings group (posterior thigh) — three muscles (biceps femoris, semitendinosus, \
                semimembranosus) that flex the knee and extend the hip. The hamstrings are the antagonists \
                of the quadriceps.

                Leg muscles: \
                Gastrocnemius — the superficial calf muscle; plantar flexes the foot and flexes the knee. \
                It forms the visible bulge of the calf. \
                Soleus — deep to the gastrocnemius; plantar flexes the foot (does not cross the knee). \
                Together, the gastrocnemius and soleus insert via the calcaneal (Achilles) tendon. \
                Tibialis anterior — on the anterior leg; dorsiflexes and inverts the foot. It is the \
                antagonist to the gastrocnemius/soleus for dorsiflexion/plantar flexion.
                """,
                keyTerms: [
                    KeyTerm(id: "w10-l17s4-k1", term: "Iliopsoas", definition: "The primary hip flexor (iliacus + psoas major); flexes the thigh at the hip; important for walking and posture."),
                    KeyTerm(id: "w10-l17s4-k2", term: "Gluteus Maximus", definition: "The largest muscle in the body; the primary hip extensor; most active during climbing, rising, and running."),
                    KeyTerm(id: "w10-l17s4-k3", term: "Quadriceps Femoris", definition: "Four anterior thigh muscles (rectus femoris, vastus lateralis, medialis, intermedius); the prime movers for knee extension."),
                    KeyTerm(id: "w10-l17s4-k4", term: "Hamstrings", definition: "Three posterior thigh muscles (biceps femoris, semitendinosus, semimembranosus); flex the knee and extend the hip; antagonists of the quadriceps."),
                    KeyTerm(id: "w10-l17s4-k5", term: "Gastrocnemius", definition: "The superficial calf muscle; plantar flexes the foot and flexes the knee; inserts via the calcaneal (Achilles) tendon."),
                    KeyTerm(id: "w10-l17s4-k6", term: "Soleus", definition: "The deep calf muscle; plantar flexes the foot; shares the calcaneal tendon with the gastrocnemius."),
                    KeyTerm(id: "w10-l17s4-k7", term: "Tibialis Anterior", definition: "An anterior leg muscle; dorsiflexes and inverts the foot; antagonist to the gastrocnemius/soleus.")
                ],
                testablesFacts: [
                    "Iliopsoas is the primary hip flexor (iliacus + psoas major).",
                    "Gluteus maximus is the largest muscle in the body and the primary hip extensor.",
                    "The ventrogluteal site (gluteus medius) is the preferred IM injection site for adults.",
                    "Quadriceps (4 muscles) extend the knee; hamstrings (3 muscles) flex the knee — they are antagonists.",
                    "The vastus lateralis is a common IM injection site for infants.",
                    "Gastrocnemius + soleus insert via the calcaneal (Achilles) tendon and plantar flex the foot.",
                    "Tibialis anterior dorsiflexes and inverts the foot."
                ]
            )
        ],
        clinicalApplication: ClinicalApplication(
            title: "Intramuscular Injection Sites",
            scenario: "A paramedic needs to administer epinephrine to a patient in anaphylaxis. Knowledge of safe IM injection sites is critical.",
            connection: "The four primary IM injection sites are: (1) Deltoid — the most common site for vaccinations; easy to access but limited volume (≤1 mL). (2) Ventrogluteal (gluteus medius) — the preferred site for adults; safest site with thick muscle and no major nerves or vessels. (3) Vastus lateralis (lateral thigh) — the preferred site for infants and young children due to well-developed muscle. (4) Dorsogluteal (gluteus maximus) — less preferred due to risk of sciatic nerve injury. In EMS, the lateral thigh (through clothing if necessary, as with an EpiPen) is the most practical site during emergencies."
        )
    )

    // =========================================================================
    // MARK: - QUIZ 5: Skeletal System & Joints (Week 9)
    // =========================================================================

    static let quiz5 = Quiz(
        id: "w9-quiz-5",
        title: "Quiz 5: Skeletal System & Joints",
        weekNumber: 9,
        lessonIds: ["w9-lesson-14", "w9-lesson-15"],
        questions: [
            // Q1 - Easy / Recall
            QuizQuestion(
                id: "w9-q5-01",
                question: "The radius is located on which side of the forearm?",
                choices: [
                    "Medial (pinky side)",
                    "Lateral (thumb side)",
                    "Posterior",
                    "Anterior"
                ],
                correctIndex: 1,
                explanation: "The radius is the lateral forearm bone, on the thumb side. The ulna is medial, on the pinky side.",
                difficulty: .easy,
                category: .recall
            ),
            // Q2 - Easy / Recall
            QuizQuestion(
                id: "w9-q5-02",
                question: "How many carpal bones are in each wrist?",
                choices: [
                    "5",
                    "6",
                    "7",
                    "8"
                ],
                correctIndex: 3,
                explanation: "There are 8 carpal bones in each wrist, arranged in two rows of four.",
                difficulty: .easy,
                category: .recall
            ),
            // Q3 - Easy / Recall
            QuizQuestion(
                id: "w9-q5-03",
                question: "Which three bones fuse to form each hip bone (os coxa)?",
                choices: [
                    "Femur, tibia, fibula",
                    "Ilium, ischium, pubis",
                    "Sacrum, coccyx, ilium",
                    "Scapula, clavicle, humerus"
                ],
                correctIndex: 1,
                explanation: "Each hip bone is formed by the fusion of the ilium (superior), ischium (posteroinferior), and pubis (anteroinferior), which meet at the acetabulum.",
                difficulty: .easy,
                category: .recall
            ),
            // Q4 - Easy / Recall
            QuizQuestion(
                id: "w9-q5-04",
                question: "What is the longest, heaviest, and strongest bone in the body?",
                choices: [
                    "Humerus",
                    "Tibia",
                    "Femur",
                    "Pelvis"
                ],
                correctIndex: 2,
                explanation: "The femur is the longest, heaviest, and strongest bone in the body. Its head articulates with the acetabulum of the hip bone.",
                difficulty: .easy,
                category: .recall
            ),
            // Q5 - Easy / Recall
            QuizQuestion(
                id: "w9-q5-05",
                question: "Which type of joint is the most common and most freely movable?",
                choices: [
                    "Fibrous",
                    "Cartilaginous",
                    "Synovial",
                    "Suture"
                ],
                correctIndex: 2,
                explanation: "Synovial joints are the most common type of joint in the body and are the most freely movable (diarthroses).",
                difficulty: .easy,
                category: .recall
            ),
            // Q6 - Easy / Recall
            QuizQuestion(
                id: "w9-q5-06",
                question: "What fluid fills the cavity of synovial joints and provides lubrication?",
                choices: [
                    "Cerebrospinal fluid",
                    "Serous fluid",
                    "Synovial fluid",
                    "Lymph"
                ],
                correctIndex: 2,
                explanation: "Synovial fluid is a viscous fluid that fills the synovial cavity. It lubricates articular surfaces, nourishes avascular articular cartilage, and absorbs shock.",
                difficulty: .easy,
                category: .recall
            ),
            // Q7 - Easy / Recall
            QuizQuestion(
                id: "w9-q5-07",
                question: "Which structure connects bone to bone at a joint?",
                choices: [
                    "Tendon",
                    "Ligament",
                    "Fascia",
                    "Cartilage"
                ],
                correctIndex: 1,
                explanation: "Ligaments are bands of dense regular connective tissue that connect bone to bone and reinforce joints. Tendons connect muscle to bone.",
                difficulty: .easy,
                category: .recall
            ),
            // Q8 - Easy / Recall
            QuizQuestion(
                id: "w9-q5-08",
                question: "The bony point of the elbow is formed by which structure?",
                choices: [
                    "Radial head",
                    "Olecranon of the ulna",
                    "Lateral epicondyle of the humerus",
                    "Coronoid process"
                ],
                correctIndex: 1,
                explanation: "The olecranon is the proximal projection of the ulna that forms the bony point of the elbow. It fits into the olecranon fossa of the humerus during extension.",
                difficulty: .easy,
                category: .recall
            ),
            // Q9 - Medium / Application
            QuizQuestion(
                id: "w9-q5-09",
                question: "A patient who fell on an outstretched hand has a 'dinner fork' deformity of the wrist. Which fracture is this most likely?",
                choices: [
                    "Femoral neck fracture",
                    "Colles fracture (distal radius)",
                    "Bimalleolar ankle fracture",
                    "Olecranon fracture"
                ],
                correctIndex: 1,
                explanation: "A Colles fracture is a fracture of the distal radius, typically from a fall on an outstretched hand (FOOSH). The displaced fragment produces the characteristic 'dinner fork' deformity.",
                difficulty: .medium,
                category: .application
            ),
            // Q10 - Medium / Application
            QuizQuestion(
                id: "w9-q5-10",
                question: "Which movement describes turning the sole of the foot inward (medially)?",
                choices: [
                    "Eversion",
                    "Dorsiflexion",
                    "Inversion",
                    "Plantar flexion"
                ],
                correctIndex: 2,
                explanation: "Inversion is turning the sole of the foot medially (inward). Eversion is the opposite — turning the sole laterally (outward).",
                difficulty: .medium,
                category: .application
            ),
            // Q11 - Medium / Application
            QuizQuestion(
                id: "w9-q5-11",
                question: "A patient rotates their forearm so the palm faces downward. This movement is called:",
                choices: [
                    "Supination",
                    "Pronation",
                    "Medial rotation",
                    "Circumduction"
                ],
                correctIndex: 1,
                explanation: "Pronation is rotation of the forearm so the palm faces posteriorly or downward. During pronation, the radius crosses over the ulna. Supination is the reverse — palm faces up.",
                difficulty: .medium,
                category: .application
            ),
            // Q12 - Medium / Application
            QuizQuestion(
                id: "w9-q5-12",
                question: "Which type of synovial joint allows the greatest range of motion?",
                choices: [
                    "Hinge joint",
                    "Pivot joint",
                    "Saddle joint",
                    "Ball-and-socket joint"
                ],
                correctIndex: 3,
                explanation: "Ball-and-socket joints (shoulder and hip) allow movement in all planes plus rotation, giving them the greatest range of motion of any synovial joint type.",
                difficulty: .medium,
                category: .application
            ),
            // Q13 - Medium / Application
            QuizQuestion(
                id: "w9-q5-13",
                question: "The lateral malleolus is a distal projection of which bone?",
                choices: [
                    "Tibia",
                    "Fibula",
                    "Femur",
                    "Talus"
                ],
                correctIndex: 1,
                explanation: "The lateral malleolus is the distal end of the fibula, forming the bony prominence on the lateral side of the ankle. The medial malleolus is part of the tibia.",
                difficulty: .medium,
                category: .application
            ),
            // Q14 - Medium / Recall
            QuizQuestion(
                id: "w9-q5-14",
                question: "What is the functional classification of a synovial joint?",
                choices: [
                    "Synarthrosis (immovable)",
                    "Amphiarthrosis (slightly movable)",
                    "Diarthrosis (freely movable)",
                    "Symphysis"
                ],
                correctIndex: 2,
                explanation: "All synovial joints are classified functionally as diarthroses (freely movable). Synarthroses are immovable; amphiarthroses are slightly movable.",
                difficulty: .medium,
                category: .recall
            ),
            // Q15 - Hard / Analysis
            QuizQuestion(
                id: "w9-q5-15",
                question: "A forensic examiner notes a wide, shallow pelvis with a round pelvic inlet and subpubic angle greater than 90°. These features indicate the skeleton is most likely:",
                choices: [
                    "Male",
                    "Female",
                    "Juvenile",
                    "Cannot be determined from pelvic features"
                ],
                correctIndex: 1,
                explanation: "Female pelvis characteristics include: wider and shallower shape, round/oval pelvic inlet, subpubic angle >90°, and wider-set ischial spines — all adaptations for childbirth. Male pelvis is narrower with a heart-shaped inlet and subpubic angle <90°.",
                difficulty: .hard,
                category: .analysis
            ),
            // Q16 - Hard / Analysis
            QuizQuestion(
                id: "w9-q5-16",
                question: "An elderly patient with osteoporosis falls and now has a shortened, externally rotated leg. Which fracture is most likely?",
                choices: [
                    "Colles fracture",
                    "Tibial plateau fracture",
                    "Hip fracture (femoral neck)",
                    "Patellar fracture"
                ],
                correctIndex: 2,
                explanation: "A hip fracture (femoral neck or intertrochanteric region) is extremely common in elderly patients with osteoporosis after a fall. The classic presentation is a shortened and externally rotated leg on the affected side.",
                difficulty: .hard,
                category: .analysis
            ),
            // Q17 - Hard / Clinical
            QuizQuestion(
                id: "w9-q5-17",
                question: "A basketball player lands awkwardly and has severe lateral ankle swelling. The mechanism was forced inversion. Which structure was most likely injured?",
                choices: [
                    "Medial (deltoid) ligament",
                    "Anterior cruciate ligament (ACL)",
                    "Lateral ligaments (anterior talofibular)",
                    "Patellar ligament"
                ],
                correctIndex: 2,
                explanation: "Inversion ankle sprains are the most common type. Forced inversion stretches or tears the lateral ligaments, especially the anterior talofibular ligament. The medial (deltoid) ligament is injured by eversion, which is less common.",
                difficulty: .hard,
                category: .clinical
            ),
            // Q18 - Hard / Analysis
            QuizQuestion(
                id: "w9-q5-18",
                question: "Which joint movement is described as a cone-shaped motion combining flexion, extension, abduction, and adduction?",
                choices: [
                    "Rotation",
                    "Opposition",
                    "Circumduction",
                    "Pronation"
                ],
                correctIndex: 2,
                explanation: "Circumduction is a cone-shaped movement that combines flexion, extension, abduction, and adduction in sequence. It occurs at ball-and-socket and condyloid joints.",
                difficulty: .hard,
                category: .analysis
            ),
            // Q19 - Hard / Clinical
            QuizQuestion(
                id: "w9-q5-19",
                question: "A patient presents with a visibly deformed shoulder after falling on an outstretched arm. The EMT should:",
                choices: [
                    "Attempt to relocate the joint immediately",
                    "Apply traction to realign the bones",
                    "Splint in the position found, assess CSM, and transport",
                    "Apply a compression bandage and have the patient move the arm"
                ],
                correctIndex: 2,
                explanation: "EMTs should never attempt to reduce (relocate) a dislocation in the field. The correct approach is to splint the joint in the position found, assess distal CSM (circulation, sensation, motor function), apply ice, and transport for definitive care.",
                difficulty: .hard,
                category: .clinical
            ),
            // Q20 - Medium / Recall
            QuizQuestion(
                id: "w9-q5-20",
                question: "The obturator foramen, the largest foramen in the body, is found between which two bones?",
                choices: [
                    "Ilium and sacrum",
                    "Ischium and pubis",
                    "Femur and tibia",
                    "Sacrum and coccyx"
                ],
                correctIndex: 1,
                explanation: "The obturator foramen is the largest foramen in the body, located between the ischium and pubis on each hip bone. It is mostly covered by the obturator membrane.",
                difficulty: .medium,
                category: .recall
            )
        ],
        timeLimit: 2400  // 40 minutes
    )

    // =========================================================================
    // MARK: - QUIZ 6: Muscle Tissue & Muscular System (Week 10)
    // =========================================================================

    static let quiz6 = Quiz(
        id: "w10-quiz-6",
        title: "Quiz 6: Muscle Tissue & Muscular System",
        weekNumber: 10,
        lessonIds: ["w10-lesson-16", "w10-lesson-17"],
        questions: [
            // Q1 - Easy / Recall
            QuizQuestion(
                id: "w10-q6-01",
                question: "What is the basic contractile unit of skeletal muscle?",
                choices: [
                    "Myofibril",
                    "Fascicle",
                    "Sarcomere",
                    "Motor unit"
                ],
                correctIndex: 2,
                explanation: "The sarcomere is the basic contractile unit of skeletal muscle, extending from one Z-disc to the next. It contains overlapping actin and myosin filaments.",
                difficulty: .easy,
                category: .recall
            ),
            // Q2 - Easy / Recall
            QuizQuestion(
                id: "w10-q6-02",
                question: "Which connective tissue wrapping surrounds an entire muscle?",
                choices: [
                    "Endomysium",
                    "Perimysium",
                    "Epimysium",
                    "Fascia"
                ],
                correctIndex: 2,
                explanation: "Epimysium wraps the entire muscle. Perimysium wraps fascicles (bundles of fibers). Endomysium wraps individual muscle fibers.",
                difficulty: .easy,
                category: .recall
            ),
            // Q3 - Easy / Recall
            QuizQuestion(
                id: "w10-q6-03",
                question: "What neurotransmitter is released at the neuromuscular junction?",
                choices: [
                    "Norepinephrine",
                    "Dopamine",
                    "Acetylcholine (ACh)",
                    "Serotonin"
                ],
                correctIndex: 2,
                explanation: "Acetylcholine (ACh) is the neurotransmitter released by motor neurons at the neuromuscular junction. It binds to receptors on the motor end plate to initiate muscle contraction.",
                difficulty: .easy,
                category: .recall
            ),
            // Q4 - Easy / Recall
            QuizQuestion(
                id: "w10-q6-04",
                question: "Which muscle is the primary hip extensor and the largest muscle in the body?",
                choices: [
                    "Iliopsoas",
                    "Quadriceps femoris",
                    "Gluteus maximus",
                    "Hamstrings"
                ],
                correctIndex: 2,
                explanation: "The gluteus maximus is the largest muscle in the body and the primary hip extensor. It is most active during stair climbing, rising from a chair, and running.",
                difficulty: .easy,
                category: .recall
            ),
            // Q5 - Easy / Recall
            QuizQuestion(
                id: "w10-q6-05",
                question: "The biceps brachii is the agonist (prime mover) for elbow flexion. Which muscle is its antagonist?",
                choices: [
                    "Brachioradialis",
                    "Deltoid",
                    "Triceps brachii",
                    "Pectoralis major"
                ],
                correctIndex: 2,
                explanation: "The triceps brachii is the antagonist of the biceps brachii. When the biceps contracts to flex the elbow, the triceps relaxes, and vice versa.",
                difficulty: .easy,
                category: .recall
            ),
            // Q6 - Easy / Recall
            QuizQuestion(
                id: "w10-q6-06",
                question: "Which protein forms the thin filaments of the sarcomere?",
                choices: [
                    "Myosin",
                    "Actin",
                    "Tropomyosin",
                    "Titin"
                ],
                correctIndex: 1,
                explanation: "Actin forms the thin filaments, which are anchored at the Z-discs. Myosin forms the thick filaments in the center of the sarcomere.",
                difficulty: .easy,
                category: .recall
            ),
            // Q7 - Easy / Recall
            QuizQuestion(
                id: "w10-q6-07",
                question: "Which organelle in muscle fibers stores calcium ions (Ca²⁺) needed for contraction?",
                choices: [
                    "T-tubules",
                    "Mitochondria",
                    "Sarcoplasmic reticulum",
                    "Golgi apparatus"
                ],
                correctIndex: 2,
                explanation: "The sarcoplasmic reticulum (SR) is a specialized smooth ER in muscle fibers that stores and releases Ca²⁺. When Ca²⁺ is released, it binds troponin and triggers contraction.",
                difficulty: .easy,
                category: .recall
            ),
            // Q8 - Easy / Recall
            QuizQuestion(
                id: "w10-q6-08",
                question: "What is the most common site for intramuscular (IM) injections in adults?",
                choices: [
                    "Vastus lateralis",
                    "Deltoid",
                    "Dorsogluteal",
                    "Rectus femoris"
                ],
                correctIndex: 1,
                explanation: "The deltoid is the most common site for IM injections (especially vaccinations) in adults due to easy access. The ventrogluteal site is preferred for larger volume injections.",
                difficulty: .easy,
                category: .recall
            ),
            // Q9 - Medium / Application
            QuizQuestion(
                id: "w10-q6-09",
                question: "During muscle contraction, which band of the sarcomere does NOT change in length?",
                choices: [
                    "I-band",
                    "A-band",
                    "H-zone",
                    "All bands shorten"
                ],
                correctIndex: 1,
                explanation: "The A-band (dark band) does not change length during contraction because it spans the entire length of the thick (myosin) filaments, which do not shorten. The I-band and H-zone both shorten as thin filaments slide inward.",
                difficulty: .medium,
                category: .application
            ),
            // Q10 - Medium / Application
            QuizQuestion(
                id: "w10-q6-10",
                question: "What role does calcium play in the sliding filament mechanism?",
                choices: [
                    "It provides energy for the power stroke",
                    "It binds to troponin, causing tropomyosin to shift and expose myosin-binding sites on actin",
                    "It directly causes myosin heads to detach from actin",
                    "It activates acetylcholinesterase"
                ],
                correctIndex: 1,
                explanation: "Ca²⁺ released from the sarcoplasmic reticulum binds to troponin on the thin filament. This causes a conformational change that shifts tropomyosin away from the myosin-binding sites on actin, allowing cross-bridge cycling to begin.",
                difficulty: .medium,
                category: .application
            ),
            // Q11 - Medium / Application
            QuizQuestion(
                id: "w10-q6-11",
                question: "A muscle that assists the prime mover and prevents unwanted movements is called a:",
                choices: [
                    "Agonist",
                    "Antagonist",
                    "Synergist",
                    "Fixator"
                ],
                correctIndex: 2,
                explanation: "A synergist assists the agonist (prime mover) by adding force or reducing unwanted movement. A fixator is a specific type of synergist that stabilizes the origin of the agonist.",
                difficulty: .medium,
                category: .application
            ),
            // Q12 - Medium / Application
            QuizQuestion(
                id: "w10-q6-12",
                question: "The quadriceps femoris group is the prime mover for which action?",
                choices: [
                    "Hip flexion",
                    "Knee flexion",
                    "Knee extension",
                    "Hip extension"
                ],
                correctIndex: 2,
                explanation: "The quadriceps femoris (four muscles: rectus femoris, vastus lateralis, vastus medialis, vastus intermedius) is the prime mover for knee extension. The hamstrings are the antagonist group, flexing the knee.",
                difficulty: .medium,
                category: .application
            ),
            // Q13 - Medium / Application
            QuizQuestion(
                id: "w10-q6-13",
                question: "Which muscle is named for its attachments to the sternum, clavicle, and mastoid process?",
                choices: [
                    "Trapezius",
                    "Sternocleidomastoid",
                    "Pectoralis major",
                    "Scalene"
                ],
                correctIndex: 1,
                explanation: "The sternocleidomastoid (SCM) is named for its attachments: sternum + clavicle (origin) to mastoid process (insertion). Bilateral contraction flexes the neck; unilateral contraction rotates the head.",
                difficulty: .medium,
                category: .application
            ),
            // Q14 - Medium / Recall
            QuizQuestion(
                id: "w10-q6-14",
                question: "In the cross-bridge cycle, what causes the myosin head to detach from actin?",
                choices: [
                    "Ca²⁺ binding to troponin",
                    "Release of ADP and Pi",
                    "Binding of a new ATP molecule to the myosin head",
                    "Acetylcholine binding to receptors"
                ],
                correctIndex: 2,
                explanation: "After the power stroke, the myosin head remains bound to actin until a new ATP molecule binds to the myosin head. ATP binding causes a conformational change that releases the myosin head from actin.",
                difficulty: .medium,
                category: .recall
            ),
            // Q15 - Hard / Analysis
            QuizQuestion(
                id: "w10-q6-15",
                question: "A patient is found deceased with rigid, stiff muscles. This is because after death:",
                choices: [
                    "Ca²⁺ floods the cells and myosin can't bind actin",
                    "ATP production ceases, so myosin heads cannot detach from actin",
                    "Acetylcholinesterase breaks down all remaining ACh",
                    "The sarcoplasmic reticulum absorbs all available Ca²⁺"
                ],
                correctIndex: 1,
                explanation: "Rigor mortis occurs because ATP is no longer produced after death. Without ATP, myosin heads cannot detach from actin, locking the muscles in a state of contraction. Rigor typically begins 2-4 hours after death and resolves in 24-48 hours as proteins decompose.",
                difficulty: .hard,
                category: .analysis
            ),
            // Q16 - Hard / Analysis
            QuizQuestion(
                id: "w10-q6-16",
                question: "If a nerve agent blocks acetylcholinesterase (AChE), what would be the effect on skeletal muscle?",
                choices: [
                    "Muscles would be unable to contract",
                    "Muscles would contract once and then relax normally",
                    "Muscles would contract continuously (sustained contraction / paralysis)",
                    "Muscles would be unaffected"
                ],
                correctIndex: 2,
                explanation: "If AChE is blocked, acetylcholine cannot be broken down in the synaptic cleft. ACh continuously stimulates the motor end plate, causing sustained muscle contraction. This is the mechanism of organophosphate poisoning (certain pesticides and nerve agents).",
                difficulty: .hard,
                category: .analysis
            ),
            // Q17 - Hard / Clinical
            QuizQuestion(
                id: "w10-q6-17",
                question: "An EMT needs to give an IM injection to a 6-month-old infant. The preferred injection site is:",
                choices: [
                    "Deltoid",
                    "Dorsogluteal (gluteus maximus)",
                    "Vastus lateralis (lateral thigh)",
                    "Ventrogluteal (gluteus medius)"
                ],
                correctIndex: 2,
                explanation: "The vastus lateralis (lateral thigh) is the preferred IM injection site for infants and young children because the muscle is well-developed even in small children. The deltoid is too small in infants.",
                difficulty: .hard,
                category: .clinical
            ),
            // Q18 - Hard / Analysis
            QuizQuestion(
                id: "w10-q6-18",
                question: "Which of the following correctly describes the hierarchy from largest to smallest?",
                choices: [
                    "Sarcomere → Myofibril → Muscle fiber → Fascicle",
                    "Muscle → Myofibril → Fascicle → Muscle fiber",
                    "Muscle → Fascicle → Muscle fiber → Myofibril → Sarcomere",
                    "Fascicle → Muscle → Muscle fiber → Sarcomere → Myofibril"
                ],
                correctIndex: 2,
                explanation: "The correct hierarchy from largest to smallest is: whole Muscle → Fascicle (bundle of fibers) → Muscle fiber (single cell) → Myofibril (contractile organelle) → Sarcomere (basic contractile unit).",
                difficulty: .hard,
                category: .analysis
            ),
            // Q19 - Hard / Clinical
            QuizQuestion(
                id: "w10-q6-19",
                question: "A patient is experiencing severe heat cramps after prolonged exertion. The underlying cause of muscle fatigue includes all of the following EXCEPT:",
                choices: [
                    "ATP depletion",
                    "Lactic acid accumulation",
                    "Ionic imbalances (electrolyte loss)",
                    "Excess acetylcholinesterase production"
                ],
                correctIndex: 3,
                explanation: "Muscle fatigue results from ATP depletion, lactic acid accumulation, and ionic/electrolyte imbalances. Excess AChE production is not a cause of exercise-induced muscle fatigue. Heat cramps are managed with rest, hydration, and electrolyte replacement.",
                difficulty: .hard,
                category: .clinical
            ),
            // Q20 - Medium / Application
            QuizQuestion(
                id: "w10-q6-20",
                question: "The gastrocnemius and soleus both insert via the calcaneal (Achilles) tendon. Their primary shared action is:",
                choices: [
                    "Dorsiflexion of the foot",
                    "Plantar flexion of the foot",
                    "Inversion of the foot",
                    "Knee flexion"
                ],
                correctIndex: 1,
                explanation: "Both the gastrocnemius and soleus plantar flex the foot (point toes downward). They share the calcaneal (Achilles) tendon, inserting on the calcaneus. The gastrocnemius also crosses the knee and can assist in knee flexion.",
                difficulty: .medium,
                category: .application
            )
        ],
        timeLimit: 2400  // 40 minutes
    )

    // =========================================================================
    // MARK: - FLASHCARD DECK: Appendicular Skeleton
    // =========================================================================

    static let deckAppendicularSkeleton = FlashcardDeck(
        id: "w9-deck-appendicular-skeleton",
        title: "Appendicular Skeleton",
        weekNumber: 9,
        category: "Skeletal System",
        cards: [
            Flashcard(id: "w9-fc-as01", front: "Humerus", back: "The single bone of the arm (brachium). Key landmarks: greater/lesser tubercles (rotator cuff attachments), deltoid tuberosity, capitulum (articulates with radius), trochlea (articulates with ulna).", hint: "The 'funny bone' area is actually the ulnar nerve near the humerus", repetition: w910SR),
            Flashcard(id: "w9-fc-as02", front: "Radius vs Ulna", back: "Radius: lateral (thumb side); disc-shaped head, styloid process distally. Ulna: medial (pinky side); olecranon (elbow point), trochlear notch, coronoid process.", hint: "Radius = Radio dial (thumb turns it)", repetition: w910SR),
            Flashcard(id: "w9-fc-as03", front: "Carpal Bones (8)", back: "Proximal row (lateral → medial): Scaphoid, Lunate, Triquetrum, Pisiform. Distal row: Trapezium, Trapezoid, Capitate, Hamate. Mnemonic: Some Lovers Try Positions That They Can't Handle.", hint: "8 bones, 2 rows of 4", repetition: w910SR),
            Flashcard(id: "w9-fc-as04", front: "Hand Bones", back: "5 metacarpals (palm) + 14 phalanges (thumb has 2; fingers 2-5 have 3 each: proximal, middle, distal).", hint: "Thumb is special — only 2 phalanges", repetition: w910SR),
            Flashcard(id: "w9-fc-as05", front: "Hip Bone (Os Coxa)", back: "Formed by fusion of 3 bones at the acetabulum: Ilium (superior, largest), Ischium (posteroinferior), Pubis (anteroinferior). They meet at the pubic symphysis anteriorly and sacroiliac joints posteriorly.", hint: "I-I-P: Ilium, Ischium, Pubis", repetition: w910SR),
            Flashcard(id: "w9-fc-as06", front: "Acetabulum & Obturator Foramen", back: "Acetabulum: deep socket receiving the femoral head; where ilium, ischium, and pubis fuse. Obturator foramen: largest foramen in the body, between ischium and pubis.", hint: "Acetabulum = 'vinegar cup' (Latin)", repetition: w910SR),
            Flashcard(id: "w9-fc-as07", front: "Male vs Female Pelvis", back: "Female: wider, shallower, round/oval inlet, subpubic angle >90°, wider ischial spines. Male: narrower, deeper, heart-shaped inlet, subpubic angle <90°. Female adaptations support childbirth.", hint: "Female = wider for baby delivery", repetition: w910SR),
            Flashcard(id: "w9-fc-as08", front: "Femur", back: "The longest, heaviest, strongest bone. Head fits into acetabulum. Key landmarks: greater trochanter (lateral, palpable), lesser trochanter, linea aspera (posterior ridge), lateral and medial condyles (knee).", hint: "Femur = FEMale pelvis connects here", repetition: w910SR),
            Flashcard(id: "w9-fc-as09", front: "Tibia vs Fibula", back: "Tibia: medial, weight-bearing; tibial tuberosity, medial malleolus (medial ankle bump). Fibula: lateral, non-weight-bearing; lateral malleolus (lateral ankle bump). Fibula is NOT part of the knee joint.", hint: "TiBia = Big (weight-bearing); FiBula = thin Fib (not weight-bearing)", repetition: w910SR),
            Flashcard(id: "w9-fc-as10", front: "Tarsal Bones (7)", back: "Calcaneus (heel bone, largest tarsal), Talus (articulates with tibia/fibula at ankle), plus navicular, cuboid, and 3 cuneiforms. Foot also has 5 metatarsals and 14 phalanges.", hint: "CaLcaneus = caL = heel", repetition: w910SR),
            Flashcard(id: "w9-fc-as11", front: "Patella", back: "The kneecap; a large sesamoid bone embedded in the quadriceps tendon. Protects the anterior knee joint and improves leverage for the quadriceps during knee extension.", hint: "Sesamoid = embedded in a tendon", repetition: w910SR),
            Flashcard(id: "w9-fc-as12", front: "Common Fracture Sites", back: "Colles fracture: distal radius (FOOSH, 'dinner fork' deformity). Hip fracture: femoral neck (elderly/osteoporosis, leg shortened + externally rotated). Ankle fracture: malleoli (twisting injury).", hint: "Colles = wrist; hip = elderly; ankle = twist", repetition: w910SR)
        ]
    )

    // =========================================================================
    // MARK: - FLASHCARD DECK: Joints & Movements
    // =========================================================================

    static let deckJointsAndMovements = FlashcardDeck(
        id: "w9-deck-joints-movements",
        title: "Joints & Movements",
        weekNumber: 9,
        category: "Joints",
        cards: [
            Flashcard(id: "w9-fc-jm01", front: "Three Structural Joint Types", back: "1) Fibrous — connected by dense CT, no cavity (sutures, syndesmoses, gomphoses). 2) Cartilaginous — united by cartilage, no cavity (synchondroses, symphyses). 3) Synovial — joint cavity with synovial fluid, most movable.", hint: "FCS: Fibrous, Cartilaginous, Synovial", repetition: w910SR),
            Flashcard(id: "w9-fc-jm02", front: "Functional Joint Classification", back: "Synarthrosis = immovable (sutures). Amphiarthrosis = slightly movable (symphyses). Diarthrosis = freely movable (all synovial joints).", hint: "Syn = no; Amphi = a little; Di = free", repetition: w910SR),
            Flashcard(id: "w9-fc-jm03", front: "Synovial Joint Components", back: "Articular cartilage (hyaline, avascular), articular capsule (fibrous layer + synovial membrane), synovial fluid (lubricates/nourishes), ligaments (bone to bone), bursae (reduce friction), and sometimes menisci.", hint: "6 features of synovial joints", repetition: w910SR),
            Flashcard(id: "w9-fc-jm04", front: "Six Types of Synovial Joints", back: "Plane (gliding), Hinge (elbow), Pivot (C1-C2), Condyloid (knuckles), Saddle (thumb CMC), Ball-and-socket (shoulder, hip). Ball-and-socket = greatest ROM.", hint: "Think of examples for each type", repetition: w910SR),
            Flashcard(id: "w9-fc-jm05", front: "Flexion vs Extension", back: "Flexion: decreases joint angle (bending). Extension: increases joint angle (straightening). Hyperextension: extension beyond anatomical position.", hint: "Flex = fold; Extend = straighten", repetition: w910SR),
            Flashcard(id: "w9-fc-jm06", front: "Abduction vs Adduction", back: "Abduction: movement AWAY from the midline. Adduction: movement TOWARD the midline. Remember: ABduct = ABducted (taken away).", hint: "ABduct = Away; ADDuct = ADD to midline", repetition: w910SR),
            Flashcard(id: "w9-fc-jm07", front: "Dorsiflexion vs Plantar Flexion", back: "Dorsiflexion: toes point UP (top/dorsum of foot toward shin). Plantar flexion: toes point DOWN (like standing on tiptoe; 'planting' the toe).", hint: "Dorsi = top; Plantar = sole/plant", repetition: w910SR),
            Flashcard(id: "w9-fc-jm08", front: "Inversion vs Eversion", back: "Inversion: sole of foot turns MEDIALLY (inward). Eversion: sole of foot turns LATERALLY (outward). Inversion sprains are most common.", hint: "INversion = IN; Eversion = Exit (out)", repetition: w910SR),
            Flashcard(id: "w9-fc-jm09", front: "Pronation vs Supination", back: "Pronation: palm faces DOWN/posteriorly (radius crosses over ulna). Supination: palm faces UP/anteriorly (radius and ulna parallel). Mnemonic: SUPination = holding a bowl of SOUP.", hint: "SUPinate = SOUP in your palm", repetition: w910SR),
            Flashcard(id: "w9-fc-jm10", front: "Circumduction", back: "A cone-shaped movement combining flexion, extension, abduction, and adduction in sequence. Occurs at ball-and-socket and condyloid joints (e.g., drawing a circle with your arm).", hint: "Circum = circle", repetition: w910SR),
            Flashcard(id: "w9-fc-jm11", front: "Ligament vs Tendon", back: "Ligament: connects BONE to BONE (stabilizes joints). Tendon: connects MUSCLE to BONE (transmits force). Both are dense regular connective tissue.", hint: nil, repetition: w910SR),
            Flashcard(id: "w9-fc-jm12", front: "Bursa", back: "A small, fluid-filled sac lined with synovial membrane. Located where tendons/muscles rub against bone. Reduces friction. Inflammation = bursitis.", hint: "Bursa = cushion pad", repetition: w910SR),
            Flashcard(id: "w9-fc-jm13", front: "Meniscus", back: "A wedge-shaped pad of fibrocartilage in certain joints (notably the knee). Improves joint fit, distributes weight, absorbs shock. The knee has medial and lateral menisci.", hint: "Meniscus tear = common knee injury", repetition: w910SR),
            Flashcard(id: "w9-fc-jm14", front: "Sprains vs Dislocations", back: "Sprain: stretching/tearing of LIGAMENTS (most common: ankle). Dislocation: bone forced out of normal joint position (most common: shoulder). EMTs: splint in position found, check CSM.", hint: "Sprain = ligament; Dislocation = out of place", repetition: w910SR),
            Flashcard(id: "w9-fc-jm15", front: "Rotation & Opposition", back: "Rotation: turning a bone around its own axis (medial = toward midline; lateral = away). Opposition: thumb touches other fingertips; unique to the saddle joint of the thumb.", hint: nil, repetition: w910SR)
        ]
    )

    // =========================================================================
    // MARK: - FLASHCARD DECK: Muscle Structure
    // =========================================================================

    static let deckMuscleStructure = FlashcardDeck(
        id: "w10-deck-muscle-structure",
        title: "Muscle Structure",
        weekNumber: 10,
        category: "Muscle Tissue",
        cards: [
            Flashcard(id: "w10-fc-ms01", front: "Three Muscle Types", back: "Skeletal: voluntary, striated, multinucleated, attached to bone. Cardiac: involuntary, striated, branched, intercalated discs, autorhythmic. Smooth: involuntary, non-striated, spindle-shaped, in hollow organs.", hint: "Only skeletal is voluntary", repetition: w910SR),
            Flashcard(id: "w10-fc-ms02", front: "Muscle CT Wrappings", back: "Epimysium: wraps entire muscle. Perimysium: wraps fascicles (bundles). Endomysium: wraps individual muscle fibers. Mnemonic: Epi = over all; Peri = around bundles; Endo = inside (each fiber).", hint: "EPI-PERI-ENDO from outside in", repetition: w910SR),
            Flashcard(id: "w10-fc-ms03", front: "Sarcomere Structure", back: "Z-disc to Z-disc = one sarcomere. Thin filaments (actin) anchor at Z-discs. Thick filaments (myosin) in center. A-band = dark (whole thick filament length). I-band = light (thin only). H-zone = center (thick only). M-line = very center.", hint: "Z-I-A-H-M-H-A-I-Z", repetition: w910SR),
            Flashcard(id: "w10-fc-ms04", front: "What Changes During Contraction?", back: "I-band SHORTENS (thin filaments overlap more). H-zone SHORTENS (thin filaments slide inward). A-band stays the SAME (thick filaments don't change length). Z-discs move CLOSER together.", hint: "A-band = Always the same", repetition: w910SR),
            Flashcard(id: "w10-fc-ms05", front: "Actin & Myosin", back: "Actin: thin filament protein; has binding sites for myosin; anchored at Z-discs. Myosin: thick filament protein; has heads that bind actin and pivot during power stroke.", hint: "Actin = thin; Myosin = thick (M = Massive)", repetition: w910SR),
            Flashcard(id: "w10-fc-ms06", front: "Tropomyosin & Troponin", back: "Tropomyosin: coiled protein on actin that BLOCKS myosin-binding sites at rest. Troponin: globular protein; when Ca²⁺ binds, it shifts tropomyosin to EXPOSE binding sites.", hint: "TropoMyosin = blocks Myosin; TropoNin = needs calciuN", repetition: w910SR),
            Flashcard(id: "w10-fc-ms07", front: "Sarcoplasmic Reticulum & T-Tubules", back: "SR: specialized smooth ER that stores Ca²⁺; releases Ca²⁺ to trigger contraction. T-tubules: inward extensions of the sarcolemma; carry action potentials deep into the fiber.", hint: "SR = calcium storage; T-tubules = telegraph signal inward", repetition: w910SR),
            Flashcard(id: "w10-fc-ms08", front: "Cross-Bridge Cycle (4 Steps)", back: "1) Cross-bridge formation: myosin head binds actin. 2) Power stroke: head pivots, pulls thin filament; ADP + Pi released. 3) Detachment: new ATP binds myosin head. 4) Re-cocking: ATP hydrolyzed, head returns to high-energy position.", hint: "Bind → Pull → Release → Reset", repetition: w910SR),
            Flashcard(id: "w10-fc-ms09", front: "Neuromuscular Junction (NMJ)", back: "Motor neuron axon terminal → releases ACh across synaptic cleft → binds motor end plate → Na⁺ influx → muscle action potential → T-tubules → SR releases Ca²⁺ → contraction. AChE breaks down ACh to stop signal.", hint: "ACh = neuromuscular messenger", repetition: w910SR),
            Flashcard(id: "w10-fc-ms10", front: "Motor Unit", back: "One motor neuron + all the muscle fibers it innervates. Small motor units (few fibers) = fine control (eye muscles). Large motor units (many fibers) = powerful movements (quadriceps).", hint: "Small unit = fine; Large unit = force", repetition: w910SR),
            Flashcard(id: "w10-fc-ms11", front: "Rigor Mortis", back: "After death, ATP production stops. Without ATP, myosin heads cannot detach from actin → muscles lock in contraction. Begins 2-4 hours post-death, lasts 24-48 hours until proteins decompose.", hint: "No ATP = permanent cross-bridges", repetition: w910SR),
            Flashcard(id: "w10-fc-ms12", front: "Muscle Fatigue", back: "Results from: ATP depletion, lactic acid accumulation, ionic/electrolyte imbalances, and depletion of glycogen. Managed with rest, hydration, and electrolyte replacement.", hint: "Not just one cause — multiple factors", repetition: w910SR)
        ]
    )

    // =========================================================================
    // MARK: - FLASHCARD DECK: Major Muscles
    // =========================================================================

    static let deckMajorMuscles = FlashcardDeck(
        id: "w10-deck-major-muscles",
        title: "Major Muscles",
        weekNumber: 10,
        category: "Muscular System",
        cards: [
            Flashcard(id: "w10-fc-mm01", front: "Agonist, Antagonist, Synergist, Fixator", back: "Agonist (prime mover): main muscle for a movement. Antagonist: opposes agonist (relaxes when agonist contracts). Synergist: assists agonist. Fixator: stabilizes the origin of the agonist.", hint: "Agonist does it; Antagonist opposes; Synergist helps; Fixator holds steady", repetition: w910SR),
            Flashcard(id: "w10-fc-mm02", front: "Origin vs Insertion", back: "Origin: less movable attachment (usually proximal). Insertion: more movable attachment (usually distal). The muscle pulls the insertion toward the origin during contraction.", hint: "Origin = stays put; Insertion = moves", repetition: w910SR),
            Flashcard(id: "w10-fc-mm03", front: "Orbicularis Oculi & Orbicularis Oris", back: "Orbicularis oculi: circular muscle around the eye; closes eyelid (blink/squint). Orbicularis oris: circular muscle around the mouth; closes/protrudes lips (kissing/whistling).", hint: "Orbicularis = circular; Oculi = eye; Oris = mouth", repetition: w910SR),
            Flashcard(id: "w10-fc-mm04", front: "Masseter", back: "Powerful jaw muscle that elevates the mandible (closes the jaw for chewing). One of the strongest muscles in the body relative to its size.", hint: "Masseter = mastication (chewing)", repetition: w910SR),
            Flashcard(id: "w10-fc-mm05", front: "Sternocleidomastoid (SCM)", back: "From sternum + clavicle to mastoid process. Bilateral contraction: flexes neck (chin to chest). Unilateral: rotates head to OPPOSITE side. Damage → torticollis (wry neck).", hint: "Named for its 3 attachment sites", repetition: w910SR),
            Flashcard(id: "w10-fc-mm06", front: "Trapezius", back: "Large, diamond-shaped muscle of upper back/neck. Actions: elevates, retracts, depresses the scapula; extends the head.", hint: "Trapezius = trapezoid shape", repetition: w910SR),
            Flashcard(id: "w10-fc-mm07", front: "Pectoralis Major & Latissimus Dorsi", back: "Pectoralis major (anterior chest): flexes, adducts, medially rotates arm. Latissimus dorsi (lower back): extends, adducts, medially rotates arm ('swimmer's muscle').", hint: "Pec = push; Lat = pull", repetition: w910SR),
            Flashcard(id: "w10-fc-mm08", front: "Rectus Abdominis & Obliques", back: "Rectus abdominis: 'six-pack'; flexes vertebral column. External oblique: largest lateral abdominal muscle; flexes/rotates trunk. Internal oblique & transversus abdominis deeper.", hint: "Rectus = straight; Oblique = diagonal", repetition: w910SR),
            Flashcard(id: "w10-fc-mm09", front: "Erector Spinae", back: "Three muscle columns along the vertebral column. Extends and laterally flexes the spine. Maintains upright posture. The main postural muscles of the back.", hint: "Erector = keeps you erect/upright", repetition: w910SR),
            Flashcard(id: "w10-fc-mm10", front: "Deltoid", back: "Thick, triangular muscle capping the shoulder. Middle fibers: abduct the arm. Anterior fibers: flex/medially rotate. Posterior fibers: extend/laterally rotate. Most common IM injection site.", hint: "Delta = triangle; Deltoid = triangular", repetition: w910SR),
            Flashcard(id: "w10-fc-mm11", front: "Biceps Brachii & Triceps Brachii", back: "Biceps brachii (anterior arm): flexes elbow, supinates forearm. 2 heads. Triceps brachii (posterior arm): extends elbow. 3 heads. They are agonist-antagonist pair at the elbow.", hint: "Bi = 2 heads; Tri = 3 heads", repetition: w910SR),
            Flashcard(id: "w10-fc-mm12", front: "Iliopsoas & Gluteus Maximus", back: "Iliopsoas (iliacus + psoas major): primary hip FLEXOR. Gluteus maximus: primary hip EXTENSOR and largest muscle in the body. They are agonist-antagonist pair at the hip.", hint: "Ilio = flexes; Glut max = extends", repetition: w910SR),
            Flashcard(id: "w10-fc-mm13", front: "Quadriceps vs Hamstrings", back: "Quadriceps (4 muscles, anterior thigh): extend the knee. Hamstrings (3 muscles, posterior thigh): flex the knee and extend the hip. Agonist-antagonist pair at the knee.", hint: "Quads = front = kick; Hams = back = curl", repetition: w910SR),
            Flashcard(id: "w10-fc-mm14", front: "Gastrocnemius, Soleus, & Tibialis Anterior", back: "Gastrocnemius (superficial calf): plantar flexes foot + flexes knee. Soleus (deep calf): plantar flexes foot. Both share Achilles tendon. Tibialis anterior (front of leg): dorsiflexes + inverts foot.", hint: "Gastroc/soleus = push off; Tib anterior = pull up", repetition: w910SR),
            Flashcard(id: "w10-fc-mm15", front: "IM Injection Sites (4)", back: "1) Deltoid — most common for vaccines. 2) Ventrogluteal (gluteus medius) — preferred for adults (large volume). 3) Vastus lateralis — preferred for infants. 4) Dorsogluteal (gluteus maximus) — least preferred (sciatic nerve risk).", hint: "D-V-V-D: Deltoid, Ventro, Vastus, Dorso", repetition: w910SR)
        ]
    )
}
