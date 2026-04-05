import Foundation

// MARK: - Course Content for Bio 40A, Weeks 1-2
// All lessons, quizzes, and flashcard decks are defined as static properties.

struct CourseContent {

    // MARK: - Default Spaced Repetition
    private static let defaultSR = Flashcard.SpacedRepetitionData()

    // MARK: - All Lessons
    static let lessons: [Lesson] = [lesson1, lesson2, lesson3, lesson4]

    // MARK: - All Quizzes
    static let quizzes: [Quiz] = [quizWeek1, quizWeek2]

    // MARK: - All Flashcard Decks
    static let flashcardDecks: [FlashcardDeck] = [
        deckDirectionalTerms,
        deckPlanesAndCavities,
        deckChemistryFundamentals,
        deckMacromoleculesPH
    ]

    // =========================================================================
    // MARK: - LESSON 1: Body Organization & Homeostasis
    // =========================================================================

    static let lesson1 = Lesson(
        id: "lesson-1",
        weekNumber: 1,
        classNumber: 1,
        title: "Body Organization & Homeostasis",
        subtitle: "Levels of organization, metabolism, and feedback loops",
        textbookChapter: "Chapter 1",
        textbookSections: "1.1 - 1.5",
        sections: [
            LessonSection(
                id: "l1-s1",
                heading: "Levels of Organization",
                content: """
                The human body is organized into increasingly complex structural levels. The simplest \
                level is the chemical level, which includes atoms and molecules. Atoms combine to form \
                molecules such as DNA and proteins. The next level is the cellular level: cells are the \
                smallest living units and are composed of molecules organized into structures called \
                organelles. Groups of similar cells that work together form tissues (the tissue level). \
                There are four primary tissue types: epithelial, connective, muscular, and nervous. \
                Two or more tissue types combine to form organs (the organ level), such as the stomach \
                or heart. Organs that work together to accomplish a common purpose make up an organ system \
                (the organ system level), for example the cardiovascular system. Finally, all organ systems \
                functioning together constitute the organism level — the living human being.
                """,
                keyTerms: [
                    KeyTerm(id: "l1s1-k1", term: "Cell", definition: "The smallest living structural and functional unit of the body, bounded by a plasma membrane."),
                    KeyTerm(id: "l1s1-k2", term: "Tissue", definition: "A group of similar cells and their extracellular matrix that perform a specific function together."),
                    KeyTerm(id: "l1s1-k3", term: "Organ", definition: "A structure composed of two or more tissue types that performs a specific function."),
                    KeyTerm(id: "l1s1-k4", term: "Organ System", definition: "A group of organs that work together to perform a major body function (e.g., the digestive system)."),
                    KeyTerm(id: "l1s1-k5", term: "Organelle", definition: "A specialized structure within a cell that carries out a specific function, such as a mitochondrion or ribosome.")
                ],
                testablesFacts: [
                    "The six levels of structural organization, from simplest to most complex, are: chemical, cellular, tissue, organ, organ system, organism.",
                    "The four primary tissue types are epithelial, connective, muscular, and nervous.",
                    "Cells are the smallest living units; atoms and molecules are not alive on their own."
                ]
            ),
            LessonSection(
                id: "l1-s2",
                heading: "Metabolism",
                content: """
                Metabolism is the sum of all chemical reactions occurring in the body. It has two major \
                branches: catabolism and anabolism. Catabolism refers to the breakdown of complex molecules \
                into simpler ones, usually releasing energy (for example, breaking down glucose during \
                cellular respiration). Anabolism refers to the synthesis of complex molecules from simpler \
                ones, requiring an input of energy (for example, building proteins from amino acids). \
                Together, these reactions allow the body to extract energy from nutrients, build and \
                repair tissues, and eliminate waste products. All metabolic reactions require enzymes, \
                which are biological catalysts that speed up reactions without being consumed. \
                Maintaining a balance between catabolic and anabolic processes is essential to homeostasis.
                """,
                keyTerms: [
                    KeyTerm(id: "l1s2-k1", term: "Metabolism", definition: "The sum of all chemical reactions occurring in the body, including catabolism and anabolism."),
                    KeyTerm(id: "l1s2-k2", term: "Catabolism", definition: "Metabolic reactions that break down complex molecules into simpler ones, releasing energy."),
                    KeyTerm(id: "l1s2-k3", term: "Anabolism", definition: "Metabolic reactions that build complex molecules from simpler ones, requiring energy input."),
                    KeyTerm(id: "l1s2-k4", term: "Enzyme", definition: "A biological catalyst, usually a protein, that speeds up a chemical reaction without being consumed.")
                ],
                testablesFacts: [
                    "Catabolism breaks down molecules and releases energy; anabolism builds molecules and requires energy.",
                    "Metabolism = catabolism + anabolism — together they encompass every chemical reaction in the body."
                ]
            ),
            LessonSection(
                id: "l1-s3",
                heading: "Homeostasis",
                content: """
                Homeostasis is the maintenance of a relatively stable internal environment despite \
                changes in external conditions. The body must regulate variables such as body temperature, \
                blood glucose concentration, blood pH, blood pressure, and fluid balance within narrow \
                ranges for cells to function properly. Homeostasis is a dynamic process — the internal \
                environment fluctuates around a set point, the ideal normal value for a given variable. \
                Three components are essential: (1) a receptor (sensor) that monitors the environment \
                and detects changes, (2) a control center (usually the brain) that determines the \
                appropriate response, and (3) an effector (muscle or gland) that carries out the \
                response. Most homeostatic mechanisms operate via feedback loops. A disruption of \
                homeostasis can lead to disease or death.
                """,
                keyTerms: [
                    KeyTerm(id: "l1s3-k1", term: "Homeostasis", definition: "The maintenance of a relatively stable internal environment despite changes in external conditions."),
                    KeyTerm(id: "l1s3-k2", term: "Set Point", definition: "The ideal normal value for a physiological variable that the body works to maintain."),
                    KeyTerm(id: "l1s3-k3", term: "Receptor (Sensor)", definition: "A structure that monitors the internal or external environment and detects changes (stimuli)."),
                    KeyTerm(id: "l1s3-k4", term: "Effector", definition: "A muscle or gland that carries out the response directed by the control center to restore homeostasis.")
                ],
                testablesFacts: [
                    "The three components of a homeostatic feedback loop are: receptor (sensor), control center, and effector.",
                    "Homeostasis is dynamic — variables fluctuate around a set point rather than remaining perfectly constant.",
                    "Loss of homeostasis leads to disease states and, if uncorrected, can result in death."
                ]
            ),
            LessonSection(
                id: "l1-s4",
                heading: "Negative Feedback Loops",
                content: """
                Negative feedback is the most common homeostatic mechanism. In a negative feedback loop, \
                the response reverses (negates) the direction of the original stimulus, bringing the \
                variable back toward its set point. For example, when blood glucose rises after a meal, \
                the pancreas (control center) detects the increase and releases insulin. Insulin signals \
                body cells (effectors) to take up glucose, lowering blood glucose back toward normal. \
                When blood glucose drops to the set point, insulin secretion decreases. Another classic \
                example is thermoregulation: when body temperature rises above 37 degrees C, the hypothalamus \
                triggers vasodilation and sweating to release heat, cooling the body. The term "negative" \
                does not mean harmful — it means the response opposes the change that triggered it.
                """,
                keyTerms: [
                    KeyTerm(id: "l1s4-k1", term: "Negative Feedback", definition: "A homeostatic mechanism in which the response reverses the direction of the initial stimulus, returning the variable toward the set point."),
                    KeyTerm(id: "l1s4-k2", term: "Insulin", definition: "A hormone released by the pancreas that lowers blood glucose by promoting cellular uptake of glucose."),
                    KeyTerm(id: "l1s4-k3", term: "Thermoregulation", definition: "The process by which the body maintains its core internal temperature around 37 degrees C (98.6 degrees F).")
                ],
                testablesFacts: [
                    "Negative feedback reverses (opposes) the initial stimulus to restore the set point — it is the most common feedback mechanism.",
                    "Blood glucose regulation is a classic negative feedback loop: high glucose triggers insulin release, which lowers glucose."
                ]
            ),
            LessonSection(
                id: "l1-s5",
                heading: "Positive Feedback Loops",
                content: """
                Positive feedback amplifies the original stimulus, pushing the variable further away \
                from its starting value. Positive feedback loops are less common than negative feedback \
                and are typically involved in processes that need to be driven to completion rapidly. \
                A key example is blood clotting (coagulation): when a blood vessel is damaged, platelets \
                adhere and release chemicals that attract more platelets, rapidly building a clot. Another \
                example is labor contractions during childbirth: oxytocin stimulates uterine contractions, \
                which push the baby against the cervix, causing more oxytocin release and stronger \
                contractions until delivery occurs. Positive feedback loops require an external event \
                to break the cycle; otherwise, the amplification continues indefinitely.
                """,
                keyTerms: [
                    KeyTerm(id: "l1s5-k1", term: "Positive Feedback", definition: "A feedback mechanism in which the response amplifies the original stimulus, driving the process further in the same direction."),
                    KeyTerm(id: "l1s5-k2", term: "Oxytocin", definition: "A hormone that stimulates uterine contractions during labor; its release is amplified by a positive feedback loop."),
                    KeyTerm(id: "l1s5-k3", term: "Coagulation", definition: "The process of blood clotting, involving a positive feedback cascade of platelet aggregation and clotting factor activation.")
                ],
                testablesFacts: [
                    "Positive feedback amplifies the stimulus (pushes it further from the set point) and is used for processes that must reach completion quickly.",
                    "Childbirth (oxytocin-contraction cycle) and blood clotting are the two most commonly tested examples of positive feedback.",
                    "Positive feedback loops require an external event or endpoint to terminate the cycle."
                ]
            )
        ],
        clinicalApplication: ClinicalApplication(
            title: "Blood Pressure Regulation: Negative Feedback for EMTs",
            scenario: "A patient stands up quickly and feels dizzy (orthostatic hypotension). Baroreceptors in the carotid sinus and aortic arch detect the drop in blood pressure and send signals to the cardiovascular center in the medulla oblongata. The medulla increases sympathetic stimulation to the heart and blood vessels: heart rate increases and arterioles constrict, raising blood pressure back toward normal.",
            connection: "As an EMT, understanding this negative feedback loop explains why you assess orthostatic vitals (lying, sitting, standing) and why patients on beta-blockers may not compensate for position changes. If this reflex fails (e.g., in dehydrated or elderly patients), the patient may faint — a sign that homeostasis is compromised."
        )
    )

