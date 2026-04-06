import Foundation

// MARK: - Course Content for Bio 40A, Week 11
// Muscular System Part 2 (Ch 11), Practice Midterm 3, Comprehensive Final Exam

extension CourseContent {

    // MARK: - Convenience alias
    private static let w11SR = Flashcard.SpacedRepetitionData()

    // MARK: - Lessons Week 11
    static let lessonsWeek11: [Lesson] = [lesson18]

    // MARK: - Quizzes Week 11
    static let quizzesWeek11: [Quiz] = [quizWeek11]

    // MARK: - Practice Exams Week 11
    static let practiceExamsWeek11: [Quiz] = [practiceMidterm3, comprehensiveFinalExam]

    // MARK: - Flashcard Decks Week 11
    static let flashcardDecksWeek11: [FlashcardDeck] = [
        deckMusclePhysiologyMetabolism
    ]

    // =========================================================================
    // MARK: - LESSON 18: Muscular System Part 2 (Week 11, Mon Jun 15, Ch 11)
    // =========================================================================

    static let lesson18 = Lesson(
        id: "w11-lesson-18",
        weekNumber: 11,
        classNumber: 18,
        title: "Muscular System Part 2",
        subtitle: "Lever systems, muscle metabolism, fiber types, and smooth/cardiac muscle",
        textbookChapter: "Chapter 11",
        textbookSections: "11.5 - 11.10",
        sections: [
            // Section 1 — Muscle Actions and Lever Systems
            LessonSection(
                id: "w11-l18-s1",
                heading: "Muscle Actions and Lever Systems",
                content: """
                Skeletal muscles produce movement by pulling on bones across joints. Every movement involves a \
                lever system composed of three elements: the lever (the bone), the fulcrum (the joint), and the \
                effort (the muscle contraction force) acting against a resistance (the load being moved). Lever \
                systems are classified by the relative positions of these three elements.

                In a first-class lever, the fulcrum is located between the effort and the resistance, like a \
                seesaw. An example in the body is nodding the head: the atlanto-occipital joint (fulcrum) is \
                between the posterior neck muscles (effort) and the weight of the face (resistance). First-class \
                levers can favor either speed or force depending on the relative distances.

                In a second-class lever, the resistance is between the fulcrum and the effort, like a \
                wheelbarrow. The classic body example is standing on tiptoe: the ball of the foot is the \
                fulcrum, body weight is the resistance, and the calf muscles (gastrocnemius) pulling on the \
                calcaneus via the Achilles tendon provide the effort. Second-class levers always favor force \
                over speed.

                In a third-class lever, the effort is between the fulcrum and the resistance. This is the \
                most common lever type in the body. An example is flexing the forearm: the elbow joint is \
                the fulcrum, the biceps brachii inserts on the radial tuberosity (effort between fulcrum and \
                load), and the weight in the hand is the resistance. Third-class levers favor speed and range \
                of motion over force.

                Muscles can also be classified by their actions relative to a joint movement. The prime mover \
                (agonist) is the muscle primarily responsible for producing a specific movement. A synergist \
                assists the prime mover or stabilizes a joint. An antagonist opposes the prime mover and must \
                relax to allow the movement. A fixator stabilizes the origin of the prime mover so that the \
                effort is directed efficiently.
                """,
                keyTerms: [
                    KeyTerm(id: "w11-l18s1-k1", term: "Lever", definition: "A rigid structure (bone) that moves around a fixed point (fulcrum/joint) when force is applied."),
                    KeyTerm(id: "w11-l18s1-k2", term: "Fulcrum", definition: "The pivot point of a lever; in the body, the joint around which the bone rotates."),
                    KeyTerm(id: "w11-l18s1-k3", term: "First-Class Lever", definition: "Lever arrangement with the fulcrum between effort and resistance (e.g., nodding the head at the atlanto-occipital joint)."),
                    KeyTerm(id: "w11-l18s1-k4", term: "Second-Class Lever", definition: "Lever arrangement with the resistance between the fulcrum and effort (e.g., standing on tiptoe); favors force."),
                    KeyTerm(id: "w11-l18s1-k5", term: "Third-Class Lever", definition: "Lever arrangement with the effort between the fulcrum and resistance (e.g., biceps flexing forearm); the most common type in the body; favors speed and range of motion.")
                ],
                testablesFacts: [
                    "The three elements of a lever system are the lever (bone), fulcrum (joint), and effort (muscle force) acting against resistance (load).",
                    "First-class lever: fulcrum between effort and resistance (e.g., head nodding).",
                    "Second-class lever: resistance between fulcrum and effort (e.g., standing on tiptoe); favors force.",
                    "Third-class lever: effort between fulcrum and resistance (e.g., biceps curl); most common in the body; favors speed and range of motion.",
                    "Agonist = prime mover; synergist = assists; antagonist = opposes; fixator = stabilizes origin."
                ]
            ),
            // Section 2 — Muscle Metabolism
            LessonSection(
                id: "w11-l18-s2",
                heading: "Muscle Metabolism: ATP Sources",
                content: """
                Muscle contraction requires a continuous supply of ATP. At rest, a muscle fiber stores only \
                enough ATP for about 4-6 seconds of maximal contraction. The body uses three metabolic pathways \
                to regenerate ATP, each dominating at different stages of activity.

                The first and fastest source is the creatine phosphate (CP) system (also called the \
                phosphagen system). Creatine phosphate is a high-energy molecule stored in muscle fibers. The \
                enzyme creatine kinase transfers a phosphate group from CP to ADP, rapidly regenerating ATP. \
                This system provides energy for approximately 10-15 seconds of intense activity (such as a \
                short sprint or a heavy lift). It does not require oxygen and does not produce lactic acid.

                The second pathway is anaerobic glycolysis. When CP reserves are depleted, the muscle begins \
                breaking down glucose (from blood glucose or stored glycogen) to pyruvic acid. In the absence \
                of sufficient oxygen, pyruvic acid is converted to lactic acid. Anaerobic glycolysis yields \
                only 2 ATP per glucose molecule (compared to ~36 ATP from aerobic respiration) but can generate \
                ATP quickly without oxygen. It sustains intense activity for approximately 30-60 seconds. The \
                accumulation of lactic acid and H+ ions contributes to the burning sensation and fatigue.

                The third and most efficient pathway is aerobic respiration (oxidative phosphorylation). This \
                occurs in the mitochondria and requires oxygen. Glucose, fatty acids, and sometimes amino acids \
                are fully oxidized through glycolysis, the Krebs cycle, and the electron transport chain to \
                yield approximately 36 ATP per glucose molecule. Aerobic respiration is the dominant ATP source \
                for activities lasting longer than about 2 minutes (endurance activities such as walking, \
                jogging, or swimming). It produces CO2 and H2O as waste products.
                """,
                keyTerms: [
                    KeyTerm(id: "w11-l18s2-k1", term: "Creatine Phosphate", definition: "A high-energy molecule stored in muscle that rapidly regenerates ATP via the creatine kinase reaction; provides energy for ~10-15 seconds of intense activity."),
                    KeyTerm(id: "w11-l18s2-k2", term: "Anaerobic Glycolysis", definition: "Breakdown of glucose to lactic acid without oxygen; yields 2 ATP per glucose; sustains intense activity for ~30-60 seconds."),
                    KeyTerm(id: "w11-l18s2-k3", term: "Aerobic Respiration", definition: "Complete oxidation of fuels (glucose, fatty acids) in mitochondria using oxygen; yields ~36 ATP per glucose; dominant for endurance activities."),
                    KeyTerm(id: "w11-l18s2-k4", term: "Lactic Acid", definition: "A byproduct of anaerobic glycolysis; accumulation contributes to muscle burning and fatigue; later converted back to pyruvic acid or glucose in the liver.")
                ],
                testablesFacts: [
                    "Stored ATP in muscle lasts only 4-6 seconds of maximal activity.",
                    "Creatine phosphate provides the fastest ATP regeneration (~10-15 seconds) without O2 or lactic acid.",
                    "Anaerobic glycolysis yields 2 ATP per glucose, produces lactic acid, and sustains ~30-60 seconds of intense activity.",
                    "Aerobic respiration yields ~36 ATP per glucose, requires O2, and dominates during endurance activities (>2 minutes).",
                    "The three ATP sources in order of speed: creatine phosphate > anaerobic glycolysis > aerobic respiration."
                ]
            ),
            // Section 3 — Muscle Fatigue and Oxygen Debt
            LessonSection(
                id: "w11-l18-s3",
                heading: "Muscle Fatigue and Oxygen Debt",
                content: """
                Muscle fatigue is the inability of a muscle to maintain its force of contraction after prolonged \
                activity. Fatigue has multiple causes depending on the type of activity. During short, intense \
                exercise, fatigue is largely due to accumulation of lactic acid and inorganic phosphate (Pi) in \
                the muscle fibers, which interfere with cross-bridge cycling and calcium release from the \
                sarcoplasmic reticulum. During prolonged, moderate exercise, fatigue results primarily from \
                depletion of glycogen stores and glucose, as well as electrolyte imbalances. Central fatigue \
                (originating in the central nervous system) also contributes, as the brain reduces motor neuron \
                output to protect the body from damage.

                Oxygen debt (more accurately called excess post-exercise oxygen consumption, or EPOC) refers \
                to the extra oxygen the body needs after exercise to restore itself to the pre-exercise resting \
                state. After vigorous activity, the body must: (1) replenish ATP and creatine phosphate stores, \
                (2) convert lactic acid back to pyruvic acid and then to glucose in the liver (the Cori cycle), \
                (3) replenish myoglobin's oxygen stores, and (4) return the elevated metabolic rate, heart rate, \
                and breathing rate to resting levels. This is why you continue to breathe heavily after exercise \
                even though the activity has stopped.

                Contraction types also affect fatigue patterns. In isotonic (dynamic) contractions, the muscle \
                changes length while maintaining relatively constant tension. Isotonic contractions have two \
                phases: concentric contraction, where the muscle shortens (e.g., lifting a dumbbell during a \
                biceps curl), and eccentric contraction, where the muscle lengthens under tension (e.g., slowly \
                lowering the dumbbell). In isometric (static) contractions, the muscle generates tension but \
                does not change length (e.g., holding a heavy box at arm's length or pushing against a wall). \
                Isometric contractions can fatigue muscles rapidly because sustained contraction compresses \
                blood vessels, reducing oxygen delivery.
                """,
                keyTerms: [
                    KeyTerm(id: "w11-l18s3-k1", term: "Oxygen Debt (EPOC)", definition: "The extra oxygen consumed after exercise to restore ATP, CP, and myoglobin oxygen stores, convert lactic acid, and return metabolic rate to resting levels."),
                    KeyTerm(id: "w11-l18s3-k2", term: "Isotonic Contraction", definition: "A contraction in which the muscle changes length while maintaining relatively constant tension; includes concentric (shortening) and eccentric (lengthening) phases."),
                    KeyTerm(id: "w11-l18s3-k3", term: "Isometric Contraction", definition: "A contraction in which the muscle generates tension without changing length (e.g., holding a static position)."),
                    KeyTerm(id: "w11-l18s3-k4", term: "Concentric Contraction", definition: "An isotonic contraction in which the muscle shortens as it contracts (e.g., the lifting phase of a biceps curl)."),
                    KeyTerm(id: "w11-l18s3-k5", term: "Eccentric Contraction", definition: "An isotonic contraction in which the muscle lengthens under tension (e.g., slowly lowering a weight); causes more muscle soreness (DOMS).")
                ],
                testablesFacts: [
                    "Muscle fatigue during intense exercise is primarily caused by lactic acid and inorganic phosphate accumulation.",
                    "Fatigue during prolonged exercise is mainly due to glycogen depletion.",
                    "Oxygen debt (EPOC) = extra O2 needed after exercise to restore ATP, CP, myoglobin O2, and convert lactic acid.",
                    "Isotonic contractions change muscle length (concentric = shortening, eccentric = lengthening).",
                    "Isometric contractions generate tension without changing muscle length."
                ]
            ),
            // Section 4 — Exercise Physiology: Fiber Types
            LessonSection(
                id: "w11-l18-s4",
                heading: "Exercise Physiology: Muscle Fiber Types",
                content: """
                Skeletal muscle fibers are not all identical. They differ in their speed of contraction, \
                metabolic pathways, and resistance to fatigue. There are three main types:

                Type I fibers (slow-twitch, slow oxidative fibers) contract slowly but are highly resistant to \
                fatigue. They are rich in mitochondria, myoglobin (giving them a red color), and capillaries. \
                They rely primarily on aerobic respiration for ATP production. Type I fibers are dominant in \
                postural muscles (such as the erector spinae) and are the primary fibers recruited during \
                endurance activities (marathon running, cycling, swimming long distances).

                Type IIa fibers (fast-twitch oxidative-glycolytic, intermediate fibers) contract quickly and \
                have moderate resistance to fatigue. They use both aerobic and anaerobic metabolism. These fibers \
                are recruited for activities requiring both speed and endurance, such as middle-distance running \
                (400-800 meters) or sustained high-intensity sports.

                Type IIb fibers (also called Type IIx; fast-twitch glycolytic fibers) contract the fastest and \
                generate the most force but fatigue rapidly. They have few mitochondria, low myoglobin content \
                (hence appear white or pale), and rely primarily on anaerobic glycolysis. They are recruited \
                during short, explosive activities such as sprinting, jumping, or heavy weightlifting.

                All individuals have a genetic mixture of fiber types, but the ratio varies. Endurance athletes \
                tend to have a higher proportion of Type I fibers, while sprinters and power athletes have more \
                Type II fibers. Training can shift some Type IIb fibers toward a Type IIa profile (increasing \
                their oxidative capacity) but cannot convert Type II to Type I or vice versa.
                """,
                keyTerms: [
                    KeyTerm(id: "w11-l18s4-k1", term: "Slow-Twitch (Type I) Fibers", definition: "Red muscle fibers rich in mitochondria and myoglobin; use aerobic respiration; resistant to fatigue; dominant in endurance activities and postural muscles."),
                    KeyTerm(id: "w11-l18s4-k2", term: "Fast-Twitch Type IIa Fibers", definition: "Intermediate muscle fibers that use both aerobic and anaerobic metabolism; moderate fatigue resistance; recruited for sustained high-intensity activities."),
                    KeyTerm(id: "w11-l18s4-k3", term: "Fast-Twitch Type IIb (IIx) Fibers", definition: "White/pale muscle fibers with few mitochondria; rely on anaerobic glycolysis; generate maximum force but fatigue rapidly; used for sprinting and power activities.")
                ],
                testablesFacts: [
                    "Type I (slow-twitch): red, aerobic, fatigue-resistant, rich in mitochondria and myoglobin; used for endurance.",
                    "Type IIa (fast oxidative-glycolytic): intermediate; uses both aerobic and anaerobic pathways; moderate fatigue resistance.",
                    "Type IIb/IIx (fast glycolytic): white/pale, anaerobic, powerful but fatigues rapidly; used for explosive activities.",
                    "The genetic ratio of fiber types determines athletic predisposition but training can shift IIb → IIa.",
                    "You cannot convert Type I to Type II or vice versa through training."
                ]
            ),
            // Section 5 — Smooth Muscle and Cardiac Muscle Physiology
            LessonSection(
                id: "w11-l18-s5",
                heading: "Smooth Muscle and Cardiac Muscle Physiology",
                content: """
                Smooth muscle differs from skeletal muscle in several important ways. Smooth muscle cells are \
                spindle-shaped, uninucleated, and lack striations because their actin and myosin filaments are \
                not organized into sarcomeres. Instead, actin filaments attach to dense bodies scattered \
                throughout the cytoplasm and along the cell membrane. When myosin pulls on actin, the cell \
                contracts by shortening in a twisting, corkscrew-like fashion.

                Smooth muscle contraction is initiated by calcium ions, but the mechanism differs from skeletal \
                muscle. Instead of troponin, smooth muscle uses calmodulin to activate cross-bridge cycling. \
                Calcium binds to calmodulin, which activates myosin light-chain kinase (MLCK), which \
                phosphorylates the myosin head to enable it to bind actin.

                Smooth muscle has two major types: single-unit (visceral) smooth muscle, in which cells are \
                connected by gap junctions and contract as a coordinated sheet (found in the walls of the GI \
                tract, uterus, and urinary bladder), and multi-unit smooth muscle, in which each fiber is \
                independently innervated (found in the iris of the eye, walls of large airways, and arrector \
                pili muscles).

                Cardiac muscle shares some properties with both skeletal and smooth muscle. Like skeletal \
                muscle, it is striated and uses the troponin-tropomyosin system. Like smooth muscle, it is \
                involuntary. Unique features of cardiac muscle include autorhythmicity (pacemaker cells generate \
                their own action potentials without nervous system input), a long refractory period that \
                prevents tetanic contraction (ensuring the heart relaxes between beats), and intercalated discs \
                with gap junctions that allow rapid electrical conduction so the heart contracts as a functional \
                syncytium.
                """,
                keyTerms: [
                    KeyTerm(id: "w11-l18s5-k1", term: "Dense Bodies", definition: "Anchoring points in smooth muscle cells where actin filaments attach; analogous to Z-discs in skeletal muscle."),
                    KeyTerm(id: "w11-l18s5-k2", term: "Calmodulin", definition: "A calcium-binding protein in smooth muscle that activates myosin light-chain kinase (MLCK) to initiate contraction; replaces troponin's role in skeletal muscle."),
                    KeyTerm(id: "w11-l18s5-k3", term: "Single-Unit Smooth Muscle", definition: "Visceral smooth muscle with gap junctions allowing coordinated contraction as a sheet; found in GI tract, uterus, urinary bladder."),
                    KeyTerm(id: "w11-l18s5-k4", term: "Multi-Unit Smooth Muscle", definition: "Smooth muscle with independently innervated fibers; found in the iris, large airways, and arrector pili muscles."),
                    KeyTerm(id: "w11-l18s5-k5", term: "Autorhythmicity", definition: "The ability of cardiac muscle pacemaker cells to generate their own action potentials without nervous system input.")
                ],
                testablesFacts: [
                    "Smooth muscle lacks striations because actin and myosin are not arranged in sarcomeres.",
                    "Smooth muscle uses calmodulin (not troponin) to regulate contraction.",
                    "Single-unit smooth muscle has gap junctions and contracts as a coordinated sheet (visceral organs).",
                    "Multi-unit smooth muscle fibers are independently innervated (iris, large airways, arrector pili).",
                    "Cardiac muscle is striated, involuntary, autorhythmic, and has a long refractory period to prevent tetanus.",
                    "Intercalated discs with gap junctions allow the heart to contract as a functional syncytium."
                ]
            )
        ],
        clinicalApplication: ClinicalApplication(
            title: "Muscle Injuries: Strains, Cramps, and Compartment Syndrome",
            scenario: "A 28-year-old construction worker presents with severe, worsening pain and tightness in his lower leg after being struck by a falling tool. The leg is swollen, tense to the touch, and the patient reports numbness in the foot.",
            connection: "This presentation is consistent with acute compartment syndrome — a condition where swelling within a fascial compartment increases pressure to dangerous levels, compressing blood vessels and nerves. Unlike a simple strain (overstretching or tearing of muscle fibers) or muscle cramp (involuntary sustained contraction from electrolyte imbalance or fatigue), compartment syndrome is a surgical emergency. As an EMT, the key signs to recognize are the 5 P's: Pain (out of proportion to injury), Pallor, Pulselessness, Paresthesia (numbness/tingling), and Paralysis. Prompt recognition and transport for fasciotomy is critical to prevent permanent muscle death and limb loss."
        )
    )

