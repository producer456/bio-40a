import Foundation

struct MatchingData {
    static let allSets: [MatchingSet] = [
        directionalTerms,
        bodyPlanesCavities,
        chemicalBonds,
        macromolecules
    ]

    // MARK: - Directional Terms (Chapter 1)

    static let directionalTerms = MatchingSet(
        id: "directional_terms",
        title: "Directional Terms",
        category: "Anatomical Terminology",
        weekNumber: 1,
        pairs: [
            MatchPair(id: "dt_1", term: "Anterior (Ventral)",
                      definition: "Toward the front of the body"),
            MatchPair(id: "dt_2", term: "Posterior (Dorsal)",
                      definition: "Toward the back of the body"),
            MatchPair(id: "dt_3", term: "Superior (Cranial)",
                      definition: "Toward the head or upper part"),
            MatchPair(id: "dt_4", term: "Inferior (Caudal)",
                      definition: "Away from the head; toward the lower part"),
            MatchPair(id: "dt_5", term: "Medial",
                      definition: "Toward the midline of the body"),
            MatchPair(id: "dt_6", term: "Lateral",
                      definition: "Away from the midline of the body"),
            MatchPair(id: "dt_7", term: "Proximal",
                      definition: "Closer to the point of attachment to the trunk"),
            MatchPair(id: "dt_8", term: "Distal",
                      definition: "Farther from the point of attachment to the trunk")
        ]
    )

    // MARK: - Body Planes & Cavities (Chapter 1)

    static let bodyPlanesCavities = MatchingSet(
        id: "body_planes_cavities",
        title: "Body Planes & Cavities",
        category: "Anatomical Terminology",
        weekNumber: 1,
        pairs: [
            MatchPair(id: "bp_1", term: "Sagittal Plane",
                      definition: "Divides the body into left and right portions"),
            MatchPair(id: "bp_2", term: "Frontal (Coronal) Plane",
                      definition: "Divides the body into anterior and posterior portions"),
            MatchPair(id: "bp_3", term: "Transverse Plane",
                      definition: "Divides the body into superior and inferior portions"),
            MatchPair(id: "bp_4", term: "Cranial Cavity",
                      definition: "Houses the brain within the skull"),
            MatchPair(id: "bp_5", term: "Thoracic Cavity",
                      definition: "Contains the heart, lungs, and major vessels"),
            MatchPair(id: "bp_6", term: "Abdominal Cavity",
                      definition: "Contains the stomach, intestines, liver, and spleen"),
            MatchPair(id: "bp_7", term: "Pelvic Cavity",
                      definition: "Contains the bladder, reproductive organs, and rectum"),
            MatchPair(id: "bp_8", term: "Spinal (Vertebral) Cavity",
                      definition: "Houses the spinal cord within the vertebral column")
        ]
    )

    // MARK: - Chemical Bonds (Chapter 2)

    static let chemicalBonds = MatchingSet(
        id: "chemical_bonds",
        title: "Chemical Bonds",
        category: "Chemistry",
        weekNumber: 2,
        pairs: [
            MatchPair(id: "cb_1", term: "Ionic Bond",
                      definition: "Transfer of electrons between atoms; forms ions"),
            MatchPair(id: "cb_2", term: "Covalent Bond",
                      definition: "Sharing of electron pairs between atoms"),
            MatchPair(id: "cb_3", term: "Hydrogen Bond",
                      definition: "Weak attraction between a polar H and an electronegative atom"),
            MatchPair(id: "cb_4", term: "Nonpolar Covalent Bond",
                      definition: "Equal sharing of electrons; no charge difference"),
            MatchPair(id: "cb_5", term: "Polar Covalent Bond",
                      definition: "Unequal sharing of electrons; slight charge difference"),
            MatchPair(id: "cb_6", term: "Van der Waals Forces",
                      definition: "Weak, short-range attractions from temporary dipoles")
        ]
    )

    // MARK: - Macromolecules (Chapter 2)

    static let macromolecules = MatchingSet(
        id: "macromolecules",
        title: "Macromolecules",
        category: "Chemistry",
        weekNumber: 2,
        pairs: [
            MatchPair(id: "mm_1", term: "Carbohydrates",
                      definition: "Provide quick energy; made of monosaccharides"),
            MatchPair(id: "mm_2", term: "Lipids",
                      definition: "Energy storage, insulation, and cell membrane structure"),
            MatchPair(id: "mm_3", term: "Proteins",
                      definition: "Made of amino acids; enzymes, structural support, transport"),
            MatchPair(id: "mm_4", term: "Nucleic Acids",
                      definition: "DNA and RNA; store and transmit genetic information"),
            MatchPair(id: "mm_5", term: "Monosaccharide",
                      definition: "Simple sugar; the monomer of carbohydrates (e.g., glucose)"),
            MatchPair(id: "mm_6", term: "Amino Acid",
                      definition: "Monomer of proteins; contains an amine and carboxyl group"),
            MatchPair(id: "mm_7", term: "Nucleotide",
                      definition: "Monomer of nucleic acids; sugar, phosphate, and base"),
            MatchPair(id: "mm_8", term: "Phospholipid",
                      definition: "Has hydrophilic head and hydrophobic tails; forms cell membranes")
        ]
    )
}