    // =========================================================================
    // MARK: - LESSON 2: Anatomical Terminology
    // =========================================================================

    static let lesson2 = Lesson(
        id: "lesson-2",
        weekNumber: 1,
        classNumber: 2,
        title: "Anatomical Terminology",
        subtitle: "Directional terms, body planes, and body cavities",
        textbookChapter: "Chapter 1",
        textbookSections: "1.6 - 1.7",
        sections: [
            LessonSection(
                id: "l2-s1",
                heading: "Anatomical Position",
                content: """
                All anatomical references use the standard anatomical position as a baseline. In \
                anatomical position, the person stands upright facing the observer, feet flat on the \
                floor and slightly apart, arms at the sides with palms facing forward (supinated). \
                The thumbs point laterally (away from the body). This convention eliminates ambiguity \
                in directional terminology regardless of the actual position of the patient. When you \
                say "the wrist is distal to the elbow," it is always interpreted relative to anatomical \
                position, even if the patient is lying down or has their arms crossed.
                """,
                keyTerms: [
                    KeyTerm(id: "l2s1-k1", term: "Anatomical Position", definition: "Standard reference position: body upright, face forward, feet slightly apart, arms at sides, palms facing forward."),
                    KeyTerm(id: "l2s1-k2", term: "Supine", definition: "Lying face up (on the back). Think: 'spine on the table.'"),
                    KeyTerm(id: "l2s1-k3", term: "Prone", definition: "Lying face down (on the stomach).")
                ],
                testablesFacts: [
                    "In anatomical position, the palms face anteriorly (forward) and the thumbs point laterally.",
                    "All directional terms are given relative to anatomical position, regardless of the patient's actual posture."
                ]
            ),
            LessonSection(
                id: "l2-s2",
                heading: "Directional Terms",
                content: """
                Directional terms describe the location of one body structure relative to another. \
                They are always used in pairs of opposites:\n\n\
                Superior (cranial) / Inferior (caudal): toward the head vs. toward the feet. \
                Example: the heart is superior to the diaphragm.\n\
                Anterior (ventral) / Posterior (dorsal): toward the front vs. toward the back. \
                Example: the sternum is anterior to the vertebral column.\n\
                Medial / Lateral: toward the midline vs. away from the midline. \
                Example: the ulna is medial to the radius.\n\
                Proximal / Distal: closer to the trunk (point of attachment) vs. farther from the trunk. \
                Used primarily for limbs. Example: the elbow is proximal to the wrist.\n\
                Superficial (external) / Deep (internal): closer to the body surface vs. farther from \
                the surface. Example: skin is superficial to muscle.\n\
                Ipsilateral / Contralateral: on the same side vs. on opposite sides. \
                Example: the right hand and right foot are ipsilateral.
                """,
                keyTerms: [
                    KeyTerm(id: "l2s2-k1", term: "Superior / Inferior", definition: "Superior: toward the head (cranial). Inferior: toward the feet (caudal)."),
                    KeyTerm(id: "l2s2-k2", term: "Anterior / Posterior", definition: "Anterior (ventral): toward the front. Posterior (dorsal): toward the back."),
                    KeyTerm(id: "l2s2-k3", term: "Medial / Lateral", definition: "Medial: toward the midline. Lateral: away from the midline."),
                    KeyTerm(id: "l2s2-k4", term: "Proximal / Distal", definition: "Proximal: closer to the trunk or point of attachment. Distal: farther from the trunk. Used for limbs."),
                    KeyTerm(id: "l2s2-k5", term: "Superficial / Deep", definition: "Superficial: closer to the body surface. Deep: farther from the surface, more internal.")
                ],
                testablesFacts: [
                    "Directional terms are always relative to anatomical position and are given in opposite pairs.",
                    "Proximal/distal are used mainly for limbs; proximal = closer to the trunk, distal = farther from the trunk.",
                    "Anterior = ventral and posterior = dorsal in standard human anatomical position (upright)."
                ]
            ),
            LessonSection(
                id: "l2-s3",
                heading: "Body Planes",
                content: """
                Body planes are imaginary flat surfaces used to divide the body for anatomical study \
                and medical imaging. The three primary planes are:\n\n\
                Sagittal plane: a vertical plane that divides the body into left and right portions. \
                A midsagittal (median) plane passes exactly through the midline, creating equal left \
                and right halves. A parasagittal plane is any sagittal plane that does not pass through \
                the midline.\n\
                Frontal (coronal) plane: a vertical plane that divides the body into anterior (front) \
                and posterior (back) portions.\n\
                Transverse (horizontal/cross-sectional) plane: a horizontal plane that divides the body \
                into superior (upper) and inferior (lower) portions.\n\n\
                These planes are fundamental to interpreting CT scans, MRIs, and other medical images.
                """,
                keyTerms: [
                    KeyTerm(id: "l2s3-k1", term: "Sagittal Plane", definition: "A vertical plane dividing the body into left and right portions. Midsagittal = equal halves through midline."),
                    KeyTerm(id: "l2s3-k2", term: "Frontal (Coronal) Plane", definition: "A vertical plane dividing the body into anterior (front) and posterior (back) portions."),
                    KeyTerm(id: "l2s3-k3", term: "Transverse Plane", definition: "A horizontal plane dividing the body into superior (upper) and inferior (lower) portions. Also called cross-sectional or horizontal plane.")
                ],
                testablesFacts: [
                    "Sagittal = left/right; Frontal (coronal) = front/back; Transverse = top/bottom.",
                    "A midsagittal plane divides the body into exactly equal left and right halves; a parasagittal plane is off-center."
                ]
            ),
            LessonSection(
                id: "l2-s4",
                heading: "Body Cavities",
                content: """
                The body contains two major cavities, each subdivided into smaller cavities that \
                house internal organs (viscera).\n\n\
                Dorsal cavity (posterior): Contains the cranial cavity (houses the brain) and the \
                vertebral (spinal) cavity (houses the spinal cord).\n\
                Ventral cavity (anterior): Divided by the diaphragm into the thoracic cavity \
                (superior) and the abdominopelvic cavity (inferior).\n\
                The thoracic cavity contains two pleural cavities (each surrounding a lung), the \
                mediastinum (central compartment containing the heart, trachea, esophagus, and great \
                vessels), and the pericardial cavity (surrounds the heart within the mediastinum).\n\
                The abdominopelvic cavity is subdivided into the abdominal cavity (stomach, intestines, \
                liver, spleen, kidneys) and the pelvic cavity (bladder, reproductive organs, rectum).\n\n\
                Serous membranes line the ventral body cavities and cover the organs. They produce \
                a thin serous fluid that reduces friction. The three serous membranes are: pleura \
                (lungs), pericardium (heart), and peritoneum (abdominal organs).
                """,
                keyTerms: [
                    KeyTerm(id: "l2s4-k1", term: "Dorsal Cavity", definition: "Posterior body cavity containing the cranial cavity (brain) and vertebral/spinal cavity (spinal cord)."),
                    KeyTerm(id: "l2s4-k2", term: "Thoracic Cavity", definition: "Superior portion of the ventral cavity; contains the lungs, heart, and mediastinum; bounded inferiorly by the diaphragm."),
                    KeyTerm(id: "l2s4-k3", term: "Abdominopelvic Cavity", definition: "Inferior portion of the ventral cavity; includes the abdominal cavity and the pelvic cavity."),
                    KeyTerm(id: "l2s4-k4", term: "Mediastinum", definition: "Central compartment of the thoracic cavity containing the heart, great vessels, trachea, and esophagus."),
                    KeyTerm(id: "l2s4-k5", term: "Serous Membrane", definition: "A double-layered membrane lining ventral body cavities (pleura, pericardium, peritoneum) that secretes lubricating serous fluid.")
                ],
                testablesFacts: [
                    "The diaphragm separates the thoracic cavity (above) from the abdominopelvic cavity (below).",
                    "The three serous membranes are: pleura (lungs), pericardium (heart), and peritoneum (abdominal organs).",
                    "The mediastinum is the central compartment of the thoracic cavity — it contains the heart, not the lungs."
                ]
            ),
            LessonSection(
                id: "l2-s5",
                heading: "Medical Imaging",
                content: """
                Anatomical knowledge is applied in medical imaging to visualize internal structures \
                without surgery. Key modalities include:\n\n\
                X-ray (radiography): Uses electromagnetic radiation to produce images; dense structures \
                like bone appear white, air appears black. Best for fractures and lung pathology.\n\
                CT (Computed Tomography): Uses rotating X-ray beams to produce detailed cross-sectional \
                (transverse) images. Excellent for detecting internal bleeding, tumors, and fractures.\n\
                MRI (Magnetic Resonance Imaging): Uses magnetic fields and radio waves (no ionizing \
                radiation) to produce highly detailed images of soft tissues. Best for brain, spinal \
                cord, joints, and muscles.\n\
                Ultrasound (sonography): Uses high-frequency sound waves. Safe (no radiation), used \
                for fetal imaging, cardiac evaluation (echocardiogram), and abdominal assessment.\n\
                Understanding body planes is essential for interpreting cross-sectional images from \
                CT and MRI scans.
                """,
                keyTerms: [
                    KeyTerm(id: "l2s5-k1", term: "CT Scan", definition: "Computed Tomography; uses rotating X-ray beams to create detailed cross-sectional images of the body."),
                    KeyTerm(id: "l2s5-k2", term: "MRI", definition: "Magnetic Resonance Imaging; uses magnetic fields and radio waves to visualize soft tissues without ionizing radiation."),
                    KeyTerm(id: "l2s5-k3", term: "Ultrasound", definition: "Imaging modality using high-frequency sound waves; no radiation; commonly used for fetal and cardiac imaging.")
                ],
                testablesFacts: [
                    "CT scans produce images in the transverse (cross-sectional) plane and use X-rays.",
                    "MRI does not use ionizing radiation — it uses magnetic fields and radio waves and is best for soft tissue."
                ]
            )
        ],
        clinicalApplication: ClinicalApplication(
            title: "Patient Positioning Terminology for EMTs",
            scenario: "An EMT responds to a call where the patient is found lying face down (prone). The patient is complaining of difficulty breathing. The EMT needs to communicate the patient's position to the hospital and reposition the patient supine (face up) for assessment. During transport, the patient is placed in Fowler's position (semi-sitting, head elevated 45-60 degrees) to ease breathing. The EMT documents that there is a laceration on the anterior surface of the left forearm, distal to the elbow, on the lateral aspect.",
            connection: "Precise anatomical terminology ensures that when you radio the ER, the receiving team knows exactly what to expect. Saying 'anterior left forearm laceration, lateral aspect, distal to the elbow' gives more useful information than 'cut on the arm.' Proper positioning terms (supine, prone, Fowler's, Trendelenburg) are used constantly in EMS for patient care documentation."
        )
    )