    // =========================================================================
    // MARK: - QUIZ: Week 11 Quiz
    // =========================================================================

    static let quizWeek11 = Quiz(
        id: "w11-quiz",
        title: "Week 11: Muscular System Part 2",
        weekNumber: 11,
        lessonIds: ["w11-lesson-18"],
        questions: [
            QuizQuestion(
                id: "w11-q1",
                question: "In a third-class lever, where is the effort (muscle insertion) located?",
                choices: [
                    "Between the fulcrum and the resistance",
                    "At the same point as the fulcrum",
                    "Beyond the resistance, farthest from the fulcrum",
                    "At the resistance point"
                ],
                correctIndex: 0,
                explanation: "In a third-class lever, the effort is between the fulcrum and the resistance. This is the most common lever type in the body (e.g., biceps curl).",
                difficulty: .easy,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-q2",
                question: "Which ATP-generating pathway provides energy for the first 10-15 seconds of intense activity?",
                choices: [
                    "Aerobic respiration",
                    "Anaerobic glycolysis",
                    "The creatine phosphate (phosphagen) system",
                    "Beta-oxidation of fatty acids"
                ],
                correctIndex: 2,
                explanation: "The creatine phosphate system is the fastest way to regenerate ATP. Creatine kinase transfers a phosphate from CP to ADP, providing ~10-15 seconds of energy for intense activity.",
                difficulty: .easy,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-q3",
                question: "Anaerobic glycolysis yields how many ATP molecules per glucose?",
                choices: [
                    "36",
                    "2",
                    "4",
                    "18"
                ],
                correctIndex: 1,
                explanation: "Anaerobic glycolysis yields a net of 2 ATP per glucose molecule. This is far less efficient than aerobic respiration (~36 ATP) but can generate ATP quickly without oxygen.",
                difficulty: .easy,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-q4",
                question: "Type I (slow-twitch) muscle fibers are best suited for which type of activity?",
                choices: [
                    "Sprinting 100 meters",
                    "A single maximal deadlift",
                    "Marathon running",
                    "Throwing a javelin"
                ],
                correctIndex: 2,
                explanation: "Type I fibers are slow-twitch, aerobic, fatigue-resistant fibers rich in mitochondria and myoglobin. They are ideal for endurance activities like marathon running.",
                difficulty: .easy,
                category: .application
            ),
            QuizQuestion(
                id: "w11-q5",
                question: "Standing on tiptoe is an example of which class of lever?",
                choices: [
                    "First-class lever",
                    "Second-class lever",
                    "Third-class lever",
                    "It does not involve a lever system"
                ],
                correctIndex: 1,
                explanation: "Standing on tiptoe is a second-class lever: the fulcrum is at the ball of the foot, body weight (resistance) is in the middle, and the calf muscles pulling on the calcaneus provide the effort.",
                difficulty: .medium,
                category: .application
            ),
            QuizQuestion(
                id: "w11-q6",
                question: "After intense exercise, the body continues to consume extra oxygen (EPOC) in order to:",
                choices: [
                    "Build new muscle fibers",
                    "Replenish ATP and creatine phosphate stores and convert lactic acid back to glucose",
                    "Digest protein for muscle growth",
                    "Increase blood volume permanently"
                ],
                correctIndex: 1,
                explanation: "EPOC (oxygen debt) represents the extra oxygen needed to restore ATP and CP stores, reconvert lactic acid to glucose (Cori cycle), replenish myoglobin oxygen, and return metabolic rate to resting levels.",
                difficulty: .medium,
                category: .application
            ),
            QuizQuestion(
                id: "w11-q7",
                question: "Which type of muscle contraction occurs when you slowly lower a heavy box to the ground?",
                choices: [
                    "Isometric contraction",
                    "Concentric contraction",
                    "Eccentric contraction",
                    "Tetanic contraction"
                ],
                correctIndex: 2,
                explanation: "Slowly lowering a weight is an eccentric (isotonic) contraction — the muscle lengthens under tension while controlling the descent. Eccentric contractions cause more delayed-onset muscle soreness (DOMS).",
                difficulty: .medium,
                category: .application
            ),
            QuizQuestion(
                id: "w11-q8",
                question: "Smooth muscle contraction is regulated by calcium binding to which protein?",
                choices: [
                    "Troponin",
                    "Tropomyosin",
                    "Calmodulin",
                    "Titin"
                ],
                correctIndex: 2,
                explanation: "In smooth muscle, calcium binds to calmodulin (not troponin). The Ca²⁺-calmodulin complex activates myosin light-chain kinase (MLCK), which phosphorylates the myosin head to enable cross-bridge cycling.",
                difficulty: .medium,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-q9",
                question: "Why can cardiac muscle NOT undergo tetanic contraction?",
                choices: [
                    "It lacks actin and myosin filaments",
                    "It has a long refractory period that prevents summation of contractions",
                    "It is not innervated by motor neurons",
                    "It lacks calcium channels"
                ],
                correctIndex: 1,
                explanation: "Cardiac muscle has a prolonged refractory period (the cell cannot be re-stimulated until it has nearly fully relaxed). This prevents tetanus and ensures the heart relaxes between beats to refill with blood.",
                difficulty: .hard,
                category: .analysis
            ),
            QuizQuestion(
                id: "w11-q10",
                question: "A patient presents with severe lower leg pain, swelling, numbness, and absent pulses after a crush injury. Which condition is most likely?",
                choices: [
                    "Muscle strain",
                    "Muscle cramp from dehydration",
                    "Acute compartment syndrome",
                    "Delayed-onset muscle soreness (DOMS)"
                ],
                correctIndex: 2,
                explanation: "The 5 P's — Pain (out of proportion), Pallor, Pulselessness, Paresthesia, and Paralysis — are hallmarks of acute compartment syndrome, a surgical emergency requiring fasciotomy.",
                difficulty: .hard,
                category: .clinical
            )
        ],
        timeLimit: nil
    )

