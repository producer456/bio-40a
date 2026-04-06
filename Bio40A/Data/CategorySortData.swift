import Foundation

struct CategorySortData {
    static let allSets: [CategorySortSet] = [
        axialVsAppendicular,
        tissueTypes,
        macromoleculeSort,
        jointTypes,
        muscleLocation,
        transportTypes,
        boneCellTypes,
        skinLayers,
        bodyRegions,
    ]

    // MARK: - Axial vs Appendicular Skeleton (Weeks 7-8)

    static let axialVsAppendicular = CategorySortSet(
        id: "cs_axial_app",
        title: "Axial vs Appendicular Skeleton",
        categories: ["Axial", "Appendicular"],
        items: [
            SortItem(id: "cs_aa_1", name: "Skull", correctCategory: "Axial"),
            SortItem(id: "cs_aa_2", name: "Femur", correctCategory: "Appendicular"),
            SortItem(id: "cs_aa_3", name: "Sternum", correctCategory: "Axial"),
            SortItem(id: "cs_aa_4", name: "Humerus", correctCategory: "Appendicular"),
            SortItem(id: "cs_aa_5", name: "Vertebral Column", correctCategory: "Axial"),
            SortItem(id: "cs_aa_6", name: "Scapula", correctCategory: "Appendicular"),
            SortItem(id: "cs_aa_7", name: "Ribs", correctCategory: "Axial"),
            SortItem(id: "cs_aa_8", name: "Tibia", correctCategory: "Appendicular"),
            SortItem(id: "cs_aa_9", name: "Hyoid Bone", correctCategory: "Axial"),
            SortItem(id: "cs_aa_10", name: "Clavicle", correctCategory: "Appendicular"),
            SortItem(id: "cs_aa_11", name: "Sacrum", correctCategory: "Axial"),
            SortItem(id: "cs_aa_12", name: "Radius", correctCategory: "Appendicular"),
            SortItem(id: "cs_aa_13", name: "Pelvis (Hip Bone)", correctCategory: "Appendicular"),
            SortItem(id: "cs_aa_14", name: "Fibula", correctCategory: "Appendicular"),
        ],
        weekNumber: 7
    )

    // MARK: - Tissue Types (Week 4)

    static let tissueTypes = CategorySortSet(
        id: "cs_tissues",
        title: "Tissue Types",
        categories: ["Epithelial", "Connective", "Muscle", "Nervous"],
        items: [
            SortItem(id: "cs_tt_1", name: "Simple Squamous", correctCategory: "Epithelial"),
            SortItem(id: "cs_tt_2", name: "Bone (Osseous)", correctCategory: "Connective"),
            SortItem(id: "cs_tt_3", name: "Skeletal", correctCategory: "Muscle"),
            SortItem(id: "cs_tt_4", name: "Neurons", correctCategory: "Nervous"),
            SortItem(id: "cs_tt_5", name: "Stratified Squamous", correctCategory: "Epithelial"),
            SortItem(id: "cs_tt_6", name: "Blood", correctCategory: "Connective"),
            SortItem(id: "cs_tt_7", name: "Cardiac", correctCategory: "Muscle"),
            SortItem(id: "cs_tt_8", name: "Neuroglia", correctCategory: "Nervous"),
            SortItem(id: "cs_tt_9", name: "Simple Columnar", correctCategory: "Epithelial"),
            SortItem(id: "cs_tt_10", name: "Cartilage", correctCategory: "Connective"),
            SortItem(id: "cs_tt_11", name: "Smooth", correctCategory: "Muscle"),
            SortItem(id: "cs_tt_12", name: "Adipose", correctCategory: "Connective"),
            SortItem(id: "cs_tt_13", name: "Pseudostratified Columnar", correctCategory: "Epithelial"),
            SortItem(id: "cs_tt_14", name: "Dense Regular CT", correctCategory: "Connective"),
        ],
        weekNumber: 4
    )

    // MARK: - Macromolecules (Week 2)

    static let macromoleculeSort = CategorySortSet(
        id: "cs_macromolecules",
        title: "Macromolecule Classification",
        categories: ["Carbohydrate", "Lipid", "Protein", "Nucleic Acid"],
        items: [
            SortItem(id: "cs_mm_1", name: "Glucose", correctCategory: "Carbohydrate"),
            SortItem(id: "cs_mm_2", name: "Cholesterol", correctCategory: "Lipid"),
            SortItem(id: "cs_mm_3", name: "Hemoglobin", correctCategory: "Protein"),
            SortItem(id: "cs_mm_4", name: "DNA", correctCategory: "Nucleic Acid"),
            SortItem(id: "cs_mm_5", name: "Glycogen", correctCategory: "Carbohydrate"),
            SortItem(id: "cs_mm_6", name: "Triglyceride", correctCategory: "Lipid"),
            SortItem(id: "cs_mm_7", name: "Collagen", correctCategory: "Protein"),
            SortItem(id: "cs_mm_8", name: "RNA", correctCategory: "Nucleic Acid"),
            SortItem(id: "cs_mm_9", name: "Starch", correctCategory: "Carbohydrate"),
            SortItem(id: "cs_mm_10", name: "Phospholipid", correctCategory: "Lipid"),
            SortItem(id: "cs_mm_11", name: "Keratin", correctCategory: "Protein"),
            SortItem(id: "cs_mm_12", name: "ATP", correctCategory: "Nucleic Acid"),
            SortItem(id: "cs_mm_13", name: "Cellulose", correctCategory: "Carbohydrate"),
            SortItem(id: "cs_mm_14", name: "Insulin", correctCategory: "Protein"),
        ],
        weekNumber: 2
    )