    // =========================================================================
    // MARK: - LESSON 3: Atoms, Bonds & Chemical Reactions
    // =========================================================================

    static let lesson3 = Lesson(
        id: "lesson-3",
        weekNumber: 2,
        classNumber: 3,
        title: "Atoms, Bonds & Chemical Reactions",
        subtitle: "Atomic structure, ions, electrolytes, and chemical bonds",
        textbookChapter: "Chapter 2",
        textbookSections: "2.1 - 2.3",
        sections: [
            LessonSection(
                id: "l3-s1",
                heading: "Atomic Structure",
                content: """
                Atoms are the basic units of matter. Each atom has a central nucleus containing \
                protons (positively charged) and neutrons (no charge). Electrons (negatively charged) \
                orbit the nucleus in electron shells (energy levels). The first shell holds up to 2 \
                electrons; the second and third shells hold up to 8 each (for biologically relevant \
                elements). The atomic number equals the number of protons and defines the element. \
                The mass number equals protons + neutrons. In an electrically neutral atom, the number \
                of protons equals the number of electrons. Isotopes are atoms of the same element with \
                different numbers of neutrons. Some isotopes are radioactive and are used in medical \
                imaging and cancer treatment. The outermost electron shell is called the valence shell, \
                and the electrons it contains (valence electrons) determine how the atom bonds with others. \
                Atoms are most stable when their valence shell is full (octet rule — 8 electrons, or \
                2 for the first shell).
                """,
                keyTerms: [
                    KeyTerm(id: "l3s1-k1", term: "Atom", definition: "The smallest unit of matter that retains the properties of an element; composed of protons, neutrons, and electrons."),
                    KeyTerm(id: "l3s1-k2", term: "Proton", definition: "A positively charged subatomic particle found in the nucleus; determines the element (atomic number)."),
                    KeyTerm(id: "l3s1-k3", term: "Electron", definition: "A negatively charged subatomic particle that orbits the nucleus in electron shells; determines bonding behavior."),
                    KeyTerm(id: "l3s1-k4", term: "Valence Shell", definition: "The outermost electron shell of an atom; the number of valence electrons determines bonding behavior."),
                    KeyTerm(id: "l3s1-k5", term: "Isotope", definition: "Atoms of the same element that differ in the number of neutrons (same atomic number, different mass number).")
                ],
                testablesFacts: [
                    "Atomic number = number of protons; mass number = protons + neutrons.",
                    "The valence shell (outermost electron shell) determines an atom's chemical bonding behavior.",
                    "The octet rule states atoms are most stable with 8 electrons in the valence shell (2 for the first shell)."
                ]
            ),
            LessonSection(
                id: "l3-s2",
                heading: "Ions & Electrolytes",
                content: """
                When an atom gains or loses electrons, it becomes an ion — a charged particle. An atom \
                that loses electrons becomes a cation (positively charged) because it now has more protons \
                than electrons. An atom that gains electrons becomes an anion (negatively charged). \
                For example, sodium (Na) commonly loses one electron to become Na+ (a cation), while \
                chlorine (Cl) gains one electron to become Cl- (an anion).\n\n\
                Electrolytes are substances that dissociate into ions when dissolved in water and can \
                conduct an electrical current. Key physiological electrolytes include sodium (Na+), \
                potassium (K+), calcium (Ca2+), chloride (Cl-), and bicarbonate (HCO3-). These ions \
                are critical for nerve impulse transmission, muscle contraction, maintaining fluid \
                balance, and regulating pH. Electrolyte imbalances can cause muscle cramps, cardiac \
                arrhythmias, and even death.
                """,
                keyTerms: [
                    KeyTerm(id: "l3s2-k1", term: "Ion", definition: "An atom that has gained or lost one or more electrons, giving it a net electrical charge."),
                    KeyTerm(id: "l3s2-k2", term: "Cation", definition: "A positively charged ion formed when an atom loses one or more electrons (e.g., Na+, K+, Ca2+)."),
                    KeyTerm(id: "l3s2-k3", term: "Anion", definition: "A negatively charged ion formed when an atom gains one or more electrons (e.g., Cl-, HCO3-)."),
                    KeyTerm(id: "l3s2-k4", term: "Electrolyte", definition: "A substance that dissociates into ions in solution and can conduct electrical current; essential for nerve and muscle function.")
                ],
                testablesFacts: [
                    "Cations are positive (lost electrons); anions are negative (gained electrons). Mnemonic: CATion = PAWSitive.",
                    "Key body electrolytes: Na+, K+, Ca2+, Cl-, HCO3-. Imbalances can cause arrhythmias and muscle dysfunction."
                ]
            ),
            LessonSection(
                id: "l3-s3",
                heading: "Chemical Bonds",
                content: """
                Chemical bonds hold atoms together. The three main types relevant to human physiology are:\n\n\
                Ionic bonds: Formed when one atom transfers one or more electrons to another atom. \
                This creates oppositely charged ions (cation and anion) that are attracted to each other. \
                Example: NaCl (table salt) — Na donates an electron to Cl. Ionic compounds tend to \
                dissociate in water, forming electrolytes.\n\n\
                Covalent bonds: Formed when two atoms share one or more pairs of electrons. These are \
                the strongest bonds in the body. In a nonpolar covalent bond, electrons are shared \
                equally (e.g., O2). In a polar covalent bond, electrons are shared unequally because \
                one atom is more electronegative (e.g., water — oxygen pulls electrons more strongly \
                than hydrogen). Polar bonds create partial charges on the molecule.\n\n\
                Hydrogen bonds: Weak attractions between a slightly positive hydrogen atom (bonded to \
                an electronegative atom like O or N) and a nearby electronegative atom. Individually \
                weak, but collectively they are very important — they hold water molecules together, \
                stabilize protein shape, and hold the two strands of DNA together.
                """,
                keyTerms: [
                    KeyTerm(id: "l3s3-k1", term: "Ionic Bond", definition: "A bond formed by the transfer of electrons from one atom to another, creating oppositely charged ions that attract each other."),
                    KeyTerm(id: "l3s3-k2", term: "Covalent Bond", definition: "A bond formed by the sharing of electron pairs between atoms. The strongest type of chemical bond in the body."),
                    KeyTerm(id: "l3s3-k3", term: "Polar Covalent Bond", definition: "A covalent bond in which electrons are shared unequally due to differences in electronegativity, creating partial charges."),
                    KeyTerm(id: "l3s3-k4", term: "Hydrogen Bond", definition: "A weak attraction between a slightly positive H atom and a nearby electronegative atom (O or N). Important in water, proteins, and DNA."),
                    KeyTerm(id: "l3s3-k5", term: "Electronegativity", definition: "The tendency of an atom to attract shared electrons toward itself in a chemical bond.")
                ],
                testablesFacts: [
                    "Ionic bonds involve electron transfer; covalent bonds involve electron sharing.",
                    "Covalent bonds are the strongest bonds in the body; hydrogen bonds are individually weak but collectively very important.",
                    "Water has polar covalent bonds — oxygen is more electronegative than hydrogen, creating partial charges."
                ]
            ),
            LessonSection(
                id: "l3-s4",
                heading: "Enzymes & Chemical Reactions",
                content: """
                A chemical reaction occurs when chemical bonds are formed, broken, or rearranged. \
                Reactants are the starting substances; products are the ending substances. The main \
                types of reactions are:\n\
                Synthesis (anabolic): A + B -> AB (smaller molecules combine into a larger one).\n\
                Decomposition (catabolic): AB -> A + B (a larger molecule is broken into smaller ones).\n\
                Exchange: AB + CD -> AD + CB (atoms are exchanged between molecules).\n\n\
                Activation energy is the minimum energy needed to start a reaction. Enzymes are \
                biological catalysts (usually proteins) that lower the activation energy, dramatically \
                speeding up reactions. Each enzyme has an active site — a specifically shaped region \
                where the substrate (reactant) binds, following the induced-fit model. Enzymes are \
                highly specific: each enzyme typically catalyzes only one type of reaction. Enzyme names \
                usually end in "-ase" (e.g., lactase breaks down lactose). Factors affecting enzyme \
                activity include temperature, pH, and substrate concentration. Extreme heat or pH \
                changes can denature an enzyme, altering its shape and destroying its function.
                """,
                keyTerms: [
                    KeyTerm(id: "l3s4-k1", term: "Activation Energy", definition: "The minimum energy required to initiate a chemical reaction."),
                    KeyTerm(id: "l3s4-k2", term: "Active Site", definition: "The specifically shaped region on an enzyme where the substrate binds for catalysis."),
                    KeyTerm(id: "l3s4-k3", term: "Substrate", definition: "The reactant molecule that binds to the enzyme's active site."),
                    KeyTerm(id: "l3s4-k4", term: "Denaturation", definition: "The unfolding or alteration of a protein's (or enzyme's) three-dimensional shape, resulting in loss of function.")
                ],
                testablesFacts: [
                    "Enzymes lower activation energy — they do NOT change the direction or final outcome of a reaction.",
                    "Enzymes are specific to their substrates; the substrate binds at the active site (induced-fit model).",
                    "Denaturation (caused by extreme temperature or pH) destroys enzyme function by changing its shape."
                ]
            )
        ],
        clinicalApplication: ClinicalApplication(
            title: "Electrolytes and the EKG Connection",
            scenario: "A 58-year-old patient presents with muscle weakness and an irregular heartbeat. A 12-lead EKG shows tall, peaked T-waves and a widened QRS complex. Blood work reveals a potassium level of 6.8 mEq/L (normal: 3.5-5.0 mEq/L). The patient is hyperkalemic. Potassium ions (K+) are critical for generating the electrical impulses that control heart rhythm. When K+ levels are too high, the resting membrane potential of cardiac cells shifts, causing dangerous arrhythmias.",
            connection: "As an EMT, you will see EKG changes caused by electrolyte imbalances — especially potassium. Hyperkalemia (high K+) can cause peaked T-waves, widened QRS, and cardiac arrest. Hypokalemia (low K+) can cause flattened T-waves and U-waves. Understanding that ions carry electrical charge and that the heart depends on precise ionic gradients helps you recognize why electrolyte emergencies are life-threatening."
        )
    )