    // =========================================================================
    // MARK: - PRACTICE MIDTERM 3 (50 Questions, Weeks 7-11)
    // =========================================================================

    static let practiceMidterm3 = Quiz(
        id: "w11-practice-midterm-3",
        title: "Practice Midterm 3",
        weekNumber: 0,
        lessonIds: ["w11-lesson-18"],
        questions: [
            // ===== BONE TISSUE (Easy) =====
            QuizQuestion(
                id: "w11-pm3-01",
                question: "Which type of bone cell is responsible for building new bone tissue by secreting osteoid?",
                choices: [
                    "Osteoclast",
                    "Osteocyte",
                    "Osteoblast",
                    "Osteogenic cell"
                ],
                correctIndex: 2,
                explanation: "Osteoblasts are the bone-building cells that secrete osteoid (the organic matrix of bone) which then becomes mineralized. Osteoclasts break down bone; osteocytes are mature bone cells trapped in lacunae.",
                difficulty: .easy,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-pm3-02",
                question: "The structural unit of compact bone is the:",
                choices: [
                    "Trabecula",
                    "Osteon (Haversian system)",
                    "Lamella",
                    "Epiphyseal plate"
                ],
                correctIndex: 1,
                explanation: "The osteon (Haversian system) is the structural unit of compact bone. It consists of concentric lamellae surrounding a central (Haversian) canal containing blood vessels and nerves.",
                difficulty: .easy,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-pm3-03",
                question: "Spongy (cancellous) bone is composed of a network of thin plates called:",
                choices: [
                    "Osteons",
                    "Lamellae",
                    "Trabeculae",
                    "Canaliculi"
                ],
                correctIndex: 2,
                explanation: "Spongy bone consists of trabeculae — thin, branching plates of bone arranged along lines of stress. The spaces between trabeculae are filled with red bone marrow.",
                difficulty: .easy,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-pm3-04",
                question: "The process by which bone forms directly from mesenchyme (without a cartilage model) is called:",
                choices: [
                    "Endochondral ossification",
                    "Intramembranous ossification",
                    "Appositional growth",
                    "Epiphyseal ossification"
                ],
                correctIndex: 1,
                explanation: "Intramembranous ossification forms bone directly from mesenchymal tissue without a cartilage model. This is how flat bones of the skull, the mandible, and the clavicle develop.",
                difficulty: .easy,
                category: .recall
            ),
            // ===== BONE TISSUE (Medium) =====
            QuizQuestion(
                id: "w11-pm3-05",
                question: "During endochondral ossification, the cartilage model is replaced by bone. Lengthening of long bones occurs at the:",
                choices: [
                    "Periosteum",
                    "Endosteum",
                    "Epiphyseal (growth) plate",
                    "Articular cartilage"
                ],
                correctIndex: 2,
                explanation: "The epiphyseal plate (growth plate) is a layer of hyaline cartilage between the epiphysis and diaphysis where chondrocytes proliferate, allowing long bones to lengthen during growth.",
                difficulty: .medium,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-pm3-06",
                question: "Which bone cells are multinucleated giant cells derived from monocytes that resorb bone tissue?",
                choices: [
                    "Osteoblasts",
                    "Osteocytes",
                    "Osteogenic cells",
                    "Osteoclasts"
                ],
                correctIndex: 3,
                explanation: "Osteoclasts are large, multinucleated cells derived from monocyte/macrophage lineage. They secrete hydrochloric acid and lysosomal enzymes to dissolve the mineral and organic components of bone (bone resorption).",
                difficulty: .medium,
                category: .recall
            ),
            // ===== SKELETAL SYSTEM (Easy) =====
            QuizQuestion(
                id: "w11-pm3-07",
                question: "How many bones are in the adult human skeleton?",
                choices: [
                    "186",
                    "206",
                    "226",
                    "256"
                ],
                correctIndex: 1,
                explanation: "The adult human skeleton contains 206 bones, divided into the axial skeleton (80 bones) and the appendicular skeleton (126 bones).",
                difficulty: .easy,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-pm3-08",
                question: "The frontal, parietal, temporal, and occipital bones make up the:",
                choices: [
                    "Facial bones",
                    "Cranial vault (calvaria)",
                    "Vertebral column",
                    "Appendicular skeleton"
                ],
                correctIndex: 1,
                explanation: "The frontal, parietal (2), temporal (2), and occipital bones are cranial bones that form the cranial vault (calvaria), which encloses and protects the brain.",
                difficulty: .easy,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-pm3-09",
                question: "The vertebral column is divided into five regions. From superior to inferior, the correct order is:",
                choices: [
                    "Cervical, lumbar, thoracic, sacral, coccygeal",
                    "Cervical, thoracic, lumbar, sacral, coccygeal",
                    "Thoracic, cervical, lumbar, sacral, coccygeal",
                    "Cervical, thoracic, sacral, lumbar, coccygeal"
                ],
                correctIndex: 1,
                explanation: "From top to bottom: cervical (7 vertebrae), thoracic (12), lumbar (5), sacral (5 fused = sacrum), and coccygeal (3-5 fused = coccyx).",
                difficulty: .easy,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-pm3-10",
                question: "The atlas (C1) is unique because it:",
                choices: [
                    "Has a dens (odontoid process)",
                    "Has no body (no centrum) and allows nodding of the head",
                    "Is the largest cervical vertebra",
                    "Articulates with the sternum"
                ],
                correctIndex: 1,
                explanation: "The atlas (C1) lacks a vertebral body. It is a ring of bone that supports the skull. The atlanto-occipital joint allows flexion/extension (nodding 'yes'). The dens belongs to C2 (axis).",
                difficulty: .easy,
                category: .recall
            ),
            // ===== SKELETAL SYSTEM (Medium) =====
            QuizQuestion(
                id: "w11-pm3-11",
                question: "Which bone contains the sella turcica, a saddle-shaped depression that houses the pituitary gland?",
                choices: [
                    "Frontal bone",
                    "Ethmoid bone",
                    "Sphenoid bone",
                    "Temporal bone"
                ],
                correctIndex: 2,
                explanation: "The sphenoid bone contains the sella turcica (Turkish saddle), a bony depression in the middle cranial fossa that houses and protects the pituitary gland.",
                difficulty: .medium,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-pm3-12",
                question: "The intervertebral discs are made of fibrocartilage and consist of a tough outer ring called the ______ and a gel-like center called the ______.",
                choices: [
                    "Annulus fibrosus; nucleus pulposus",
                    "Nucleus pulposus; annulus fibrosus",
                    "Articular cartilage; synovial cavity",
                    "Periosteum; endosteum"
                ],
                correctIndex: 0,
                explanation: "The annulus fibrosus is the tough outer ring of fibrocartilage, and the nucleus pulposus is the gel-like center that absorbs compression. A herniated disc occurs when the nucleus pulposus protrudes through the annulus fibrosus.",
                difficulty: .medium,
                category: .recall
            ),
            // ===== JOINTS (Easy) =====
            QuizQuestion(
                id: "w11-pm3-13",
                question: "Synovial joints are classified as which functional type?",
                choices: [
                    "Synarthrosis (immovable)",
                    "Amphiarthrosis (slightly movable)",
                    "Diarthrosis (freely movable)",
                    "Fibrous"
                ],
                correctIndex: 2,
                explanation: "Synovial joints are diarthroses (freely movable joints). They have a joint cavity filled with synovial fluid, articular cartilage, and a fibrous joint capsule.",
                difficulty: .easy,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-pm3-14",
                question: "Flexion at the elbow joint involves:",
                choices: [
                    "Increasing the angle between the forearm and the arm",
                    "Decreasing the angle between the forearm and the arm",
                    "Rotating the forearm medially",
                    "Moving the forearm away from the body"
                ],
                correctIndex: 1,
                explanation: "Flexion is the movement that decreases the angle between two bones at a joint. Flexion at the elbow brings the forearm closer to the arm. Extension would increase the angle.",
                difficulty: .easy,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-pm3-15",
                question: "The knee joint is classified as which type of synovial joint?",
                choices: [
                    "Ball-and-socket joint",
                    "Pivot joint",
                    "Hinge joint",
                    "Saddle joint"
                ],
                correctIndex: 2,
                explanation: "The knee is primarily a hinge joint (also called a modified hinge), allowing mainly flexion and extension. Ball-and-socket joints (hip, shoulder) allow the widest range of motion.",
                difficulty: .easy,
                category: .recall
            ),
            // ===== JOINTS (Medium) =====
            QuizQuestion(
                id: "w11-pm3-16",
                question: "Abduction is defined as:",
                choices: [
                    "Movement toward the midline of the body",
                    "Movement away from the midline of the body",
                    "Rotation of the forearm so the palm faces posteriorly",
                    "Bending a joint to decrease the angle between bones"
                ],
                correctIndex: 1,
                explanation: "Abduction moves a limb away from the midline of the body (e.g., raising the arm laterally). Adduction moves it toward the midline. Pronation turns the palm posteriorly.",
                difficulty: .medium,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-pm3-17",
                question: "A ligament connects:",
                choices: [
                    "Muscle to bone",
                    "Bone to bone",
                    "Muscle to muscle",
                    "Cartilage to bone"
                ],
                correctIndex: 1,
                explanation: "Ligaments connect bone to bone and stabilize joints. Tendons connect muscle to bone. Both are composed of dense regular connective tissue.",
                difficulty: .medium,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-pm3-18",
                question: "The shoulder joint has the greatest range of motion of any joint in the body, but this makes it prone to:",
                choices: [
                    "Ankylosis",
                    "Dislocation",
                    "Ankylosis and dislocation equally",
                    "Ossification"
                ],
                correctIndex: 1,
                explanation: "The glenohumeral (shoulder) joint is a ball-and-socket joint with maximum mobility but minimum stability. The shallow glenoid cavity provides little bony support, making dislocation the most common joint injury at this site.",
                difficulty: .medium,
                category: .application
            ),
            // ===== JOINTS (Hard) =====
            QuizQuestion(
                id: "w11-pm3-19",
                question: "Which of the following is an example of a cartilaginous joint (amphiarthrosis)?",
                choices: [
                    "Sutures of the skull",
                    "The pubic symphysis",
                    "The glenohumeral (shoulder) joint",
                    "The proximal radioulnar joint"
                ],
                correctIndex: 1,
                explanation: "The pubic symphysis is a cartilaginous joint (symphysis) classified as an amphiarthrosis (slightly movable). Skull sutures are fibrous synarthroses. The shoulder and proximal radioulnar joints are synovial diarthroses.",
                difficulty: .hard,
                category: .recall
            ),
            // ===== MUSCLE TISSUE (Easy) =====
            QuizQuestion(
                id: "w11-pm3-20",
                question: "The sarcomere is defined as the region between two successive:",
                choices: [
                    "H zones",
                    "A bands",
                    "Z discs (Z lines)",
                    "M lines"
                ],
                correctIndex: 2,
                explanation: "A sarcomere is the basic contractile unit of striated muscle, extending from one Z disc to the next Z disc. It contains overlapping thick (myosin) and thin (actin) filaments.",
                difficulty: .easy,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-pm3-21",
                question: "During the sliding filament mechanism, which of the following occurs?",
                choices: [
                    "The actin filaments shorten",
                    "The myosin filaments shorten",
                    "The actin and myosin filaments slide past each other without shortening individually",
                    "The sarcomere lengthens"
                ],
                correctIndex: 2,
                explanation: "In the sliding filament theory, the thin (actin) and thick (myosin) filaments do not change length. Instead, myosin heads pull actin filaments toward the center (M line), causing the Z discs to move closer together and the sarcomere to shorten.",
                difficulty: .easy,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-pm3-22",
                question: "The neurotransmitter released at the neuromuscular junction to stimulate skeletal muscle contraction is:",
                choices: [
                    "Epinephrine",
                    "Dopamine",
                    "Acetylcholine (ACh)",
                    "Serotonin"
                ],
                correctIndex: 2,
                explanation: "Acetylcholine (ACh) is released from the motor neuron axon terminal at the neuromuscular junction. It binds to receptors on the motor end plate of the muscle fiber, triggering an action potential and contraction.",
                difficulty: .easy,
                category: .recall
            ),
            // ===== MUSCLE TISSUE (Medium) =====
            QuizQuestion(
                id: "w11-pm3-23",
                question: "The role of calcium ions in skeletal muscle contraction is to:",
                choices: [
                    "Provide energy for the power stroke",
                    "Bind to troponin, causing tropomyosin to shift and expose myosin-binding sites on actin",
                    "Break down ATP at the myosin head",
                    "Connect the sarcolemma to the T-tubules"
                ],
                correctIndex: 1,
                explanation: "Calcium released from the sarcoplasmic reticulum binds to troponin on the thin filament. This causes a conformational change in tropomyosin, exposing the active sites on actin so myosin can bind and perform the power stroke.",
                difficulty: .medium,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-pm3-24",
                question: "The sarcoplasmic reticulum in muscle fibers is analogous to which organelle in other cells?",
                choices: [
                    "Golgi apparatus",
                    "Smooth endoplasmic reticulum",
                    "Mitochondria",
                    "Lysosomes"
                ],
                correctIndex: 1,
                explanation: "The sarcoplasmic reticulum (SR) is a specialized smooth endoplasmic reticulum in muscle fibers. Its primary role is to store and release calcium ions to regulate muscle contraction.",
                difficulty: .medium,
                category: .analysis
            ),
            QuizQuestion(
                id: "w11-pm3-25",
                question: "Muscles are typically named by several criteria. The muscle name 'biceps brachii' tells you the muscle has:",
                choices: [
                    "Three heads and is located in the arm",
                    "Two heads and is located in the arm",
                    "Two heads and is located in the thigh",
                    "One head and is located in the forearm"
                ],
                correctIndex: 1,
                explanation: "'Biceps' = two heads (bi- = two, -ceps = heads). 'Brachii' = of the arm (brachium). So biceps brachii is a two-headed muscle of the arm.",
                difficulty: .medium,
                category: .recall
            ),
            // ===== MUSCLE NAMING AND MAJOR MUSCLES (Medium) =====
            QuizQuestion(
                id: "w11-pm3-26",
                question: "Which muscle is the prime mover for elbow flexion?",
                choices: [
                    "Triceps brachii",
                    "Biceps brachii",
                    "Deltoid",
                    "Brachioradialis"
                ],
                correctIndex: 1,
                explanation: "The biceps brachii is the prime mover (agonist) for elbow flexion. The brachialis and brachioradialis are synergists. The triceps brachii is the antagonist (extends the elbow).",
                difficulty: .medium,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-pm3-27",
                question: "The quadriceps femoris group is responsible for:",
                choices: [
                    "Flexion of the knee",
                    "Extension of the knee",
                    "Adduction of the thigh",
                    "Lateral rotation of the hip"
                ],
                correctIndex: 1,
                explanation: "The quadriceps femoris (4 muscles: rectus femoris, vastus lateralis, vastus medialis, vastus intermedius) extends the knee. The hamstrings (biceps femoris, semitendinosus, semimembranosus) flex the knee.",
                difficulty: .medium,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-pm3-28",
                question: "The diaphragm is the primary muscle of:",
                choices: [
                    "Shoulder abduction",
                    "Trunk flexion",
                    "Breathing (inspiration)",
                    "Hip extension"
                ],
                correctIndex: 2,
                explanation: "The diaphragm is a dome-shaped muscle that separates the thoracic and abdominal cavities. When it contracts, it flattens and increases thoracic volume, creating negative pressure that draws air into the lungs (inspiration).",
                difficulty: .medium,
                category: .recall
            ),
            // ===== LEVER SYSTEMS AND MUSCLE METABOLISM (Medium) =====
            QuizQuestion(
                id: "w11-pm3-29",
                question: "A first-class lever is characterized by the fulcrum being located:",
                choices: [
                    "Between the effort and the resistance",
                    "At the same point as the effort",
                    "Beyond the resistance",
                    "At the resistance point"
                ],
                correctIndex: 0,
                explanation: "In a first-class lever, the fulcrum (joint) is between the effort (muscle force) and the resistance (load), like a seesaw. Example: nodding the head at the atlanto-occipital joint.",
                difficulty: .medium,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-pm3-30",
                question: "During a 5-kilometer run, which metabolic pathway provides MOST of the ATP?",
                choices: [
                    "Creatine phosphate system",
                    "Anaerobic glycolysis",
                    "Aerobic respiration (oxidative phosphorylation)",
                    "Fermentation"
                ],
                correctIndex: 2,
                explanation: "A 5K run is an endurance activity lasting well over 2 minutes. Aerobic respiration in mitochondria is the dominant ATP source for sustained exercise, fully oxidizing glucose and fatty acids to yield ~36 ATP per glucose.",
                difficulty: .medium,
                category: .application
            ),
            // ===== BONE TISSUE (Hard) =====
            QuizQuestion(
                id: "w11-pm3-31",
                question: "Wolff's law states that:",
                choices: [
                    "Bones grow only during childhood",
                    "Bone is deposited where stressed and resorbed where not stressed",
                    "Osteoclasts always outnumber osteoblasts",
                    "Cartilage cannot be replaced by bone after birth"
                ],
                correctIndex: 1,
                explanation: "Wolff's law states that a bone's architecture reflects the stresses placed on it. Bone is deposited in areas of mechanical stress and resorbed where stress is absent, allowing bone to adapt to physical demands.",
                difficulty: .hard,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-pm3-32",
                question: "In endochondral ossification, the primary ossification center forms in the:",
                choices: [
                    "Epiphysis",
                    "Diaphysis",
                    "Epiphyseal plate",
                    "Articular cartilage"
                ],
                correctIndex: 1,
                explanation: "The primary ossification center forms in the diaphysis (shaft) of the developing bone during fetal development. Secondary ossification centers form later in the epiphyses.",
                difficulty: .hard,
                category: .recall
            ),
            // ===== SKELETAL SYSTEM (Hard) =====
            QuizQuestion(
                id: "w11-pm3-33",
                question: "The cribriform plate, which allows olfactory nerve fibers to pass from the nasal cavity to the brain, belongs to the:",
                choices: [
                    "Sphenoid bone",
                    "Frontal bone",
                    "Ethmoid bone",
                    "Maxilla"
                ],
                correctIndex: 2,
                explanation: "The cribriform plate is the superior horizontal portion of the ethmoid bone. It contains tiny holes (foramina) through which the olfactory nerve (CN I) fibers pass from the nasal cavity to the olfactory bulbs of the brain.",
                difficulty: .hard,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-pm3-34",
                question: "The true ribs (vertebrosternal ribs) are ribs number:",
                choices: [
                    "1-5",
                    "1-7",
                    "8-10",
                    "11-12"
                ],
                correctIndex: 1,
                explanation: "True ribs are ribs 1-7; each attaches directly to the sternum via its own costal cartilage. False ribs (8-10) attach indirectly via the costal cartilage of rib 7. Floating ribs (11-12) have no sternal attachment.",
                difficulty: .hard,
                category: .recall
            ),
            // ===== MUSCLE TISSUE (Hard) =====
            QuizQuestion(
                id: "w11-pm3-35",
                question: "During the cross-bridge cycle, ATP is needed to:",
                choices: [
                    "Bind calcium to troponin",
                    "Release the myosin head from actin after the power stroke",
                    "Move tropomyosin off the binding sites",
                    "Transport acetylcholine across the synaptic cleft"
                ],
                correctIndex: 1,
                explanation: "After the power stroke, the myosin head remains bound to actin in a rigor state. Binding of a new ATP molecule to the myosin head causes it to detach from actin, allowing the cycle to repeat. Without ATP, muscles remain rigid (rigor mortis).",
                difficulty: .hard,
                category: .analysis
            ),
            QuizQuestion(
                id: "w11-pm3-36",
                question: "The I band of a sarcomere contains:",
                choices: [
                    "Only thick (myosin) filaments",
                    "Overlapping thick and thin filaments",
                    "Only thin (actin) filaments",
                    "The M line"
                ],
                correctIndex: 2,
                explanation: "The I band (isotropic band) is the light band that contains only thin (actin) filaments. The A band (anisotropic band) is the dark band containing the full length of thick (myosin) filaments, including the zone of overlap.",
                difficulty: .hard,
                category: .recall
            ),
            // ===== MUSCULAR SYSTEM — LEVER AND METABOLISM (Hard) =====
            QuizQuestion(
                id: "w11-pm3-37",
                question: "Type IIb (IIx) muscle fibers fatigue rapidly primarily because they:",
                choices: [
                    "Have abundant mitochondria that overproduce ATP",
                    "Rely mainly on anaerobic glycolysis, which produces limited ATP and generates lactic acid",
                    "Lack actin and myosin filaments",
                    "Are connected by gap junctions that leak calcium"
                ],
                correctIndex: 1,
                explanation: "Type IIb/IIx fibers have few mitochondria and low myoglobin, so they depend on anaerobic glycolysis for ATP. This pathway yields only 2 ATP per glucose and produces lactic acid, leading to rapid fatigue.",
                difficulty: .hard,
                category: .analysis
            ),
            QuizQuestion(
                id: "w11-pm3-38",
                question: "During eccentric contraction, the muscle is:",
                choices: [
                    "Shortening while generating tension",
                    "Lengthening while generating tension",
                    "Maintaining the same length without tension",
                    "Completely relaxed"
                ],
                correctIndex: 1,
                explanation: "An eccentric contraction occurs when the muscle lengthens under load while actively generating tension (e.g., slowly lowering a weight). This type of contraction is associated with greater muscle damage and delayed-onset muscle soreness (DOMS).",
                difficulty: .hard,
                category: .recall
            ),
            // ===== CLINICAL QUESTIONS =====
            QuizQuestion(
                id: "w11-pm3-39",
                question: "A patient with osteoporosis has bones that fracture easily. At the cellular level, this condition results from:",
                choices: [
                    "Excessive osteoblast activity",
                    "Osteoclast activity exceeding osteoblast activity, leading to net bone loss",
                    "Overproduction of collagen in the bone matrix",
                    "Fusion of the epiphyseal plates"
                ],
                correctIndex: 1,
                explanation: "Osteoporosis occurs when bone resorption by osteoclasts outpaces bone deposition by osteoblasts, resulting in decreased bone density and increased fracture risk. It is common in postmenopausal women due to declining estrogen levels.",
                difficulty: .easy,
                category: .clinical
            ),
            QuizQuestion(
                id: "w11-pm3-40",
                question: "A child breaks a bone at the epiphyseal plate. Why is this injury of special concern?",
                choices: [
                    "It will heal more slowly than other fractures",
                    "It may disrupt the growth plate and affect future bone lengthening",
                    "The child will develop osteoporosis",
                    "Epiphyseal plates cannot heal at all"
                ],
                correctIndex: 1,
                explanation: "The epiphyseal plate is the site of longitudinal bone growth. Damage to this area can disrupt chondrocyte proliferation and ossification, potentially leading to uneven or stunted limb growth.",
                difficulty: .medium,
                category: .clinical
            ),
            QuizQuestion(
                id: "w11-pm3-41",
                question: "A patient presents after a fall with a swollen, painful knee that is unstable when stressed laterally. The most likely injury involves:",
                choices: [
                    "A fracture of the femoral head",
                    "Torn collateral ligament",
                    "Herniated intervertebral disc",
                    "Dislocation of the hip"
                ],
                correctIndex: 1,
                explanation: "Lateral instability of the knee suggests damage to a collateral ligament (MCL or LCL), which resist valgus/varus stress. The MCL (medial collateral ligament) is most commonly injured.",
                difficulty: .medium,
                category: .clinical
            ),
            QuizQuestion(
                id: "w11-pm3-42",
                question: "Rigor mortis occurs after death because:",
                choices: [
                    "Calcium is actively pumped into the sarcoplasmic reticulum",
                    "ATP is no longer available to detach myosin heads from actin",
                    "The nervous system continues sending signals",
                    "Muscle fibers contract voluntarily one final time"
                ],
                correctIndex: 1,
                explanation: "After death, ATP production ceases. Without ATP, myosin heads cannot detach from actin, leaving muscles in a state of sustained contraction (rigor mortis) until enzymatic decomposition breaks down the proteins.",
                difficulty: .hard,
                category: .clinical
            ),
            QuizQuestion(
                id: "w11-pm3-43",
                question: "A patient with a crush injury develops acute compartment syndrome. The most critical immediate treatment is:",
                choices: [
                    "Ice and elevation",
                    "Oral anti-inflammatory medication",
                    "Fasciotomy (surgical opening of the fascia to relieve pressure)",
                    "Physical therapy"
                ],
                correctIndex: 2,
                explanation: "Acute compartment syndrome is a surgical emergency. Increasing pressure within the fascial compartment compresses blood vessels and nerves. A fasciotomy cuts open the fascia to relieve pressure and restore blood flow, preventing permanent muscle death.",
                difficulty: .hard,
                category: .clinical
            ),
            // ===== ADDITIONAL MEDIUM QUESTIONS =====
            QuizQuestion(
                id: "w11-pm3-44",
                question: "The hamstring muscle group is located on the ______ surface of the thigh and is responsible for ______ of the knee.",
                choices: [
                    "Anterior; extension",
                    "Posterior; flexion",
                    "Medial; adduction",
                    "Lateral; abduction"
                ],
                correctIndex: 1,
                explanation: "The hamstrings (biceps femoris, semitendinosus, semimembranosus) are on the posterior thigh and primarily flex the knee and extend the hip. The quadriceps on the anterior thigh extend the knee.",
                difficulty: .medium,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-pm3-45",
                question: "The rotator cuff muscles stabilize which joint?",
                choices: [
                    "Hip joint",
                    "Knee joint",
                    "Shoulder (glenohumeral) joint",
                    "Elbow joint"
                ],
                correctIndex: 2,
                explanation: "The rotator cuff consists of four muscles (supraspinatus, infraspinatus, teres minor, subscapularis — SITS) that reinforce and stabilize the glenohumeral (shoulder) joint.",
                difficulty: .medium,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-pm3-46",
                question: "Pronation of the forearm involves:",
                choices: [
                    "Turning the palm to face anteriorly (or superiorly)",
                    "Turning the palm to face posteriorly (or inferiorly)",
                    "Flexing the wrist",
                    "Extending the elbow"
                ],
                correctIndex: 1,
                explanation: "Pronation rotates the forearm so the palm faces posteriorly (when standing) or inferiorly (when forearm is horizontal). The radius crosses over the ulna. Supination returns the palm to the anatomical position (anteriorly/superiorly).",
                difficulty: .medium,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-pm3-47",
                question: "The gluteus maximus is the prime mover for:",
                choices: [
                    "Hip flexion",
                    "Hip extension",
                    "Knee flexion",
                    "Ankle dorsiflexion"
                ],
                correctIndex: 1,
                explanation: "The gluteus maximus is the largest and most powerful hip extensor. It is most active during climbing stairs, running, and rising from a seated position.",
                difficulty: .medium,
                category: .recall
            ),
            // ===== ADDITIONAL EASY QUESTIONS =====
            QuizQuestion(
                id: "w11-pm3-48",
                question: "The tough connective tissue sheath surrounding a bone is called the:",
                choices: [
                    "Endosteum",
                    "Periosteum",
                    "Perichondrium",
                    "Epimysium"
                ],
                correctIndex: 1,
                explanation: "The periosteum is a dense irregular connective tissue membrane covering the external surface of bone (except at articular surfaces). It provides attachment for tendons and ligaments and contains osteogenic cells for bone growth and repair.",
                difficulty: .easy,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-pm3-49",
                question: "The movement of a body part in a circular motion, combining flexion, extension, abduction, and adduction, is called:",
                choices: [
                    "Rotation",
                    "Circumduction",
                    "Pronation",
                    "Inversion"
                ],
                correctIndex: 1,
                explanation: "Circumduction is a cone-shaped movement that combines flexion, extension, abduction, and adduction in sequence. It occurs at ball-and-socket joints (shoulder, hip) and condyloid joints.",
                difficulty: .easy,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-pm3-50",
                question: "An antagonist muscle is one that:",
                choices: [
                    "Is the primary muscle producing a movement",
                    "Assists the prime mover",
                    "Opposes the action of the prime mover",
                    "Stabilizes the origin of the prime mover"
                ],
                correctIndex: 2,
                explanation: "An antagonist opposes the action of the prime mover (agonist). For example, the triceps brachii (antagonist) must relax when the biceps brachii (agonist) contracts to flex the elbow.",
                difficulty: .easy,
                category: .recall
            )
        ],
        timeLimit: 6600
    )

