import Foundation

struct ImageQuestion: Identifiable, Codable {
    let id: String
    let diagramType: DiagramType
    let highlightLabel: String?     // which part to highlight/label
    let question: String
    let choices: [String]
    let correctIndex: Int
    let explanation: String

    enum DiagramType: String, Codable, CaseIterable {
        case bodyPlanes
        case bodyCavities
        case cellStructure
        case skinLayers
        case boneStructure
        case sarcomere
        case feedbackLoop
        case jointTypes

        var displayName: String {
            switch self {
            case .bodyPlanes: return "Body Planes & Regions"
            case .bodyCavities: return "Body Cavities"
            case .cellStructure: return "Cell Structure"
            case .skinLayers: return "Skin Layers"
            case .boneStructure: return "Bone Structure"
            case .sarcomere: return "Sarcomere"
            case .feedbackLoop: return "Feedback Loops"
            case .jointTypes: return "Joint Types"
            }
        }

        var iconName: String {
            switch self {
            case .bodyPlanes: return "figure.stand"
            case .bodyCavities: return "figure.stand"
            case .cellStructure: return "circle.hexagongrid"
            case .skinLayers: return "rectangle.3.group"
            case .boneStructure: return "figure.walk"
            case .sarcomere: return "arrow.left.and.right"
            case .feedbackLoop: return "arrow.triangle.2.circlepath"
            case .jointTypes: return "arrow.uturn.left"
            }
        }

        var accentColor: String {
            switch self {
            case .bodyPlanes, .bodyCavities: return "blue"
            case .cellStructure: return "green"
            case .skinLayers: return "orange"
            case .boneStructure: return "purple"
            case .sarcomere: return "red"
            case .feedbackLoop: return "teal"
            case .jointTypes: return "indigo"
            }
        }
    }
}

struct ImageQuizSet: Identifiable {
    let id: String
    let title: String
    let diagramType: ImageQuestion.DiagramType
    let questions: [ImageQuestion]

    var questionCount: Int { questions.count }
}