    // =========================================================================
    // MARK: - LESSON 4: Inorganic vs Organic Compounds
    // =========================================================================

    static let lesson4 = Lesson(
        id: "lesson-4",
        weekNumber: 2,
        classNumber: 4,
        title: "Inorganic vs Organic Compounds",
        subtitle: "Acids, bases, pH, buffers, macromolecules, and ATP",
        textbookChapter: "Chapter 2",
        textbookSections: "2.4 - 2.5",
        sections: [
            LessonSection(
                id: "l4-s1",
                heading: "Acids, Bases & pH",
                content: """
                Water (H2O) can dissociate into hydrogen ions (H+) and hydroxide ions (OH-). \
                The relative concentrations of H+ and OH- determine whether a solution is acidic, \
                basic, or neutral.\n\n\
                An acid is a substance that releases H+ ions in solution, increasing the H+ concentration. \
                A base (alkali) is a substance that releases OH- ions or accepts H+ ions, decreasing the \
                H+ concentration. The pH scale measures hydrogen ion concentration on a scale from 0 to 14. \
                pH 7 is neutral (pure water). Below 7 is acidic (more H+). Above 7 is basic/alkaline \
                (more OH-). The scale is logarithmic: each whole number change represents a tenfold \
                change in H+ concentration. Normal blood pH is 7.35-7.45 (slightly alkaline). Even \
                small deviations can be life-threatening.
                """,
                keyTerms: [
                    KeyTerm(id: "l4s1-k1", term: "Acid", definition: "A substance that releases hydrogen ions (H+) in solution, lowering the pH."),
                    KeyTerm(id: "l4s1-k2", term: "Base (Alkali)", definition: "A substance that releases hydroxide ions (OH-) or accepts H+ in solution, raising the pH."),
                    KeyTerm(id: "l4s1-k3", term: "pH", definition: "A measure of hydrogen ion concentration on a 0-14 scale; 7 is neutral, below 7 is acidic, above 7 is basic."),
                    KeyTerm(id: "l4s1-k4", term: "Logarithmic Scale", definition: "Each unit change in pH represents a tenfold change in H+ concentration (pH 5 is 10x more acidic than pH 6).")
                ],
                testablesFacts: [
                    "Normal blood pH is 7.35-7.45 (slightly alkaline). Below 7.35 = acidosis; above 7.45 = alkalosis.",
                    "The pH scale is logarithmic: a change of 1 pH unit = a 10-fold change in H+ concentration.",
                    "Acids donate H+ (proton donors); bases accept H+ (proton acceptors) or release OH-."
                ]
            ),
            LessonSection(
                id: "l4-s2",
                heading: "Buffers",
                content: """
                A buffer is a chemical system that resists changes in pH by neutralizing both excess \
                acids and excess bases. Buffers are essential for maintaining homeostasis because \
                enzymatic reactions and cellular processes require a stable pH.\n\n\
                The most important buffer system in blood is the bicarbonate buffer system: carbonic \
                acid (H2CO3) and bicarbonate ion (HCO3-). When blood becomes too acidic (excess H+), \
                bicarbonate ions accept the H+ to form carbonic acid, which then breaks down into CO2 \
                and water. When blood becomes too basic, carbonic acid releases H+ to lower the pH. \
                Other buffer systems include the phosphate buffer system (important intracellularly) \
                and the protein buffer system. Breathing rate also regulates pH by controlling CO2 \
                levels — hyperventilation blows off CO2 and raises pH, while hypoventilation retains \
                CO2 and lowers pH.
                """,
                keyTerms: [
                    KeyTerm(id: "l4s2-k1", term: "Buffer", definition: "A chemical system that resists changes in pH by neutralizing excess acids or bases."),
                    KeyTerm(id: "l4s2-k2", term: "Bicarbonate Buffer System", definition: "The primary blood buffer: H2CO3 (carbonic acid) / HCO3- (bicarbonate) neutralizes excess H+ or OH-."),
                    KeyTerm(id: "l4s2-k3", term: "Carbonic Acid (H2CO3)", definition: "A weak acid formed from CO2 + H2O; part of the bicarbonate buffer system that helps regulate blood pH.")
                ],
                testablesFacts: [
                    "The bicarbonate buffer system (H2CO3 / HCO3-) is the primary buffer in blood.",
                    "Hyperventilation blows off CO2, raises pH (more alkaline); hypoventilation retains CO2, lowers pH (more acidic)."
                ]
            ),
            LessonSection(
                id: "l4-s3",
                heading: "Carbohydrates & Lipids",
                content: """
                Organic molecules contain carbon and hydrogen (and usually oxygen). The four major \
                classes of organic macromolecules are carbohydrates, lipids, proteins, and nucleic acids.\n\n\
                Carbohydrates contain C, H, and O in roughly a 1:2:1 ratio. They are the body's primary \
                short-term energy source. Monosaccharides are simple sugars (glucose, fructose, galactose). \
                Disaccharides are two monosaccharides joined by a dehydration synthesis reaction (sucrose, \
                lactose, maltose). Polysaccharides are long chains of monosaccharides (glycogen is the \
                storage form in animals; starch in plants). Dehydration synthesis (condensation) removes \
                water to join monomers. Hydrolysis adds water to break bonds between monomers.\n\n\
                Lipids are hydrophobic (water-insoluble) molecules. Key types include triglycerides \
                (fats and oils — energy storage, insulation, and protection), phospholipids (form cell \
                membranes — amphipathic with hydrophilic heads and hydrophobic tails), and steroids \
                (cholesterol and steroid hormones — 4 fused carbon rings). Triglycerides consist of \
                glycerol + 3 fatty acid chains. Saturated fats have no double bonds between carbons \
                (solid at room temp); unsaturated fats have one or more double bonds (liquid at room temp).
                """,
                keyTerms: [
                    KeyTerm(id: "l4s3-k1", term: "Monosaccharide", definition: "A simple sugar (e.g., glucose, fructose, galactose) — the monomer of carbohydrates."),
                    KeyTerm(id: "l4s3-k2", term: "Dehydration Synthesis", definition: "A reaction that joins two monomers by removing a water molecule (also called a condensation reaction)."),
                    KeyTerm(id: "l4s3-k3", term: "Hydrolysis", definition: "A reaction that breaks a bond between monomers by adding a water molecule."),
                    KeyTerm(id: "l4s3-k4", term: "Triglyceride", definition: "A lipid composed of glycerol + 3 fatty acids; the main form of energy storage in the body (body fat)."),
                    KeyTerm(id: "l4s3-k5", term: "Phospholipid", definition: "An amphipathic lipid with a hydrophilic phosphate head and two hydrophobic fatty acid tails; forms cell membranes.")
                ],
                testablesFacts: [
                    "Dehydration synthesis removes water to build polymers; hydrolysis adds water to break them apart.",
                    "Glucose is the primary fuel for cellular respiration; glycogen is the storage form of glucose in animals.",
                    "Phospholipids are amphipathic (hydrophilic head, hydrophobic tails) and form the cell membrane bilayer."
                ]
            ),
            LessonSection(
                id: "l4-s4",
                heading: "Proteins & Nucleic Acids",
                content: """
                Proteins are polymers of amino acids linked by peptide bonds. There are 20 different \
                amino acids; each has an amino group (NH2), a carboxyl group (COOH), and a unique \
                R-group (side chain) that determines its properties. Protein structure has four levels: \
                primary (amino acid sequence), secondary (alpha-helices and beta-pleated sheets from \
                hydrogen bonding), tertiary (3D folding from R-group interactions), and quaternary \
                (multiple polypeptide subunits). Proteins serve as enzymes, structural components, \
                antibodies, transport molecules (hemoglobin), hormones, and contractile elements. \
                Denaturation disrupts the 3D shape and function.\n\n\
                Nucleic acids are polymers of nucleotides. Each nucleotide has a sugar, a phosphate \
                group, and a nitrogenous base. DNA (deoxyribonucleic acid) stores genetic instructions \
                as a double helix (bases: A, T, C, G). RNA (ribonucleic acid) helps translate DNA into \
                proteins (bases: A, U, C, G — uracil replaces thymine). ATP (adenosine triphosphate) \
                is also a nucleotide.
                """,
                keyTerms: [
                    KeyTerm(id: "l4s4-k1", term: "Amino Acid", definition: "The monomer of proteins; contains an amino group, carboxyl group, and a unique R-group (side chain)."),
                    KeyTerm(id: "l4s4-k2", term: "Peptide Bond", definition: "A covalent bond joining two amino acids, formed by dehydration synthesis between the amino group and carboxyl group."),
                    KeyTerm(id: "l4s4-k3", term: "Nucleotide", definition: "The monomer of nucleic acids; composed of a sugar, a phosphate group, and a nitrogenous base."),
                    KeyTerm(id: "l4s4-k4", term: "DNA", definition: "Deoxyribonucleic acid; a double-helix polymer of nucleotides (A, T, C, G) that stores genetic information."),
                    KeyTerm(id: "l4s4-k5", term: "RNA", definition: "Ribonucleic acid; a single-stranded nucleotide polymer (A, U, C, G) involved in translating DNA into proteins.")
                ],
                testablesFacts: [
                    "The four levels of protein structure: primary (sequence), secondary (helices/sheets), tertiary (3D shape), quaternary (multiple subunits).",
                    "DNA bases: A-T, C-G (double helix). RNA bases: A-U, C-G (single-stranded, uracil replaces thymine).",
                    "There are 20 amino acids; the R-group (side chain) makes each unique."
                ]
            ),
            LessonSection(
                id: "l4-s5",
                heading: "ATP: The Energy Currency",
                content: """
                Adenosine triphosphate (ATP) is the primary energy currency of the cell. It is a \
                nucleotide composed of adenine (a nitrogenous base), ribose (a sugar), and three \
                phosphate groups. Energy is stored in the bonds between the phosphate groups, \
                particularly the terminal (third) phosphate bond.\n\n\
                When the cell needs energy, the enzyme ATPase catalyzes the hydrolysis of ATP, \
                removing the terminal phosphate group to produce ADP (adenosine diphosphate) + Pi \
                (inorganic phosphate) + energy. This energy powers cellular processes including muscle \
                contraction, active transport across membranes, and biosynthesis.\n\n\
                ATP is regenerated by adding a phosphate group back to ADP via cellular respiration \
                (primarily in the mitochondria). The ATP cycle is continuous: the body recycles its own \
                weight in ATP every day, even though only about 50 grams exist in the body at any moment.
                """,
                keyTerms: [
                    KeyTerm(id: "l4s5-k1", term: "ATP (Adenosine Triphosphate)", definition: "The primary energy currency of the cell; composed of adenine, ribose, and three phosphate groups."),
                    KeyTerm(id: "l4s5-k2", term: "ADP (Adenosine Diphosphate)", definition: "The product of ATP hydrolysis after one phosphate is removed; regenerated to ATP by cellular respiration."),
                    KeyTerm(id: "l4s5-k3", term: "Cellular Respiration", definition: "The metabolic process (mainly in mitochondria) that breaks down glucose to regenerate ATP from ADP + Pi.")
                ],
                testablesFacts: [
                    "ATP -> ADP + Pi + Energy (hydrolysis releases energy); ADP + Pi + Energy -> ATP (synthesis stores energy).",
                    "ATP is regenerated primarily in the mitochondria via cellular respiration.",
                    "The body contains only about 50 g of ATP at any moment but recycles its body weight in ATP daily."
                ]
            )
        ],
        clinicalApplication: ClinicalApplication(
            title: "Acidosis and Alkalosis in Emergency Medicine",
            scenario: "A patient with uncontrolled diabetes arrives by ambulance breathing rapidly and deeply (Kussmaul breathing). Blood gas analysis shows pH 7.22, indicating metabolic acidosis (diabetic ketoacidosis — DKA). The body is producing excess ketone acids from fat breakdown because cells cannot use glucose without sufficient insulin. The rapid, deep breathing is a compensatory mechanism: by exhaling more CO2, the body attempts to raise pH. Conversely, a patient hyperventilating from an anxiety attack may develop respiratory alkalosis (pH 7.50) from blowing off too much CO2.",
            connection: "As an EMT, recognizing breathing patterns tells you about pH status. Kussmaul breathing suggests metabolic acidosis (think DKA, renal failure). Rapid shallow breathing from anxiety can cause respiratory alkalosis. You will use this knowledge to prioritize treatments: DKA patients need IV fluids and insulin; hyperventilating patients may benefit from coaching to slow their breathing. Understanding the bicarbonate buffer system and the CO2-pH connection is foundational for interpreting these presentations."
        )
    )