    // =========================================================================
    // MARK: - COMPREHENSIVE FINAL EXAM (50 Questions, All Weeks)
    // =========================================================================

    static let comprehensiveFinalExam = Quiz(
        id: "w11-comprehensive-final",
        title: "Comprehensive Final Exam",
        weekNumber: 0,
        lessonIds: [],
        questions: [
            // ===== WEEKS 1-2: Anatomy Basics & Chemistry (8 questions) =====
            QuizQuestion(
                id: "w11-final-01",
                question: "The six levels of structural organization from simplest to most complex are:",
                choices: [
                    "Chemical, cellular, tissue, organ, organ system, organism",
                    "Atom, cell, organ, tissue, organism, organ system",
                    "Molecular, cellular, organ, tissue, organ system, organism",
                    "Chemical, tissue, cellular, organ, organism, organ system"
                ],
                correctIndex: 0,
                explanation: "The correct order is: chemical → cellular → tissue → organ → organ system → organism. Each level builds on the complexity of the previous one.",
                difficulty: .easy,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-final-02",
                question: "Negative feedback differs from positive feedback in that negative feedback:",
                choices: [
                    "Amplifies the original stimulus",
                    "Opposes the original stimulus and restores homeostasis",
                    "Only occurs in the nervous system",
                    "Is rare in the human body"
                ],
                correctIndex: 1,
                explanation: "Negative feedback opposes a change and returns the variable to its set point, maintaining homeostasis. Positive feedback amplifies the stimulus (e.g., blood clotting, childbirth) and is less common.",
                difficulty: .easy,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-final-03",
                question: "A covalent bond is formed when atoms:",
                choices: [
                    "Transfer electrons from one atom to another",
                    "Share one or more pairs of electrons",
                    "Are attracted by opposite electrical charges",
                    "Share protons in their nuclei"
                ],
                correctIndex: 1,
                explanation: "In a covalent bond, atoms share electron pairs to fill their outer energy levels. Ionic bonds involve electron transfer, and hydrogen bonds are weak attractions between polar molecules.",
                difficulty: .easy,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-final-04",
                question: "Which macromolecule serves as the primary source of quick energy for cells?",
                choices: [
                    "Proteins",
                    "Lipids",
                    "Carbohydrates",
                    "Nucleic acids"
                ],
                correctIndex: 2,
                explanation: "Carbohydrates (especially glucose) are the body's primary and preferred source of quick energy. Lipids store more energy per gram but are mobilized more slowly.",
                difficulty: .easy,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-final-05",
                question: "A solution with a pH of 3 is classified as:",
                choices: [
                    "Strongly basic",
                    "Weakly basic",
                    "Neutral",
                    "Strongly acidic"
                ],
                correctIndex: 3,
                explanation: "The pH scale ranges from 0-14. Values below 7 are acidic, 7 is neutral, and above 7 is basic. A pH of 3 is strongly acidic (far below 7).",
                difficulty: .medium,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-final-06",
                question: "A sagittal plane divides the body into:",
                choices: [
                    "Superior and inferior portions",
                    "Anterior and posterior portions",
                    "Left and right portions",
                    "Proximal and distal portions"
                ],
                correctIndex: 2,
                explanation: "A sagittal plane divides the body into left and right portions. A midsagittal (median) plane divides it into equal halves. A frontal (coronal) plane divides anterior/posterior; a transverse plane divides superior/inferior.",
                difficulty: .medium,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-final-07",
                question: "Enzymes increase the rate of chemical reactions by:",
                choices: [
                    "Increasing the temperature of the reaction",
                    "Lowering the activation energy required",
                    "Adding more reactant molecules",
                    "Changing the equilibrium of the reaction"
                ],
                correctIndex: 1,
                explanation: "Enzymes are biological catalysts that lower the activation energy of a reaction, allowing it to proceed faster at body temperature. They are not consumed and do not alter the reaction's equilibrium.",
                difficulty: .medium,
                category: .application
            ),
            QuizQuestion(
                id: "w11-final-08",
                question: "A patient's blood pH drops to 7.2. This condition is called:",
                choices: [
                    "Alkalosis",
                    "Acidosis",
                    "Homeostatic equilibrium",
                    "Neutralization"
                ],
                correctIndex: 1,
                explanation: "Normal blood pH is 7.35-7.45. A pH below 7.35 is acidosis; above 7.45 is alkalosis. A pH of 7.2 represents significant acidosis, which can be life-threatening.",
                difficulty: .medium,
                category: .clinical
            ),

            // ===== WEEKS 3-4: Cells & Tissues (8 questions) =====
            QuizQuestion(
                id: "w11-final-09",
                question: "The phospholipid bilayer of the cell membrane is described as 'selectively permeable' because:",
                choices: [
                    "It allows all substances to pass freely",
                    "It blocks all substances from crossing",
                    "It allows some substances to cross while restricting others",
                    "It only permits water molecules"
                ],
                correctIndex: 2,
                explanation: "Selectively permeable means the membrane allows certain substances (small nonpolar molecules, water via aquaporins) to pass while restricting others (large molecules, ions) unless transported by membrane proteins.",
                difficulty: .easy,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-final-10",
                question: "A cell placed in a hypertonic solution will:",
                choices: [
                    "Swell and possibly lyse",
                    "Remain unchanged",
                    "Shrink (crenate) as water leaves by osmosis",
                    "Divide rapidly"
                ],
                correctIndex: 2,
                explanation: "In a hypertonic solution, the solute concentration outside the cell is greater. Water moves out by osmosis, causing the cell to shrink. Red blood cells crenate; plant cells plasmolyze.",
                difficulty: .easy,
                category: .application
            ),
            QuizQuestion(
                id: "w11-final-11",
                question: "The organelle responsible for ATP production via aerobic respiration is the:",
                choices: [
                    "Ribosome",
                    "Golgi apparatus",
                    "Mitochondrion",
                    "Lysosome"
                ],
                correctIndex: 2,
                explanation: "Mitochondria are the 'powerhouses of the cell.' They produce most of the cell's ATP through aerobic respiration (Krebs cycle and the electron transport chain on the inner mitochondrial membrane).",
                difficulty: .easy,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-final-12",
                question: "Which phase of mitosis involves the alignment of chromosomes along the cell's equator (metaphase plate)?",
                choices: [
                    "Prophase",
                    "Metaphase",
                    "Anaphase",
                    "Telophase"
                ],
                correctIndex: 1,
                explanation: "During metaphase, chromosomes align at the metaphase plate (cell equator). Spindle fibers from opposite poles attach to the centromeres. This ensures each daughter cell receives one copy of each chromosome.",
                difficulty: .medium,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-final-13",
                question: "Simple squamous epithelium is found lining blood vessels (endothelium) because it:",
                choices: [
                    "Provides strong mechanical protection",
                    "Secretes mucus to trap pathogens",
                    "Is thin enough to allow rapid diffusion and filtration",
                    "Contains many layers for durability"
                ],
                correctIndex: 2,
                explanation: "Simple squamous epithelium is a single layer of flat cells, ideal for rapid diffusion, filtration, and osmosis. It lines blood vessels (endothelium), air sacs of the lungs, and serous membranes (mesothelium).",
                difficulty: .medium,
                category: .application
            ),
            QuizQuestion(
                id: "w11-final-14",
                question: "Which tissue type covers body surfaces, lines body cavities, and forms glands?",
                choices: [
                    "Connective tissue",
                    "Muscle tissue",
                    "Epithelial tissue",
                    "Nervous tissue"
                ],
                correctIndex: 2,
                explanation: "Epithelial tissue covers external body surfaces (skin), lines internal cavities and organs, and forms glands (both exocrine and endocrine). It is avascular and has a high regeneration rate.",
                difficulty: .easy,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-final-15",
                question: "Active transport differs from passive transport in that active transport:",
                choices: [
                    "Moves substances down their concentration gradient",
                    "Does not require membrane proteins",
                    "Requires ATP to move substances against their concentration gradient",
                    "Only moves water molecules"
                ],
                correctIndex: 2,
                explanation: "Active transport uses cellular energy (ATP) to move substances against (up) their concentration gradient. Passive transport (diffusion, osmosis, facilitated diffusion) requires no energy and moves substances down the gradient.",
                difficulty: .medium,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-final-16",
                question: "A patient receives an IV of distilled water (hypotonic). What happens to red blood cells?",
                choices: [
                    "They crenate (shrink)",
                    "They remain unchanged",
                    "They swell and may lyse (hemolysis)",
                    "They immediately clot"
                ],
                correctIndex: 2,
                explanation: "Distilled water is hypotonic relative to blood cells. Water enters the cells by osmosis, causing them to swell. If swelling is severe, the cells burst (hemolysis). This is why IV fluids must be isotonic (e.g., normal saline).",
                difficulty: .hard,
                category: .clinical
            ),

            // ===== WEEKS 5-6: Integumentary System (8 questions) =====
            QuizQuestion(
                id: "w11-final-17",
                question: "The epidermis is composed of which tissue type?",
                choices: [
                    "Dense irregular connective tissue",
                    "Keratinized stratified squamous epithelium",
                    "Simple columnar epithelium",
                    "Areolar connective tissue"
                ],
                correctIndex: 1,
                explanation: "The epidermis is keratinized stratified squamous epithelium. Multiple layers of cells, with the surface layers filled with the tough protein keratin, provide a waterproof, protective barrier.",
                difficulty: .easy,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-final-18",
                question: "Melanin is produced by melanocytes and its primary function is to:",
                choices: [
                    "Produce vitamin D",
                    "Maintain skin hydration",
                    "Protect DNA from UV radiation damage",
                    "Regulate body temperature"
                ],
                correctIndex: 2,
                explanation: "Melanin is a pigment produced by melanocytes in the stratum basale of the epidermis. It absorbs UV radiation, shielding the DNA of keratinocytes from mutations that could lead to skin cancer.",
                difficulty: .easy,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-final-19",
                question: "The dermis contains two layers. The deeper reticular layer is composed primarily of:",
                choices: [
                    "Adipose tissue",
                    "Dense irregular connective tissue",
                    "Simple squamous epithelium",
                    "Hyaline cartilage"
                ],
                correctIndex: 1,
                explanation: "The reticular layer (deeper dermis) is dense irregular connective tissue with thick bundles of collagen and elastic fibers. It provides strength, extensibility, and elasticity to the skin.",
                difficulty: .medium,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-final-20",
                question: "The 'rule of nines' is used clinically to estimate:",
                choices: [
                    "The depth of a burn",
                    "The total body surface area affected by burns",
                    "The number of skin grafts needed",
                    "The patient's blood loss"
                ],
                correctIndex: 1,
                explanation: "The rule of nines divides the body into regions each representing approximately 9% (or multiples of 9%) of total body surface area. It is used by EMTs and clinicians to quickly estimate the extent of burns for fluid resuscitation calculations.",
                difficulty: .medium,
                category: .clinical
            ),
            QuizQuestion(
                id: "w11-final-21",
                question: "Which epidermal layer contains actively dividing stem cells that produce new keratinocytes?",
                choices: [
                    "Stratum corneum",
                    "Stratum lucidum",
                    "Stratum granulosum",
                    "Stratum basale"
                ],
                correctIndex: 3,
                explanation: "The stratum basale (basal layer) is the deepest epidermal layer. It contains stem cells that undergo mitosis to produce new keratinocytes, which then migrate upward through the other layers.",
                difficulty: .medium,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-final-22",
                question: "Sebaceous (oil) glands secrete sebum, which functions to:",
                choices: [
                    "Cool the body through evaporation",
                    "Lubricate and waterproof the skin and hair; has bactericidal properties",
                    "Produce melanin for UV protection",
                    "Generate new epidermal cells"
                ],
                correctIndex: 1,
                explanation: "Sebaceous glands produce sebum, an oily secretion that lubricates the skin and hair, helps waterproof the skin surface, and has mild antibacterial properties. Most sebaceous glands are associated with hair follicles.",
                difficulty: .easy,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-final-23",
                question: "A second-degree burn is characterized by:",
                choices: [
                    "Damage limited to the epidermis only",
                    "Damage to the epidermis and part of the dermis, with blistering",
                    "Full-thickness destruction of epidermis and dermis",
                    "Damage extending into muscle and bone"
                ],
                correctIndex: 1,
                explanation: "Second-degree (partial-thickness) burns damage the epidermis and part of the dermis, causing blistering, pain, and swelling. First-degree burns affect only the epidermis; third-degree burns destroy the full thickness of skin.",
                difficulty: .medium,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-final-24",
                question: "Vitamin D synthesis in the skin begins when:",
                choices: [
                    "Melanocytes absorb infrared radiation",
                    "UV-B radiation converts 7-dehydrocholesterol in the epidermis to cholecalciferol (vitamin D3)",
                    "Keratinocytes secrete calcitonin",
                    "Sweat glands excrete calcium"
                ],
                correctIndex: 1,
                explanation: "UV-B radiation from sunlight converts 7-dehydrocholesterol in epidermal keratinocytes to cholecalciferol (vitamin D3). This is then modified by the liver and kidneys into the active form, calcitriol, which promotes calcium absorption.",
                difficulty: .hard,
                category: .application
            ),

            // ===== WEEKS 7-8: Bone Tissue & Skeletal System (8 questions) =====
            QuizQuestion(
                id: "w11-final-25",
                question: "Compact bone is organized into cylindrical units called osteons. Each osteon has a central canal containing:",
                choices: [
                    "Yellow bone marrow",
                    "Cartilage cells",
                    "Blood vessels and nerves",
                    "Osteoclasts only"
                ],
                correctIndex: 2,
                explanation: "The central (Haversian) canal of each osteon contains blood vessels and nerves that supply the bone cells (osteocytes) living in lacunae within the concentric lamellae.",
                difficulty: .easy,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-final-26",
                question: "Osteocytes communicate with each other through tiny channels called:",
                choices: [
                    "Volkmann's canals",
                    "Haversian canals",
                    "Canaliculi",
                    "Trabeculae"
                ],
                correctIndex: 2,
                explanation: "Canaliculi are tiny channels radiating from lacunae that connect osteocytes to each other and to the central canal. Osteocyte cell processes extend through canaliculi, allowing nutrient and signal exchange via gap junctions.",
                difficulty: .medium,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-final-27",
                question: "How many cervical vertebrae are in the human vertebral column?",
                choices: [
                    "5",
                    "7",
                    "12",
                    "5 fused"
                ],
                correctIndex: 1,
                explanation: "There are 7 cervical vertebrae (C1-C7). Remember: 7 cervical, 12 thoracic, 5 lumbar, 5 sacral (fused), and 3-5 coccygeal (fused).",
                difficulty: .easy,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-final-28",
                question: "The axial skeleton includes:",
                choices: [
                    "The upper and lower limbs",
                    "The skull, vertebral column, and thoracic cage",
                    "The pectoral and pelvic girdles",
                    "Only the skull and ribs"
                ],
                correctIndex: 1,
                explanation: "The axial skeleton (80 bones) includes the skull, vertebral column, and thoracic cage (sternum and ribs). The appendicular skeleton (126 bones) includes the limbs and their girdles.",
                difficulty: .easy,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-final-29",
                question: "Parathyroid hormone (PTH) responds to low blood calcium by:",
                choices: [
                    "Inhibiting osteoclast activity",
                    "Stimulating osteoclast activity to release calcium from bone into the blood",
                    "Stimulating osteoblast activity to deposit more calcium in bone",
                    "Decreasing calcium absorption in the intestines"
                ],
                correctIndex: 1,
                explanation: "When blood calcium drops, the parathyroid glands release PTH, which stimulates osteoclast activity (bone resorption) to release calcium into the bloodstream. PTH also increases renal calcium reabsorption and activates vitamin D.",
                difficulty: .medium,
                category: .application
            ),
            QuizQuestion(
                id: "w11-final-30",
                question: "The bone marking that describes a rounded knob that articulates with another bone is a:",
                choices: [
                    "Fossa",
                    "Foramen",
                    "Condyle",
                    "Tuberosity"
                ],
                correctIndex: 2,
                explanation: "A condyle is a large, rounded articular prominence at the end of a bone (e.g., medial and lateral condyles of the femur). A fossa is a depression, a foramen is a hole, and a tuberosity is a rough projection for muscle attachment.",
                difficulty: .medium,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-final-31",
                question: "A comminuted fracture is one in which the bone is:",
                choices: [
                    "Broken cleanly into two pieces",
                    "Cracked but not completely broken through",
                    "Shattered into three or more fragments",
                    "Broken through the skin surface"
                ],
                correctIndex: 2,
                explanation: "A comminuted fracture shatters the bone into three or more fragments. It is common in the elderly (brittle bones) and in high-impact trauma. An open (compound) fracture breaks through the skin; a greenstick fracture is an incomplete crack.",
                difficulty: .hard,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-final-32",
                question: "A 70-year-old woman trips and fractures her hip. She has a history of osteoporosis. Which factor most directly contributed to the fracture?",
                choices: [
                    "Excessive osteoblast activity making bone too rigid",
                    "Net bone loss due to osteoclast activity exceeding osteoblast activity",
                    "Overproduction of growth hormone",
                    "Excessive vitamin D intake"
                ],
                correctIndex: 1,
                explanation: "Osteoporosis involves net bone loss — osteoclast resorption exceeds osteoblast deposition, reducing bone density and strength. This makes bones fragile and prone to fracture from minimal trauma, especially at the hip, wrist, and vertebrae.",
                difficulty: .hard,
                category: .clinical
            ),

            // ===== WEEKS 9-10: Joints & Muscles (10 questions) =====
            QuizQuestion(
                id: "w11-final-33",
                question: "The most freely movable type of joint is a:",
                choices: [
                    "Suture",
                    "Symphysis",
                    "Synovial joint",
                    "Syndesmosis"
                ],
                correctIndex: 2,
                explanation: "Synovial joints are diarthroses (freely movable). They have a joint cavity with synovial fluid, articular cartilage, and a fibrous capsule. Sutures are immovable (synarthroses); symphyses are slightly movable (amphiarthroses).",
                difficulty: .easy,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-final-34",
                question: "Ball-and-socket joints allow movement in:",
                choices: [
                    "One plane only (uniaxial)",
                    "Two planes (biaxial)",
                    "All planes, including rotation (multiaxial)",
                    "No planes — they are immovable"
                ],
                correctIndex: 2,
                explanation: "Ball-and-socket joints (shoulder, hip) are multiaxial, allowing flexion/extension, abduction/adduction, rotation, and circumduction — the widest range of motion of any joint type.",
                difficulty: .easy,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-final-35",
                question: "Tendons connect:",
                choices: [
                    "Bone to bone",
                    "Muscle to bone",
                    "Cartilage to bone",
                    "Nerve to muscle"
                ],
                correctIndex: 1,
                explanation: "Tendons are cords of dense regular connective tissue that connect muscle to bone. Ligaments connect bone to bone. Both are composed primarily of collagen fibers.",
                difficulty: .easy,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-final-36",
                question: "The basic contractile unit of skeletal muscle is the:",
                choices: [
                    "Myofibril",
                    "Sarcomere",
                    "Motor unit",
                    "Fascicle"
                ],
                correctIndex: 1,
                explanation: "The sarcomere, extending from Z disc to Z disc, is the smallest functional (contractile) unit of skeletal muscle. Myofibrils are chains of sarcomeres; fascicles are bundles of muscle fibers.",
                difficulty: .easy,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-final-37",
                question: "During muscle contraction, calcium released from the sarcoplasmic reticulum binds to:",
                choices: [
                    "Myosin heads",
                    "Actin monomers",
                    "Troponin on the thin filaments",
                    "ATP molecules"
                ],
                correctIndex: 2,
                explanation: "Calcium binds to troponin, causing a conformational change that shifts tropomyosin away from the myosin-binding sites on actin. This allows cross-bridge formation between myosin heads and actin.",
                difficulty: .medium,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-final-38",
                question: "The sliding filament theory states that during contraction:",
                choices: [
                    "Actin filaments shorten",
                    "Myosin filaments shorten",
                    "Both actin and myosin shorten",
                    "Actin and myosin slide past each other; individual filaments do not shorten"
                ],
                correctIndex: 3,
                explanation: "In the sliding filament model, the thin (actin) and thick (myosin) filaments maintain their original length. Myosin heads pull actin toward the M line, causing the Z discs to move closer and the sarcomere to shorten.",
                difficulty: .medium,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-final-39",
                question: "The deltoid muscle is the prime mover for:",
                choices: [
                    "Elbow flexion",
                    "Shoulder abduction",
                    "Hip extension",
                    "Knee extension"
                ],
                correctIndex: 1,
                explanation: "The deltoid is the large triangular muscle capping the shoulder. It is the prime mover for arm abduction (lifting the arm laterally away from the body). It also assists with flexion and extension of the shoulder.",
                difficulty: .medium,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-final-40",
                question: "The tibialis anterior muscle performs which action at the ankle?",
                choices: [
                    "Plantarflexion",
                    "Dorsiflexion and inversion",
                    "Eversion",
                    "Lateral rotation"
                ],
                correctIndex: 1,
                explanation: "The tibialis anterior is on the anterior leg (shin) and is the prime mover for dorsiflexion (pulling the foot up toward the shin) and inversion (turning the sole medially).",
                difficulty: .medium,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-final-41",
                question: "A sprain involves injury to a:",
                choices: [
                    "Bone",
                    "Muscle or tendon",
                    "Ligament",
                    "Nerve"
                ],
                correctIndex: 2,
                explanation: "A sprain is stretching or tearing of a ligament (bone-to-bone connection). A strain is stretching or tearing of a muscle or tendon (muscle-to-bone connection). Both are graded I (mild) through III (complete tear).",
                difficulty: .medium,
                category: .clinical
            ),
            QuizQuestion(
                id: "w11-final-42",
                question: "An anterior cruciate ligament (ACL) tear in the knee would most likely result in:",
                choices: [
                    "Inability to extend the knee",
                    "Excessive anterior translation of the tibia on the femur",
                    "Medial dislocation of the patella",
                    "Loss of all knee movement"
                ],
                correctIndex: 1,
                explanation: "The ACL prevents excessive anterior (forward) movement of the tibia relative to the femur. An ACL tear results in anterior instability ('giving way'), often tested with the anterior drawer test or Lachman test.",
                difficulty: .hard,
                category: .clinical
            ),

            // ===== WEEK 11: Muscle Physiology (8 questions) =====
            QuizQuestion(
                id: "w11-final-43",
                question: "Which lever class is most common in the human body?",
                choices: [
                    "First-class",
                    "Second-class",
                    "Third-class",
                    "All classes are equally common"
                ],
                correctIndex: 2,
                explanation: "Third-class levers are the most common in the body. The effort (muscle insertion) is between the fulcrum (joint) and the resistance (load). They favor speed and range of motion over force.",
                difficulty: .easy,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-final-44",
                question: "Creatine phosphate provides energy for approximately the first:",
                choices: [
                    "1-2 seconds of activity",
                    "10-15 seconds of intense activity",
                    "2-3 minutes of activity",
                    "30 minutes of activity"
                ],
                correctIndex: 1,
                explanation: "The creatine phosphate (phosphagen) system is the fastest ATP source, providing energy for ~10-15 seconds of maximal activity. It transfers a phosphate group from CP to ADP via creatine kinase.",
                difficulty: .easy,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-final-45",
                question: "Oxygen debt (EPOC) after exercise is needed to:",
                choices: [
                    "Build new muscle proteins",
                    "Replenish CP and ATP stores, convert lactic acid to glucose, and restore myoglobin O2",
                    "Digest food consumed before exercise",
                    "Increase blood volume"
                ],
                correctIndex: 1,
                explanation: "EPOC represents the extra O2 consumed to restore the body to pre-exercise state: replenish ATP and creatine phosphate, convert lactic acid back to glucose (Cori cycle), reload myoglobin with O2, and normalize elevated metabolism.",
                difficulty: .medium,
                category: .application
            ),
            QuizQuestion(
                id: "w11-final-46",
                question: "Type I (slow-twitch) muscle fibers appear red because they are rich in:",
                choices: [
                    "Hemoglobin",
                    "Myoglobin and mitochondria",
                    "Lactic acid",
                    "Glycogen"
                ],
                correctIndex: 1,
                explanation: "Type I fibers are red due to their high myoglobin content (an oxygen-binding protein) and abundant mitochondria. These adaptations support their reliance on aerobic respiration for sustained, fatigue-resistant contraction.",
                difficulty: .medium,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-final-47",
                question: "Smooth muscle uses which regulatory protein instead of troponin for contraction?",
                choices: [
                    "Tropomyosin",
                    "Calmodulin",
                    "Titin",
                    "Dystrophin"
                ],
                correctIndex: 1,
                explanation: "Smooth muscle lacks troponin. Instead, calcium binds to calmodulin, which activates myosin light-chain kinase (MLCK). MLCK phosphorylates myosin heads, enabling cross-bridge cycling with actin.",
                difficulty: .medium,
                category: .recall
            ),
            QuizQuestion(
                id: "w11-final-48",
                question: "Cardiac muscle cannot tetanize (sustain maximal contraction) because it has:",
                choices: [
                    "No actin or myosin",
                    "A very short refractory period",
                    "A prolonged refractory period preventing re-stimulation before relaxation",
                    "No calcium channels"
                ],
                correctIndex: 2,
                explanation: "Cardiac muscle has an extended absolute refractory period that lasts nearly as long as the contraction itself. This prevents temporal summation and tetanus, ensuring the heart relaxes between beats to fill with blood.",
                difficulty: .hard,
                category: .analysis
            ),
            QuizQuestion(
                id: "w11-final-49",
                question: "A marathon runner cramps severely at mile 22. The most likely contributing factor is:",
                choices: [
                    "Excess ATP production",
                    "Electrolyte depletion and glycogen depletion causing muscle fatigue",
                    "Excessive Type IIb fiber recruitment",
                    "Insufficient calmodulin"
                ],
                correctIndex: 1,
                explanation: "Prolonged exercise depletes glycogen stores and causes electrolyte loss through sweat (sodium, potassium, calcium, magnesium). These deficiencies impair normal excitation-contraction coupling, leading to involuntary sustained contractions (cramps).",
                difficulty: .hard,
                category: .clinical
            ),
            QuizQuestion(
                id: "w11-final-50",
                question: "A construction worker presents with a swollen, tense lower leg, severe pain with passive toe extension, and diminished pulses. The most likely diagnosis is:",
                choices: [
                    "Deep vein thrombosis",
                    "Muscle strain (Grade II)",
                    "Acute compartment syndrome",
                    "Stress fracture of the tibia"
                ],
                correctIndex: 2,
                explanation: "Swelling within a fascial compartment, pain with passive stretch, and diminished pulses are hallmarks of acute compartment syndrome. This is a surgical emergency requiring fasciotomy to restore blood flow and prevent permanent tissue death.",
                difficulty: .hard,
                category: .clinical
            )
        ],
        timeLimit: 6600
    )