    // MARK: - Joint Types (Week 9)

    static let jointTypes = CategorySortSet(
        id: "cs_joints",
        title: "Joint Classification",
        categories: ["Fibrous", "Cartilaginous", "Synovial"],
        items: [
            SortItem(id: "cs_jt_1", name: "Sutures (Skull)", correctCategory: "Fibrous"),
            SortItem(id: "cs_jt_2", name: "Intervertebral Discs", correctCategory: "Cartilaginous"),
            SortItem(id: "cs_jt_3", name: "Knee Joint", correctCategory: "Synovial"),
            SortItem(id: "cs_jt_4", name: "Gomphoses (Teeth)", correctCategory: "Fibrous"),
            SortItem(id: "cs_jt_5", name: "Pubic Symphysis", correctCategory: "Cartilaginous"),
            SortItem(id: "cs_jt_6", name: "Shoulder Joint", correctCategory: "Synovial"),
            SortItem(id: "cs_jt_7", name: "Syndesmosis (Tibiofibular)", correctCategory: "Fibrous"),
            SortItem(id: "cs_jt_8", name: "Epiphyseal Plate", correctCategory: "Cartilaginous"),
            SortItem(id: "cs_jt_9", name: "Hip Joint", correctCategory: "Synovial"),
            SortItem(id: "cs_jt_10", name: "Elbow Joint", correctCategory: "Synovial"),
            SortItem(id: "cs_jt_11", name: "First Sternocostal Joint", correctCategory: "Cartilaginous"),
            SortItem(id: "cs_jt_12", name: "Thumb (CMC) Joint", correctCategory: "Synovial"),
        ],
        weekNumber: 9
    )

    // MARK: - Anterior vs Posterior Muscles (Week 10)

    static let muscleLocation = CategorySortSet(
        id: "cs_muscles",
        title: "Anterior vs Posterior Muscles",
        categories: ["Anterior", "Posterior"],
        items: [
            SortItem(id: "cs_ml_1", name: "Biceps Brachii", correctCategory: "Anterior"),
            SortItem(id: "cs_ml_2", name: "Triceps Brachii", correctCategory: "Posterior"),
            SortItem(id: "cs_ml_3", name: "Quadriceps Femoris", correctCategory: "Anterior"),
            SortItem(id: "cs_ml_4", name: "Hamstrings", correctCategory: "Posterior"),
            SortItem(id: "cs_ml_5", name: "Pectoralis Major", correctCategory: "Anterior"),
            SortItem(id: "cs_ml_6", name: "Trapezius", correctCategory: "Posterior"),
            SortItem(id: "cs_ml_7", name: "Rectus Abdominis", correctCategory: "Anterior"),
            SortItem(id: "cs_ml_8", name: "Latissimus Dorsi", correctCategory: "Posterior"),
            SortItem(id: "cs_ml_9", name: "Tibialis Anterior", correctCategory: "Anterior"),
            SortItem(id: "cs_ml_10", name: "Gastrocnemius", correctCategory: "Posterior"),
            SortItem(id: "cs_ml_11", name: "Deltoid (Anterior Fibers)", correctCategory: "Anterior"),
            SortItem(id: "cs_ml_12", name: "Erector Spinae", correctCategory: "Posterior"),
        ],
        weekNumber: 10
    )

    // MARK: - Transport Types (Week 11)

    static let transportTypes = CategorySortSet(
        id: "cs_transport",
        title: "Passive vs Active Transport",
        categories: ["Passive", "Active"],
        items: [
            SortItem(id: "cs_tr_1", name: "Simple Diffusion", correctCategory: "Passive"),
            SortItem(id: "cs_tr_2", name: "Sodium-Potassium Pump", correctCategory: "Active"),
            SortItem(id: "cs_tr_3", name: "Osmosis", correctCategory: "Passive"),
            SortItem(id: "cs_tr_4", name: "Endocytosis", correctCategory: "Active"),
            SortItem(id: "cs_tr_5", name: "Facilitated Diffusion", correctCategory: "Passive"),
            SortItem(id: "cs_tr_6", name: "Exocytosis", correctCategory: "Active"),
            SortItem(id: "cs_tr_7", name: "Filtration", correctCategory: "Passive"),
            SortItem(id: "cs_tr_8", name: "Phagocytosis", correctCategory: "Active"),
            SortItem(id: "cs_tr_9", name: "Channel-Mediated Diffusion", correctCategory: "Passive"),
            SortItem(id: "cs_tr_10", name: "Pinocytosis", correctCategory: "Active"),
        ],
        weekNumber: 11
    )