    // =========================================================================
    // MARK: - QUIZ: Week 1 Review (Lessons 1 & 2)
    // =========================================================================

    static let quizWeek1 = Quiz(
        id: "quiz-week1",
        title: "Week 1 Review",
        weekNumber: 1,
        lessonIds: ["lesson-1", "lesson-2"],
        questions: [
            // Q1 - Easy / Recall
            QuizQuestion(
                id: "q1-01",
                question: "What is the correct order of structural organization from simplest to most complex?",
                choices: [
                    "Cell, tissue, molecule, organ, organ system, organism",
                    "Chemical, cellular, tissue, organ, organ system, organism",
                    "Atom, organ, tissue, cell, organ system, organism",
                    "Chemical, tissue, cellular, organ system, organ, organism"
                ],
                correctIndex: 1,
                explanation: "The six levels from simplest to most complex are: chemical (atoms/molecules), cellular, tissue, organ, organ system, organism.",
                difficulty: .easy,
                category: .recall
            ),
            // Q2 - Easy / Recall
            QuizQuestion(
                id: "q1-02",
                question: "Which of the following is the smallest living structural and functional unit of the body?",
                choices: [
                    "Molecule",
                    "Organ",
                    "Cell",
                    "Tissue"
                ],
                correctIndex: 2,
                explanation: "The cell is the smallest living unit. Molecules and atoms are not alive; tissues are groups of cells.",
                difficulty: .easy,
                category: .recall
            ),
            // Q3 - Easy / Recall
            QuizQuestion(
                id: "q1-03",
                question: "What are the four primary tissue types in the human body?",
                choices: [
                    "Epithelial, connective, muscular, nervous",
                    "Epithelial, skeletal, cardiac, nervous",
                    "Blood, bone, muscle, skin",
                    "Connective, protective, supportive, contractile"
                ],
                correctIndex: 0,
                explanation: "The four primary tissue types are epithelial, connective, muscular, and nervous tissue.",
                difficulty: .easy,
                category: .recall
            ),
            // Q4 - Easy / Recall
            QuizQuestion(
                id: "q1-04",
                question: "In anatomical position, which direction do the palms face?",
                choices: [
                    "Posteriorly (backward)",
                    "Medially (toward the body)",
                    "Anteriorly (forward)",
                    "Inferiorly (downward)"
                ],
                correctIndex: 2,
                explanation: "In anatomical position, the person stands upright with palms facing anteriorly (forward) and thumbs pointing laterally.",
                difficulty: .easy,
                category: .recall
            ),
            // Q5 - Easy / Recall
            QuizQuestion(
                id: "q1-05",
                question: "Which body plane divides the body into left and right portions?",
                choices: [
                    "Frontal (coronal) plane",
                    "Transverse plane",
                    "Sagittal plane",
                    "Oblique plane"
                ],
                correctIndex: 2,
                explanation: "The sagittal plane divides the body into left and right portions. A midsagittal plane creates equal halves.",
                difficulty: .easy,
                category: .recall
            ),
            // Q6 - Easy / Recall
            QuizQuestion(
                id: "q1-06",
                question: "Which structure separates the thoracic cavity from the abdominopelvic cavity?",
                choices: [
                    "Mediastinum",
                    "Peritoneum",
                    "Diaphragm",
                    "Pleura"
                ],
                correctIndex: 2,
                explanation: "The diaphragm is a dome-shaped muscle that separates the thoracic cavity (above) from the abdominopelvic cavity (below).",
                difficulty: .easy,
                category: .recall
            ),
            // Q7 - Medium / Application
            QuizQuestion(
                id: "q1-07",
                question: "A patient's blood glucose rises after eating a meal. The pancreas releases insulin, which causes cells to take up glucose, lowering blood sugar. This is an example of:",
                choices: [
                    "Positive feedback",
                    "Negative feedback",
                    "Metabolic equilibrium",
                    "Anabolic reaction"
                ],
                correctIndex: 1,
                explanation: "This is negative feedback because the response (insulin-mediated glucose uptake) opposes the original change (rising blood glucose), bringing it back toward the set point.",
                difficulty: .medium,
                category: .application
            ),
            // Q8 - Medium / Application
            QuizQuestion(
                id: "q1-08",
                question: "During childbirth, oxytocin stimulates uterine contractions, which push the baby against the cervix, causing more oxytocin release. This is an example of:",
                choices: [
                    "Negative feedback",
                    "Positive feedback",
                    "Homeostatic set point adjustment",
                    "Dynamic equilibrium"
                ],
                correctIndex: 1,
                explanation: "This is positive feedback: the response (more oxytocin) amplifies the original stimulus (contractions). The loop continues until the baby is delivered.",
                difficulty: .medium,
                category: .application
            ),
            // Q9 - Medium / Application
            QuizQuestion(
                id: "q1-09",
                question: "The knee is _______ to the ankle, and the skin is _______ to the muscles.",
                choices: [
                    "Distal; deep",
                    "Proximal; superficial",
                    "Inferior; superficial",
                    "Superior; deep"
                ],
                correctIndex: 1,
                explanation: "The knee is proximal (closer to trunk) relative to the ankle. The skin is superficial (closer to body surface) relative to the muscles.",
                difficulty: .medium,
                category: .application
            ),
            // Q10 - Medium / Application
            QuizQuestion(
                id: "q1-10",
                question: "A CT scan produces images in which body plane?",
                choices: [
                    "Sagittal",
                    "Frontal (coronal)",
                    "Transverse (cross-sectional)",
                    "Midsagittal"
                ],
                correctIndex: 2,
                explanation: "Standard CT scans produce images in the transverse (cross-sectional/horizontal) plane, dividing the body into superior and inferior portions.",
                difficulty: .medium,
                category: .application
            ),
            // Q11 - Hard / Analysis
            QuizQuestion(
                id: "q1-11",
                question: "Which of the following is NOT a characteristic that distinguishes negative feedback from positive feedback?",
                choices: [
                    "Negative feedback opposes the stimulus; positive feedback amplifies it",
                    "Negative feedback is more common in the body than positive feedback",
                    "Negative feedback maintains homeostasis; positive feedback disrupts it permanently",
                    "Positive feedback requires an external event to stop the cycle"
                ],
                correctIndex: 2,
                explanation: "Choice C is false. Positive feedback does not 'permanently disrupt' homeostasis — it drives processes to completion (e.g., childbirth, clotting) and then stops. Both mechanisms serve the body's needs.",
                difficulty: .hard,
                category: .analysis
            ),
            // Q12 - Hard / Analysis
            QuizQuestion(
                id: "q1-12",
                question: "If you made a cut that separated the body into anterior and posterior portions, which plane would you have cut along?",
                choices: [
                    "Transverse",
                    "Sagittal",
                    "Frontal (coronal)",
                    "Parasagittal"
                ],
                correctIndex: 2,
                explanation: "The frontal (coronal) plane divides the body into anterior (front) and posterior (back) portions.",
                difficulty: .hard,
                category: .analysis
            ),
            // Q13 - Hard / Analysis
            QuizQuestion(
                id: "q1-13",
                question: "The heart is located in the mediastinum. Based on your knowledge of body cavities, the mediastinum is part of which cavity?",
                choices: [
                    "Abdominal cavity",
                    "Pleural cavity",
                    "Thoracic cavity",
                    "Pericardial cavity"
                ],
                correctIndex: 2,
                explanation: "The mediastinum is the central compartment of the thoracic cavity. It contains the heart (within the pericardial cavity), great vessels, trachea, and esophagus. The pleural cavities flank it on either side.",
                difficulty: .hard,
                category: .analysis
            ),
            // Q14 - Clinical
            QuizQuestion(
                id: "q1-14",
                question: "An EMT documents that a patient has a laceration on the 'anterior surface of the left forearm, distal to the elbow, on the lateral aspect.' Where is this wound?",
                choices: [
                    "Back of the left forearm, near the elbow, toward the thumb side",
                    "Front of the left forearm, near the wrist, toward the thumb side",
                    "Front of the left forearm, near the elbow, toward the pinky side",
                    "Back of the left forearm, near the wrist, toward the pinky side"
                ],
                correctIndex: 1,
                explanation: "Anterior = front; distal to the elbow = toward the wrist; lateral aspect of the forearm (in anatomical position) = the thumb side (radius side).",
                difficulty: .medium,
                category: .clinical
            ),
            // Q15 - Clinical
            QuizQuestion(
                id: "q1-15",
                question: "A patient who has been standing in the sun begins sweating profusely and their skin blood vessels dilate. Which homeostatic component do the sweat glands and blood vessels represent?",
                choices: [
                    "Receptors (sensors)",
                    "Control centers",
                    "Effectors",
                    "Set points"
                ],
                correctIndex: 2,
                explanation: "Sweat glands and blood vessels are effectors — they carry out the response directed by the control center (hypothalamus) to cool the body and restore the temperature set point.",
                difficulty: .medium,
                category: .clinical
            )
        ],
        timeLimit: nil
    )