    // =========================================================================
    // MARK: - FLASHCARD DECK: Muscle Physiology & Metabolism
    // =========================================================================

    static let deckMusclePhysiologyMetabolism = FlashcardDeck(
        id: "w11-deck-muscle-physiology",
        title: "Muscle Physiology & Metabolism",
        weekNumber: 11,
        category: "Muscle Physiology",
        cards: [
            Flashcard(id: "w11-fc-01", front: "What are the three elements of a lever system?", back: "Lever (bone), fulcrum (joint), and effort (muscle force) acting against resistance (load).", hint: "Think: bone, joint, muscle", repetition: w11SR),
            Flashcard(id: "w11-fc-02", front: "First-class lever: arrangement and body example", back: "Fulcrum between effort and resistance (like a seesaw). Example: nodding the head — atlanto-occipital joint (fulcrum) between neck muscles (effort) and face weight (resistance).", hint: "Think of a seesaw", repetition: w11SR),
            Flashcard(id: "w11-fc-03", front: "Second-class lever: arrangement and body example", back: "Resistance between fulcrum and effort; favors force. Example: standing on tiptoe — ball of foot (fulcrum), body weight (resistance), calf muscles on calcaneus (effort).", hint: "Like a wheelbarrow", repetition: w11SR),
            Flashcard(id: "w11-fc-04", front: "Third-class lever: arrangement and body example", back: "Effort between fulcrum and resistance; most common in body; favors speed and range of motion. Example: biceps curl — elbow (fulcrum), biceps insertion (effort), weight in hand (resistance).", hint: "Most common lever type in the body", repetition: w11SR),
            Flashcard(id: "w11-fc-05", front: "Creatine Phosphate (CP) System", back: "Fastest ATP source. Creatine kinase transfers phosphate from CP to ADP → ATP. Provides ~10-15 seconds of energy for intense activity. No O₂ needed, no lactic acid produced.", hint: "First energy system used; very fast but short-lived", repetition: w11SR),
            Flashcard(id: "w11-fc-06", front: "Anaerobic Glycolysis", back: "Breaks glucose → pyruvic acid → lactic acid (without O₂). Yields 2 ATP per glucose. Sustains ~30-60 seconds of intense activity. Lactic acid accumulation contributes to fatigue.", hint: "2 ATP, produces lactic acid", repetition: w11SR),
            Flashcard(id: "w11-fc-07", front: "Aerobic Respiration in Muscle", back: "Occurs in mitochondria with O₂. Fully oxidizes glucose/fatty acids via glycolysis → Krebs cycle → ETC. Yields ~36 ATP per glucose. Dominant for endurance activities (>2 min). Produces CO₂ and H₂O.", hint: "36 ATP per glucose; requires oxygen", repetition: w11SR),
            Flashcard(id: "w11-fc-08", front: "Oxygen Debt (EPOC)", back: "Excess post-exercise oxygen consumption. Extra O₂ needed to: (1) replenish ATP and CP, (2) convert lactic acid → glucose (Cori cycle), (3) reload myoglobin with O₂, (4) return metabolic rate to resting levels.", hint: "Why you keep breathing hard after exercise", repetition: w11SR),
            Flashcard(id: "w11-fc-09", front: "Type I (Slow-Twitch) Fibers", back: "Red fibers, rich in mitochondria and myoglobin. Use aerobic respiration. Fatigue-resistant. Used for endurance (marathon, posture). Cannot generate high force.", hint: "Red, aerobic, slow but steady", repetition: w11SR),
            Flashcard(id: "w11-fc-10", front: "Type IIb/IIx (Fast-Twitch Glycolytic) Fibers", back: "White/pale fibers, few mitochondria, low myoglobin. Use anaerobic glycolysis. Generate maximum force but fatigue rapidly. Used for sprinting, jumping, power lifting.", hint: "White, anaerobic, fast but tire quickly", repetition: w11SR),
            Flashcard(id: "w11-fc-11", front: "Isotonic vs Isometric Contractions", back: "Isotonic: muscle changes length (concentric = shortens, eccentric = lengthens under tension). Isometric: muscle generates tension without changing length (e.g., holding a heavy object stationary).", hint: "Iso-tonic = same tone/tension; iso-metric = same length", repetition: w11SR),
            Flashcard(id: "w11-fc-12", front: "Smooth Muscle vs Skeletal Muscle Regulation", back: "Smooth muscle: uses calmodulin (not troponin); no sarcomeres (no striations); actin attaches to dense bodies; spindle-shaped, uninucleate, involuntary. Skeletal muscle: uses troponin-tropomyosin; organized sarcomeres; striated; multinucleate; voluntary.", hint: "Calmodulin vs troponin", repetition: w11SR)
        ]
    )
}
