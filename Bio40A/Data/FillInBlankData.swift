import Foundation

struct FillInBlankData {
    static let allQuestions: [FillInBlankQuestion] = [
        // MARK: - Week 1: Anatomical Terminology
        FillInBlankQuestion(
            id: "fib_1", statement: "The _____ plane divides the body into left and right portions.",
            answer: "sagittal", acceptableAnswers: ["sagittal", "sagittal plane"], weekNumber: 1),
        FillInBlankQuestion(
            id: "fib_2", statement: "The _____ plane divides the body into anterior and posterior portions.",
            answer: "frontal", acceptableAnswers: ["frontal", "coronal", "frontal plane", "coronal plane"], weekNumber: 1),
        FillInBlankQuestion(
            id: "fib_3", statement: "The _____ plane divides the body into superior and inferior portions.",
            answer: "transverse", acceptableAnswers: ["transverse", "transverse plane", "horizontal", "horizontal plane"], weekNumber: 1),
        FillInBlankQuestion(
            id: "fib_4", statement: "The _____ cavity houses the brain within the skull.",
            answer: "cranial", acceptableAnswers: ["cranial", "cranial cavity"], weekNumber: 1),
        FillInBlankQuestion(
            id: "fib_5", statement: "The term _____ means toward the midline of the body.",
            answer: "medial", acceptableAnswers: ["medial"], weekNumber: 1),
        FillInBlankQuestion(
            id: "fib_6", statement: "The term _____ means farther from the point of attachment to the trunk.",
            answer: "distal", acceptableAnswers: ["distal"], weekNumber: 1),

        // MARK: - Week 2: Chemistry
        FillInBlankQuestion(
            id: "fib_7", statement: "_____ are positively charged ions.",
            answer: "cations", acceptableAnswers: ["cations", "cation"], weekNumber: 2),
        FillInBlankQuestion(
            id: "fib_8", statement: "_____ are negatively charged ions.",
            answer: "anions", acceptableAnswers: ["anions", "anion"], weekNumber: 2),
        FillInBlankQuestion(
            id: "fib_9", statement: "A _____ bond involves the transfer of electrons between atoms.",
            answer: "ionic", acceptableAnswers: ["ionic", "ionic bond"], weekNumber: 2),
        FillInBlankQuestion(
            id: "fib_10", statement: "A _____ bond involves the sharing of electron pairs between atoms.",
            answer: "covalent", acceptableAnswers: ["covalent", "covalent bond"], weekNumber: 2),
        FillInBlankQuestion(
            id: "fib_11", statement: "A substance with a pH less than 7 is called an _____.",
            answer: "acid", acceptableAnswers: ["acid"], weekNumber: 2),
        FillInBlankQuestion(
            id: "fib_12", statement: "_____ is the storage form of glucose in animals.",
            answer: "glycogen", acceptableAnswers: ["glycogen"], weekNumber: 2),
        FillInBlankQuestion(
            id: "fib_13", statement: "The monomer of proteins is the _____ _____.",
            answer: "amino acid", acceptableAnswers: ["amino acid", "amino acids"], weekNumber: 2),

        // MARK: - Week 3: Cells
        FillInBlankQuestion(
            id: "fib_14", statement: "The _____ is the smallest independently functioning unit of a living organism.",
            answer: "cell", acceptableAnswers: ["cell", "cells"], weekNumber: 3),
        FillInBlankQuestion(
            id: "fib_15", statement: "The _____ is the control center of the cell containing DNA.",
            answer: "nucleus", acceptableAnswers: ["nucleus"], weekNumber: 3),
        FillInBlankQuestion(
            id: "fib_16", statement: "The _____ is the powerhouse of the cell, producing ATP.",
            answer: "mitochondria", acceptableAnswers: ["mitochondria", "mitochondrion"], weekNumber: 3),
        FillInBlankQuestion(
            id: "fib_17", statement: "The cell membrane is made primarily of a _____ bilayer.",
            answer: "phospholipid", acceptableAnswers: ["phospholipid", "lipid"], weekNumber: 3),

        // MARK: - Week 4: Tissues
        FillInBlankQuestion(
            id: "fib_18", statement: "_____ tissue covers body surfaces and lines hollow organs and cavities.",
            answer: "epithelial", acceptableAnswers: ["epithelial", "epithelium"], weekNumber: 4),
        FillInBlankQuestion(
            id: "fib_19", statement: "_____ tissue supports, protects, and binds together other body tissues.",
            answer: "connective", acceptableAnswers: ["connective", "connective tissue"], weekNumber: 4),
        FillInBlankQuestion(
            id: "fib_20", statement: "Cells that appear to be layered but are actually a single layer are called _____.",
            answer: "pseudostratified", acceptableAnswers: ["pseudostratified"], weekNumber: 4),

        // MARK: - Week 5: Integumentary System
        FillInBlankQuestion(
            id: "fib_21", statement: "The _____ is the outermost layer of skin.",
            answer: "epidermis", acceptableAnswers: ["epidermis"], weekNumber: 5),
        FillInBlankQuestion(
            id: "fib_22", statement: "The protein _____ waterproofs and toughens the skin.",
            answer: "keratin", acceptableAnswers: ["keratin"], weekNumber: 5),
        FillInBlankQuestion(
            id: "fib_23", statement: "_____ is the pigment that gives skin its color and protects against UV radiation.",
            answer: "melanin", acceptableAnswers: ["melanin"], weekNumber: 5),

        // MARK: - Week 6: Bone Tissue
        FillInBlankQuestion(
            id: "fib_24", statement: "The basic unit of compact bone is the _____.",
            answer: "osteon", acceptableAnswers: ["osteon", "haversian system"], weekNumber: 6),
        FillInBlankQuestion(
            id: "fib_25", statement: "_____ are bone cells that break down bone tissue.",
            answer: "osteoclasts", acceptableAnswers: ["osteoclasts", "osteoclast"], weekNumber: 6),
        FillInBlankQuestion(
            id: "fib_26", statement: "_____ are bone cells that build new bone tissue.",
            answer: "osteoblasts", acceptableAnswers: ["osteoblasts", "osteoblast"], weekNumber: 6),

        // MARK: - Week 7: Axial Skeleton
        FillInBlankQuestion(
            id: "fib_27", statement: "The _____ bone forms the forehead.",
            answer: "frontal", acceptableAnswers: ["frontal", "frontal bone"], weekNumber: 7),
        FillInBlankQuestion(
            id: "fib_28", statement: "The vertebral column normally has _____ cervical vertebrae.",
            answer: "seven", acceptableAnswers: ["seven", "7"], weekNumber: 7),
        FillInBlankQuestion(
            id: "fib_29", statement: "The first cervical vertebra is called the _____.",
            answer: "atlas", acceptableAnswers: ["atlas", "C1"], weekNumber: 7),

        // MARK: - Week 8: Appendicular Skeleton
        FillInBlankQuestion(
            id: "fib_30", statement: "The _____ is the longest bone in the human body.",
            answer: "femur", acceptableAnswers: ["femur"], weekNumber: 8),
        FillInBlankQuestion(
            id: "fib_31", statement: "The _____ connects the upper limb to the axial skeleton.",
            answer: "pectoral girdle", acceptableAnswers: ["pectoral girdle", "shoulder girdle"], weekNumber: 8),

        // MARK: - Week 9: Joints
        FillInBlankQuestion(
            id: "fib_32", statement: "_____ joints are freely movable joints.",
            answer: "synovial", acceptableAnswers: ["synovial"], weekNumber: 9),
        FillInBlankQuestion(
            id: "fib_33", statement: "The slippery fluid that lubricates synovial joints is called _____ fluid.",
            answer: "synovial", acceptableAnswers: ["synovial"], weekNumber: 9),

        // MARK: - Week 10: Muscular System
        FillInBlankQuestion(
            id: "fib_34", statement: "The _____ is the attachment point of a muscle to a movable bone.",
            answer: "insertion", acceptableAnswers: ["insertion"], weekNumber: 10),
        FillInBlankQuestion(
            id: "fib_35", statement: "The _____ is the attachment point of a muscle to a stationary bone.",
            answer: "origin", acceptableAnswers: ["origin"], weekNumber: 10),
        FillInBlankQuestion(
            id: "fib_36", statement: "The functional unit of a skeletal muscle fiber is the _____.",
            answer: "sarcomere", acceptableAnswers: ["sarcomere"], weekNumber: 10),

        // MARK: - Week 11: Membrane Transport
        FillInBlankQuestion(
            id: "fib_37", statement: "_____ is the diffusion of water across a selectively permeable membrane.",
            answer: "osmosis", acceptableAnswers: ["osmosis"], weekNumber: 11),
        FillInBlankQuestion(
            id: "fib_38", statement: "A _____ solution has a higher solute concentration than the cell.",
            answer: "hypertonic", acceptableAnswers: ["hypertonic"], weekNumber: 11),
        FillInBlankQuestion(
            id: "fib_39", statement: "_____ transport requires ATP to move substances against their concentration gradient.",
            answer: "active", acceptableAnswers: ["active", "active transport"], weekNumber: 11),
        FillInBlankQuestion(
            id: "fib_40", statement: "_____ diffusion uses transport proteins to move substances down their concentration gradient.",
            answer: "facilitated", acceptableAnswers: ["facilitated", "facilitated diffusion"], weekNumber: 11),
    ]
}