    // =========================================================================
    // MARK: - QUIZ: Week 2 Review / Quiz 1 Prep (All 4 Lessons)
    // =========================================================================

    static let quizWeek2 = Quiz(
        id: "quiz-week2",
        title: "Week 2 Review (Quiz 1 Prep)",
        weekNumber: 2,
        lessonIds: ["lesson-1", "lesson-2", "lesson-3", "lesson-4"],
        questions: [
            // Q1 - Easy / Recall
            QuizQuestion(
                id: "q2-01",
                question: "How many protons does an atom with an atomic number of 6 have?",
                choices: ["3", "6", "12", "8"],
                correctIndex: 1,
                explanation: "The atomic number equals the number of protons. An atomic number of 6 means 6 protons (this is carbon).",
                difficulty: .easy,
                category: .recall
            ),
            // Q2 - Easy / Recall
            QuizQuestion(
                id: "q2-02",
                question: "A positively charged ion is called a:",
                choices: ["Anion", "Isotope", "Cation", "Molecule"],
                correctIndex: 2,
                explanation: "A cation is a positively charged ion (it lost electrons). An anion is negatively charged (gained electrons).",
                difficulty: .easy,
                category: .recall
            ),
            // Q3 - Easy / Recall
            QuizQuestion(
                id: "q2-03",
                question: "Which type of chemical bond involves the SHARING of electron pairs?",
                choices: ["Ionic bond", "Hydrogen bond", "Covalent bond", "Metallic bond"],
                correctIndex: 2,
                explanation: "Covalent bonds form when atoms share one or more pairs of electrons. Ionic bonds involve electron transfer.",
                difficulty: .easy,
                category: .recall
            ),
            // Q4 - Easy / Recall
            QuizQuestion(
                id: "q2-04",
                question: "What is the normal pH range of human blood?",
                choices: ["6.80 - 7.00", "7.00 - 7.20", "7.35 - 7.45", "7.50 - 7.70"],
                correctIndex: 2,
                explanation: "Normal blood pH is 7.35-7.45 (slightly alkaline). Below 7.35 is acidosis; above 7.45 is alkalosis.",
                difficulty: .easy,
                category: .recall
            ),
            // Q5 - Easy / Recall
            QuizQuestion(
                id: "q2-05",
                question: "Which macromolecule is the body's primary short-term energy source?",
                choices: ["Proteins", "Lipids", "Carbohydrates", "Nucleic acids"],
                correctIndex: 2,
                explanation: "Carbohydrates (especially glucose) are the body's primary short-term energy source. Lipids are used for long-term energy storage.",
                difficulty: .easy,
                category: .recall
            ),
            // Q6 - Easy / Recall
            QuizQuestion(
                id: "q2-06",
                question: "What is the monomer (building block) of proteins?",
                choices: ["Nucleotides", "Monosaccharides", "Fatty acids", "Amino acids"],
                correctIndex: 3,
                explanation: "Amino acids are the monomers of proteins, linked by peptide bonds. There are 20 different amino acids.",
                difficulty: .easy,
                category: .recall
            ),
            // Q7 - Easy / Recall
            QuizQuestion(
                id: "q2-07",
                question: "ATP stands for:",
                choices: [
                    "Adenine triphosphate",
                    "Adenosine triphosphate",
                    "Adenosine trisulfate",
                    "Amino triphosphate"
                ],
                correctIndex: 1,
                explanation: "ATP = Adenosine Triphosphate. It consists of adenine + ribose + three phosphate groups.",
                difficulty: .easy,
                category: .recall
            ),
            // Q8 - Easy / Recall
            QuizQuestion(
                id: "q2-08",
                question: "Which nitrogenous base is found in RNA but NOT in DNA?",
                choices: ["Adenine", "Cytosine", "Uracil", "Guanine"],
                correctIndex: 2,
                explanation: "RNA uses uracil (U) in place of thymine (T). DNA bases: A, T, C, G. RNA bases: A, U, C, G.",
                difficulty: .easy,
                category: .recall
            ),
            // Q9 - Medium / Application
            QuizQuestion(
                id: "q2-09",
                question: "Table salt (NaCl) dissolves in water and separates into Na+ and Cl-. This makes NaCl a(n):",
                choices: ["Buffer", "Enzyme", "Electrolyte", "Catalyst"],
                correctIndex: 2,
                explanation: "An electrolyte is a substance that dissociates into ions in solution and conducts electricity. NaCl dissociates into Na+ and Cl-.",
                difficulty: .medium,
                category: .application
            ),
            // Q10 - Medium / Application
            QuizQuestion(
                id: "q2-10",
                question: "An enzyme speeds up a reaction by:",
                choices: [
                    "Increasing the temperature of the reaction",
                    "Lowering the activation energy required",
                    "Changing the products of the reaction",
                    "Adding more reactants to the solution"
                ],
                correctIndex: 1,
                explanation: "Enzymes lower the activation energy needed to start a reaction. They do not change the final products or alter temperature.",
                difficulty: .medium,
                category: .application
            ),
            // Q11 - Medium / Application
            QuizQuestion(
                id: "q2-11",
                question: "If a solution has a pH of 3 and you change it to pH 5, the H+ concentration has:",
                choices: [
                    "Increased 100-fold",
                    "Decreased 2-fold",
                    "Decreased 100-fold",
                    "Stayed the same"
                ],
                correctIndex: 2,
                explanation: "The pH scale is logarithmic. Each unit increase = 10x decrease in H+. Two units (3 to 5) = 10 x 10 = 100-fold decrease in H+.",
                difficulty: .medium,
                category: .application
            ),
            // Q12 - Medium / Application
            QuizQuestion(
                id: "q2-12",
                question: "When two amino acids are joined together, a water molecule is removed. This type of reaction is called:",
                choices: [
                    "Hydrolysis",
                    "Dehydration synthesis",
                    "Oxidation",
                    "Decomposition"
                ],
                correctIndex: 1,
                explanation: "Dehydration synthesis (condensation) joins monomers by removing water. Hydrolysis is the reverse — it breaks bonds by adding water.",
                difficulty: .medium,
                category: .application
            ),
            // Q13 - Medium / Application
            QuizQuestion(
                id: "q2-13",
                question: "A phospholipid has a hydrophilic head and hydrophobic tails. In water, phospholipids arrange into a bilayer because:",
                choices: [
                    "The heads repel each other",
                    "The tails are attracted to water molecules",
                    "The hydrophobic tails face inward to avoid water, while hydrophilic heads face the water",
                    "Ionic bonds hold the two layers together"
                ],
                correctIndex: 2,
                explanation: "Phospholipids are amphipathic. In water, the hydrophilic heads face outward toward the water, and the hydrophobic tails face inward, away from water, creating a bilayer.",
                difficulty: .medium,
                category: .application
            ),
            // Q14 - Medium / Application
            QuizQuestion(
                id: "q2-14",
                question: "Water is a polar molecule because:",
                choices: [
                    "It contains ionic bonds",
                    "Oxygen is more electronegative than hydrogen, creating unequal electron sharing",
                    "Hydrogen atoms repel each other",
                    "It has no electrical charge"
                ],
                correctIndex: 1,
                explanation: "In water, oxygen is more electronegative than hydrogen, pulling shared electrons closer to itself. This creates partial negative charge on O and partial positive charge on H — a polar covalent bond.",
                difficulty: .medium,
                category: .application
            ),
            // Q15 - Hard / Analysis
            QuizQuestion(
                id: "q2-15",
                question: "Which level of protein structure is MOST directly determined by the gene sequence in DNA?",
                choices: [
                    "Primary structure (amino acid sequence)",
                    "Secondary structure (alpha-helices and beta-sheets)",
                    "Tertiary structure (3D folding)",
                    "Quaternary structure (multiple subunits)"
                ],
                correctIndex: 0,
                explanation: "DNA encodes the amino acid sequence (primary structure). Secondary, tertiary, and quaternary structures arise from folding driven by R-group interactions and environmental factors — they are consequences of the primary sequence.",
                difficulty: .hard,
                category: .analysis
            ),
            // Q16 - Hard / Analysis
            QuizQuestion(
                id: "q2-16",
                question: "Comparing ionic and covalent bonds: ionic bonds form electrolytes when dissolved in water, while covalent compounds generally do not. Why?",
                choices: [
                    "Covalent bonds are weaker and break in water",
                    "Ionic compounds dissociate into individual ions in water; covalent compounds remain as intact molecules",
                    "Covalent compounds do not dissolve in water at all",
                    "Ionic bonds involve sharing of electrons"
                ],
                correctIndex: 1,
                explanation: "Ionic compounds dissociate into free ions (Na+, Cl-) in water, which conduct electricity (electrolytes). Covalent compounds dissolve as intact molecules without producing free ions.",
                difficulty: .hard,
                category: .analysis
            ),
            // Q17 - Hard / Analysis
            QuizQuestion(
                id: "q2-17",
                question: "An enzyme is placed in a solution at pH 12. It loses its ability to catalyze reactions. The most likely explanation is:",
                choices: [
                    "The substrate concentration is too low",
                    "The enzyme has been denatured — extreme pH altered its 3D shape",
                    "The enzyme needs more ATP to function",
                    "The products are inhibiting the reaction"
                ],
                correctIndex: 1,
                explanation: "Extreme pH (either very acidic or very basic) denatures enzymes by disrupting the bonds that maintain tertiary structure. A denatured enzyme cannot bind its substrate properly.",
                difficulty: .hard,
                category: .analysis
            ),
            // Q18 - Hard / Analysis
            QuizQuestion(
                id: "q2-18",
                question: "Saturated fatty acids have no double bonds between carbons, while unsaturated fatty acids have one or more. How does this affect their physical properties?",
                choices: [
                    "Saturated fats are liquid at room temperature; unsaturated fats are solid",
                    "Both types are always liquid at room temperature",
                    "Saturated fats are solid at room temperature (pack tightly); unsaturated fats are liquid (kinks prevent tight packing)",
                    "There is no difference in physical properties"
                ],
                correctIndex: 2,
                explanation: "Saturated fats have straight chains that pack tightly, making them solid at room temperature (e.g., butter). Unsaturated fats have kinks from double bonds that prevent tight packing, making them liquid (e.g., olive oil).",
                difficulty: .hard,
                category: .analysis
            ),
            // Q19 - Clinical
            QuizQuestion(
                id: "q2-19",
                question: "A diabetic patient arrives via ambulance with rapid, deep breathing (Kussmaul breathing) and a blood pH of 7.18. This patient is in:",
                choices: [
                    "Respiratory alkalosis",
                    "Metabolic alkalosis",
                    "Respiratory acidosis",
                    "Metabolic acidosis"
                ],
                correctIndex: 3,
                explanation: "pH 7.18 is below normal (acidosis). In diabetic ketoacidosis (DKA), the body produces excess ketone acids. Kussmaul breathing is the respiratory compensation — blowing off CO2 to try to raise pH. This is metabolic acidosis because the primary cause is metabolic (excess acid production), not respiratory.",
                difficulty: .hard,
                category: .clinical
            ),
            // Q20 - Clinical
            QuizQuestion(
                id: "q2-20",
                question: "An EMT is monitoring a patient whose EKG shows tall, peaked T-waves. Blood work shows K+ of 7.0 mEq/L. Which electrolyte imbalance is causing the EKG changes?",
                choices: [
                    "Hyponatremia (low Na+)",
                    "Hypocalcemia (low Ca2+)",
                    "Hyperkalemia (high K+)",
                    "Hypoglycemia (low glucose)"
                ],
                correctIndex: 2,
                explanation: "K+ of 7.0 mEq/L is hyperkalemia (normal: 3.5-5.0). Elevated potassium alters the electrical activity of cardiac cells, producing peaked T-waves on EKG and potentially dangerous arrhythmias.",
                difficulty: .medium,
                category: .clinical
            )
        ],
        timeLimit: nil
    )