    // MARK: - Bone Cell Types (Week 6)

    static let boneCellTypes = CategorySortSet(
        id: "cs_bonecells",
        title: "Bone Cell Functions",
        categories: ["Osteoblasts", "Osteoclasts", "Osteocytes"],
        items: [
            SortItem(id: "cs_bc_1", name: "Build new bone matrix", correctCategory: "Osteoblasts"),
            SortItem(id: "cs_bc_2", name: "Break down bone tissue", correctCategory: "Osteoclasts"),
            SortItem(id: "cs_bc_3", name: "Maintain bone tissue", correctCategory: "Osteocytes"),
            SortItem(id: "cs_bc_4", name: "Secrete osteoid", correctCategory: "Osteoblasts"),
            SortItem(id: "cs_bc_5", name: "Release acid & enzymes", correctCategory: "Osteoclasts"),
            SortItem(id: "cs_bc_6", name: "Trapped in lacunae", correctCategory: "Osteocytes"),
            SortItem(id: "cs_bc_7", name: "Derived from monocytes", correctCategory: "Osteoclasts"),
            SortItem(id: "cs_bc_8", name: "Sense mechanical stress", correctCategory: "Osteocytes"),
            SortItem(id: "cs_bc_9", name: "Become osteocytes when trapped", correctCategory: "Osteoblasts"),
        ],
        weekNumber: 6
    )

    // MARK: - Skin Layers (Week 5)

    static let skinLayers = CategorySortSet(
        id: "cs_skin",
        title: "Epidermis vs Dermis Structures",
        categories: ["Epidermis", "Dermis"],
        items: [
            SortItem(id: "cs_sk_1", name: "Keratinocytes", correctCategory: "Epidermis"),
            SortItem(id: "cs_sk_2", name: "Blood Vessels", correctCategory: "Dermis"),
            SortItem(id: "cs_sk_3", name: "Melanocytes", correctCategory: "Epidermis"),
            SortItem(id: "cs_sk_4", name: "Hair Follicles", correctCategory: "Dermis"),
            SortItem(id: "cs_sk_5", name: "Stratum Basale", correctCategory: "Epidermis"),
            SortItem(id: "cs_sk_6", name: "Sweat Glands", correctCategory: "Dermis"),
            SortItem(id: "cs_sk_7", name: "Stratum Corneum", correctCategory: "Epidermis"),
            SortItem(id: "cs_sk_8", name: "Collagen Fibers", correctCategory: "Dermis"),
            SortItem(id: "cs_sk_9", name: "Langerhans Cells", correctCategory: "Epidermis"),
            SortItem(id: "cs_sk_10", name: "Nerve Endings", correctCategory: "Dermis"),
        ],
        weekNumber: 5
    )

    // MARK: - Body Regions (Week 1)

    static let bodyRegions = CategorySortSet(
        id: "cs_regions",
        title: "Body Cavity Contents",
        categories: ["Thoracic Cavity", "Abdominal Cavity", "Pelvic Cavity"],
        items: [
            SortItem(id: "cs_br_1", name: "Heart", correctCategory: "Thoracic Cavity"),
            SortItem(id: "cs_br_2", name: "Stomach", correctCategory: "Abdominal Cavity"),
            SortItem(id: "cs_br_3", name: "Urinary Bladder", correctCategory: "Pelvic Cavity"),
            SortItem(id: "cs_br_4", name: "Lungs", correctCategory: "Thoracic Cavity"),
            SortItem(id: "cs_br_5", name: "Liver", correctCategory: "Abdominal Cavity"),
            SortItem(id: "cs_br_6", name: "Rectum", correctCategory: "Pelvic Cavity"),
            SortItem(id: "cs_br_7", name: "Trachea", correctCategory: "Thoracic Cavity"),
            SortItem(id: "cs_br_8", name: "Small Intestine", correctCategory: "Abdominal Cavity"),
            SortItem(id: "cs_br_9", name: "Reproductive Organs", correctCategory: "Pelvic Cavity"),
            SortItem(id: "cs_br_10", name: "Spleen", correctCategory: "Abdominal Cavity"),
            SortItem(id: "cs_br_11", name: "Esophagus", correctCategory: "Thoracic Cavity"),
            SortItem(id: "cs_br_12", name: "Kidneys", correctCategory: "Abdominal Cavity"),
        ],
        weekNumber: 1
    )
}
