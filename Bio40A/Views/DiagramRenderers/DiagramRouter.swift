import SwiftUI

/// Routes an ImageQuestion to the correct diagram renderer view.
struct DiagramRouter: View {
    let diagramType: ImageQuestion.DiagramType
    let highlightLabel: String?

    var body: some View {
        switch diagramType {
        case .bodyPlanes, .bodyCavities:
            QuizBodyDiagram(highlightLabel: highlightLabel)
        case .cellStructure:
            QuizCellDiagram(highlightLabel: highlightLabel)
        case .skinLayers:
            QuizSkinDiagram(highlightLabel: highlightLabel)
        case .boneStructure:
            QuizBoneDiagram(highlightLabel: highlightLabel)
        case .sarcomere:
            QuizSarcomereDiagram(highlightLabel: highlightLabel)
        case .feedbackLoop:
            QuizFeedbackLoopDiagram(highlightLabel: highlightLabel)
        case .jointTypes:
            QuizBodyDiagram(highlightLabel: highlightLabel)
        }
    }
}