    // =========================================================================
    // MARK: - FLASHCARD DECK 1: Anatomical Directional Terms
    // =========================================================================

    static let deckDirectionalTerms = FlashcardDeck(
        id: "deck-directional",
        title: "Anatomical Directional Terms",
        weekNumber: 1,
        category: "Anatomical Terms",
        cards: [
            Flashcard(id: "fc-d01", front: "Superior (Cranial)", back: "Toward the head or upper part of the body. Example: The heart is superior to the diaphragm.", hint: "Think: 'crown' of the head", repetition: defaultSR),
            Flashcard(id: "fc-d02", front: "Inferior (Caudal)", back: "Toward the feet or lower part of the body. Example: The stomach is inferior to the lungs.", hint: "Think: 'tail' end", repetition: defaultSR),
            Flashcard(id: "fc-d03", front: "Anterior (Ventral)", back: "Toward the front of the body. Example: The sternum is anterior to the heart.", hint: "Think: 'vent' on the belly side", repetition: defaultSR),
            Flashcard(id: "fc-d04", front: "Posterior (Dorsal)", back: "Toward the back of the body. Example: The vertebral column is posterior to the trachea.", hint: "Think: dorsal fin on a shark's back", repetition: defaultSR),
            Flashcard(id: "fc-d05", front: "Medial", back: "Toward the midline of the body. Example: The ulna is medial to the radius.", hint: "Think: 'median' = middle", repetition: defaultSR),
            Flashcard(id: "fc-d06", front: "Lateral", back: "Away from the midline of the body. Example: The ears are lateral to the nose.", hint: "Think: 'lateral pass' = to the side", repetition: defaultSR),
            Flashcard(id: "fc-d07", front: "Proximal", back: "Closer to the point of attachment or trunk. Used for limbs. Example: The elbow is proximal to the wrist.", hint: "Think: 'proximity' = near the trunk", repetition: defaultSR),
            Flashcard(id: "fc-d08", front: "Distal", back: "Farther from the point of attachment or trunk. Used for limbs. Example: The fingers are distal to the wrist.", hint: "Think: 'distant' from the trunk", repetition: defaultSR),
            Flashcard(id: "fc-d09", front: "Superficial (External)", back: "Closer to the body surface. Example: The skin is superficial to the muscles.", hint: nil, repetition: defaultSR),
            Flashcard(id: "fc-d10", front: "Deep (Internal)", back: "Farther from the body surface. Example: The bones are deep to the muscles.", hint: nil, repetition: defaultSR),
            Flashcard(id: "fc-d11", front: "Ipsilateral", back: "On the same side of the body. Example: The right arm and right leg are ipsilateral.", hint: "Think: 'ipsi' = same", repetition: defaultSR),
            Flashcard(id: "fc-d12", front: "Contralateral", back: "On opposite sides of the body. Example: The right arm and left leg are contralateral.", hint: "Think: 'contra' = opposite", repetition: defaultSR),
            Flashcard(id: "fc-d13", front: "Supine", back: "Lying face up (on the back). Mnemonic: 'Supine = spine on the table.'", hint: "Face up toward the 'sun'", repetition: defaultSR),
            Flashcard(id: "fc-d14", front: "Prone", back: "Lying face down (on the stomach).", hint: "Think: 'prone to fall on your face'", repetition: defaultSR),
            Flashcard(id: "fc-d15", front: "Anatomical Position", back: "Standard reference: body upright, facing observer, feet slightly apart, arms at sides, palms facing forward (anteriorly).", hint: "Palms forward, thumbs lateral", repetition: defaultSR)
        ]
    )

    // =========================================================================
    // MARK: - FLASHCARD DECK 2: Body Planes & Cavities
    // =========================================================================

    static let deckPlanesAndCavities = FlashcardDeck(
        id: "deck-planes-cavities",
        title: "Body Planes & Cavities",
        weekNumber: 1,
        category: "Anatomical Terms",
        cards: [
            Flashcard(id: "fc-p01", front: "Sagittal Plane", back: "A vertical plane that divides the body into left and right portions.", hint: "Think: 'SAGittal' = splits left/right like an arrow (sagitta = arrow)", repetition: defaultSR),
            Flashcard(id: "fc-p02", front: "Midsagittal (Median) Plane", back: "A sagittal plane that passes exactly through the midline, creating equal left and right halves.", hint: nil, repetition: defaultSR),
            Flashcard(id: "fc-p03", front: "Frontal (Coronal) Plane", back: "A vertical plane that divides the body into anterior (front) and posterior (back) portions.", hint: "Think: the 'front' door divides the house", repetition: defaultSR),
            Flashcard(id: "fc-p04", front: "Transverse (Horizontal) Plane", back: "A horizontal plane that divides the body into superior (upper) and inferior (lower) portions. Also called a cross-sectional plane.", hint: "Think: cutting across like slicing a loaf of bread", repetition: defaultSR),
            Flashcard(id: "fc-p05", front: "Dorsal Cavity", back: "Posterior body cavity containing the cranial cavity (brain) and the vertebral/spinal cavity (spinal cord).", hint: nil, repetition: defaultSR),
            Flashcard(id: "fc-p06", front: "Thoracic Cavity", back: "Superior portion of the ventral cavity; separated from the abdominopelvic cavity by the diaphragm. Contains the lungs, heart, and mediastinum.", hint: nil, repetition: defaultSR),
            Flashcard(id: "fc-p07", front: "Mediastinum", back: "Central compartment of the thoracic cavity; contains the heart, great vessels, trachea, and esophagus. Flanked by the pleural cavities.", hint: "The heart is here, NOT in the pleural cavities", repetition: defaultSR),
            Flashcard(id: "fc-p08", front: "Abdominopelvic Cavity", back: "Inferior portion of the ventral cavity, below the diaphragm. Includes the abdominal cavity and the pelvic cavity.", hint: nil, repetition: defaultSR),
            Flashcard(id: "fc-p09", front: "Three Serous Membranes", back: "Pleura (lines pleural cavities / covers lungs), Pericardium (surrounds the heart), Peritoneum (lines abdominal cavity / covers abdominal organs). All produce serous fluid to reduce friction.", hint: "P-P-P: Pleura, Pericardium, Peritoneum", repetition: defaultSR),
            Flashcard(id: "fc-p10", front: "Diaphragm", back: "A dome-shaped skeletal muscle that separates the thoracic cavity (above) from the abdominopelvic cavity (below). Primary muscle of respiration.", hint: nil, repetition: defaultSR)
        ]
    )

    // =========================================================================
    // MARK: - FLASHCARD DECK 3: Chemistry Fundamentals
    // =========================================================================

    static let deckChemistryFundamentals = FlashcardDeck(
        id: "deck-chemistry",
        title: "Chemistry Fundamentals",
        weekNumber: 2,
        category: "Chemistry",
        cards: [
            Flashcard(id: "fc-c01", front: "Atom", back: "The smallest unit of matter that retains the properties of an element. Composed of protons (+ charge, in nucleus), neutrons (no charge, in nucleus), and electrons (- charge, orbiting).", hint: nil, repetition: defaultSR),
            Flashcard(id: "fc-c02", front: "Atomic Number vs Mass Number", back: "Atomic number = number of protons (defines the element). Mass number = protons + neutrons.", hint: "Atomic NUMBER = proton NUMBER", repetition: defaultSR),
            Flashcard(id: "fc-c03", front: "Isotope", back: "Atoms of the same element with different numbers of neutrons. Same atomic number, different mass number. Some are radioactive.", hint: "Same element, different 'weight'", repetition: defaultSR),
            Flashcard(id: "fc-c04", front: "Valence Shell", back: "The outermost electron shell. The number of valence electrons determines bonding behavior. Atoms are stable when the valence shell is full (octet rule).", hint: nil, repetition: defaultSR),
            Flashcard(id: "fc-c05", front: "Ion", back: "An atom with a net electrical charge due to gaining or losing electrons.", hint: nil, repetition: defaultSR),
            Flashcard(id: "fc-c06", front: "Cation vs Anion", back: "Cation = positive ion (lost electrons). Anion = negative ion (gained electrons). Mnemonic: cation has a 't' like a '+' sign.", hint: "CAT-ion is PAW-sitive", repetition: defaultSR),
            Flashcard(id: "fc-c07", front: "Electrolyte", back: "A substance that dissociates into ions in water and conducts electricity. Key body electrolytes: Na+, K+, Ca2+, Cl-, HCO3-.", hint: nil, repetition: defaultSR),
            Flashcard(id: "fc-c08", front: "Ionic Bond", back: "Formed by the TRANSFER of electrons from one atom to another. Creates ions with opposite charges that attract. Example: NaCl.", hint: "Transfer = ionic", repetition: defaultSR),
            Flashcard(id: "fc-c09", front: "Covalent Bond", back: "Formed by the SHARING of electron pairs. Strongest bond in the body. Can be polar (unequal sharing) or nonpolar (equal sharing).", hint: "Sharing = covalent", repetition: defaultSR),
            Flashcard(id: "fc-c10", front: "Polar Covalent Bond", back: "A covalent bond with unequal electron sharing due to differences in electronegativity. Creates partial charges. Example: water (H2O).", hint: "Water is the classic example", repetition: defaultSR),
            Flashcard(id: "fc-c11", front: "Hydrogen Bond", back: "A weak attraction between a slightly positive H atom and a nearby electronegative atom (O or N). Individually weak, collectively powerful. Important in water, proteins, and DNA.", hint: nil, repetition: defaultSR),
            Flashcard(id: "fc-c12", front: "Enzyme", back: "A biological catalyst (usually a protein) that lowers activation energy to speed up chemical reactions. Highly specific; substrate binds at the active site.", hint: "Enzyme names end in '-ase'", repetition: defaultSR),
            Flashcard(id: "fc-c13", front: "Activation Energy", back: "The minimum energy required to start a chemical reaction. Enzymes lower this energy barrier.", hint: nil, repetition: defaultSR),
            Flashcard(id: "fc-c14", front: "Denaturation", back: "Loss of a protein's 3D shape (and therefore function) due to extreme temperature, pH, or other conditions. The protein unfolds.", hint: "Think: a fried egg white — the protein changed shape irreversibly", repetition: defaultSR),
            Flashcard(id: "fc-c15", front: "Synthesis vs Decomposition Reactions", back: "Synthesis (anabolic): A + B -> AB (builds). Decomposition (catabolic): AB -> A + B (breaks down).", hint: nil, repetition: defaultSR)
        ]
    )

    // =========================================================================
    // MARK: - FLASHCARD DECK 4: Macromolecules & pH
    // =========================================================================

    static let deckMacromoleculesPH = FlashcardDeck(
        id: "deck-macromolecules",
        title: "Macromolecules & pH",
        weekNumber: 2,
        category: "Chemistry",
        cards: [
            Flashcard(id: "fc-m01", front: "Acid", back: "A substance that releases H+ ions in solution, lowering pH. More H+ = more acidic = lower pH number.", hint: nil, repetition: defaultSR),
            Flashcard(id: "fc-m02", front: "Base (Alkali)", back: "A substance that releases OH- or accepts H+ in solution, raising pH. Fewer H+ = more basic = higher pH number.", hint: nil, repetition: defaultSR),
            Flashcard(id: "fc-m03", front: "pH Scale", back: "0-14 scale measuring H+ concentration. 7 = neutral. < 7 = acidic. > 7 = basic/alkaline. Logarithmic: each unit = 10x change in H+.", hint: "Blood pH: 7.35-7.45", repetition: defaultSR),
            Flashcard(id: "fc-m04", front: "Buffer", back: "A chemical system that resists pH changes by neutralizing excess H+ or OH-. The bicarbonate buffer system (H2CO3/HCO3-) is the primary blood buffer.", hint: nil, repetition: defaultSR),
            Flashcard(id: "fc-m05", front: "Dehydration Synthesis vs Hydrolysis", back: "Dehydration synthesis: removes H2O to join monomers into a polymer (builds). Hydrolysis: adds H2O to break a polymer into monomers (breaks).", hint: "'Hydro' = water, 'lysis' = break", repetition: defaultSR),
            Flashcard(id: "fc-m06", front: "Carbohydrates", back: "Composed of C, H, O (1:2:1 ratio). Monomers: monosaccharides (glucose). Functions: quick energy, energy storage (glycogen). Polymer examples: starch, glycogen, cellulose.", hint: nil, repetition: defaultSR),
            Flashcard(id: "fc-m07", front: "Monosaccharide, Disaccharide, Polysaccharide", back: "Mono = 1 sugar (glucose, fructose, galactose). Di = 2 sugars (sucrose, lactose, maltose). Poly = many sugars (glycogen, starch).", hint: nil, repetition: defaultSR),
            Flashcard(id: "fc-m08", front: "Lipids (Fats)", back: "Hydrophobic organic molecules. Types: triglycerides (energy storage), phospholipids (cell membranes), steroids (cholesterol, hormones). NOT true polymers.", hint: nil, repetition: defaultSR),
            Flashcard(id: "fc-m09", front: "Triglyceride", back: "Glycerol + 3 fatty acids. Main form of stored energy (body fat). Saturated = no double bonds (solid). Unsaturated = double bonds present (liquid).", hint: "Tri = 3 fatty acids", repetition: defaultSR),
            Flashcard(id: "fc-m10", front: "Phospholipid", back: "Hydrophilic phosphate head + 2 hydrophobic fatty acid tails. Amphipathic. Forms the cell membrane bilayer.", hint: "Heads face water, tails hide from water", repetition: defaultSR),
            Flashcard(id: "fc-m11", front: "Proteins", back: "Polymers of amino acids linked by peptide bonds. 20 amino acids; R-group makes each unique. Functions: enzymes, structure, transport, immunity, hormones.", hint: nil, repetition: defaultSR),
            Flashcard(id: "fc-m12", front: "Four Levels of Protein Structure", back: "Primary: amino acid sequence. Secondary: alpha-helices, beta-sheets (H-bonds). Tertiary: 3D folding (R-group interactions). Quaternary: multiple polypeptide subunits.", hint: "1-2-3-4 = sequence-shapes-fold-subunits", repetition: defaultSR),
            Flashcard(id: "fc-m13", front: "DNA vs RNA", back: "DNA: double-stranded, deoxyribose sugar, bases A-T-C-G, stores genetic info. RNA: single-stranded, ribose sugar, bases A-U-C-G, helps make proteins.", hint: "RNA has Uracil instead of Thymine", repetition: defaultSR),
            Flashcard(id: "fc-m14", front: "ATP (Adenosine Triphosphate)", back: "The cell's energy currency. Adenine + ribose + 3 phosphate groups. ATP -> ADP + Pi + energy (hydrolysis). Regenerated in mitochondria via cellular respiration.", hint: nil, repetition: defaultSR),
            Flashcard(id: "fc-m15", front: "Acidosis vs Alkalosis", back: "Acidosis: blood pH < 7.35 (too acidic). Alkalosis: blood pH > 7.45 (too basic). Both are dangerous. DKA causes metabolic acidosis; hyperventilation causes respiratory alkalosis.", hint: "Normal blood pH: 7.35-7.45", repetition: defaultSR)
        ]
    )
}
