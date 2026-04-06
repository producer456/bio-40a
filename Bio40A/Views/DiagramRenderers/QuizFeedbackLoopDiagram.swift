import SwiftUI

struct QuizFeedbackLoopDiagram: View {
    let highlightLabel: String?

    var body: some View {
        Canvas { context, size in
            let w = size.width
            let h = size.height
            let cx = w * 0.5
            let cy = h * 0.5

            // Draw feedback loop as a circular flow
            // Stimulus -> Receptor -> Control Center -> Effector -> Response
            // with an arrow looping back

            let _ = min(w, h) * 0.3 // layout reference
            let boxW: CGFloat = w * 0.22
            let boxH: CGFloat = h * 0.1

            // Component positions (around a circle)
            let stimulusPos = CGPoint(x: cx, y: h * 0.08)
            let receptorPos = CGPoint(x: w * 0.85, y: h * 0.32)
            let controlPos = CGPoint(x: w * 0.85, y: h * 0.62)
            let effectorPos = CGPoint(x: cx, y: h * 0.82)
            let responsePos = CGPoint(x: w * 0.15, y: h * 0.62)

            // Boxes
            let components: [(CGPoint, String, Color)] = [
                (stimulusPos, "Stimulus", .orange),
                (receptorPos, "Receptor", .blue),
                (controlPos, "Control\nCenter", .purple),
                (effectorPos, "Effector", .green),
                (responsePos, "Response", .teal),
            ]

            for (pos, label, color) in components {
                let rect = CGRect(x: pos.x - boxW / 2, y: pos.y - boxH / 2, width: boxW, height: boxH)
                let roundedRect = Path(roundedRect: rect, cornerRadius: 6)
                context.fill(roundedRect, with: .color(color.opacity(0.15)))
                context.stroke(roundedRect, with: .color(color.opacity(0.6)), lineWidth: 1.5)
                context.draw(
                    Text(label).font(.system(size: 8, weight: .semibold)).foregroundColor(color),
                    at: pos
                )
            }

            // Arrows connecting components
            let arrowPairs: [(CGPoint, CGPoint)] = [
                (CGPoint(x: stimulusPos.x + boxW * 0.35, y: stimulusPos.y + boxH / 2),
                 CGPoint(x: receptorPos.x - boxW / 2, y: receptorPos.y - boxH * 0.3)),
                (CGPoint(x: receptorPos.x, y: receptorPos.y + boxH / 2),
                 CGPoint(x: controlPos.x, y: controlPos.y - boxH / 2)),
                (CGPoint(x: controlPos.x - boxW * 0.35, y: controlPos.y + boxH / 2),
                 CGPoint(x: effectorPos.x + boxW / 2, y: effectorPos.y + boxH * 0.1)),
                (CGPoint(x: effectorPos.x - boxW / 2, y: effectorPos.y - boxH * 0.1),
                 CGPoint(x: responsePos.x + boxW * 0.35, y: responsePos.y + boxH / 2)),
            ]

            for (from, to) in arrowPairs {
                drawFlowArrow(context: context, from: from, to: to)
            }

            // Feedback arrow (response back to stimulus)
            var feedbackPath = Path()
            let fbStart = CGPoint(x: responsePos.x, y: responsePos.y - boxH / 2)
            let fbEnd = CGPoint(x: stimulusPos.x - boxW * 0.35, y: stimulusPos.y + boxH / 2)
            feedbackPath.move(to: fbStart)
            feedbackPath.addQuadCurve(to: fbEnd, control: CGPoint(x: w * 0.05, y: h * 0.3))
            context.stroke(feedbackPath, with: .color(.gray.opacity(0.5)), style: StrokeStyle(lineWidth: 1.5, dash: [4, 3]))

            // Small "feedback" label
            context.draw(
                Text("feedback").font(.system(size: 7)).foregroundColor(.gray),
                at: CGPoint(x: w * 0.08, y: h * 0.32)
            )

            // Negative feedback symbol
            context.draw(
                Text("-").font(.system(size: 12, weight: .bold)).foregroundColor(.red.opacity(0.6)),
                at: CGPoint(x: w * 0.08, y: h * 0.27)
            )

            // Highlight arrow
            if let label = highlightLabel {
                let target: CGPoint
                let arrowOrigin: CGPoint

                switch label.lowercased() {
                case "stimulus":
                    target = stimulusPos
                    arrowOrigin = CGPoint(x: w * 0.15, y: h * 0.04)
                case "receptor":
                    target = receptorPos
                    arrowOrigin = CGPoint(x: w * 0.95, y: h * 0.15)
                case "control center", "integration center":
                    target = controlPos
                    arrowOrigin = CGPoint(x: w * 0.95, y: h * 0.82)
                case "effector":
                    target = effectorPos
                    arrowOrigin = CGPoint(x: w * 0.15, y: h * 0.95)
                case "response":
                    target = responsePos
                    arrowOrigin = CGPoint(x: w * 0.05, y: h * 0.82)
                case "negative feedback":
                    target = CGPoint(x: w * 0.1, y: h * 0.35)
                    arrowOrigin = CGPoint(x: w * 0.05, y: h * 0.5)
                default:
                    target = CGPoint(x: cx, y: cy)
                    arrowOrigin = CGPoint(x: w * 0.9, y: h * 0.1)
                }

                drawHighlightArrow(context: context, from: arrowOrigin, to: target)
            }
        }
        .frame(width: 200, height: 200)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.06), radius: 4, y: 2)
        )
    }

    private func drawFlowArrow(context: GraphicsContext, from: CGPoint, to: CGPoint) {
        var arrow = Path()
        arrow.move(to: from)
        arrow.addLine(to: to)
        context.stroke(arrow, with: .color(.gray.opacity(0.5)), lineWidth: 1.5)

        let angle = atan2(to.y - from.y, to.x - from.x)
        let headLen: CGFloat = 6
        var head = Path()
        head.move(to: to)
        head.addLine(to: CGPoint(x: to.x - headLen * cos(angle - .pi / 6), y: to.y - headLen * sin(angle - .pi / 6)))
        head.move(to: to)
        head.addLine(to: CGPoint(x: to.x - headLen * cos(angle + .pi / 6), y: to.y - headLen * sin(angle + .pi / 6)))
        context.stroke(head, with: .color(.gray.opacity(0.5)), lineWidth: 1.5)
    }

    private func drawHighlightArrow(context: GraphicsContext, from: CGPoint, to: CGPoint) {
        var arrow = Path()
        arrow.move(to: from)
        arrow.addLine(to: to)
        context.stroke(arrow, with: .color(.red), lineWidth: 2)

        let angle = atan2(to.y - from.y, to.x - from.x)
        let headLen: CGFloat = 8
        var head = Path()
        head.move(to: to)
        head.addLine(to: CGPoint(x: to.x - headLen * cos(angle - .pi / 6), y: to.y - headLen * sin(angle - .pi / 6)))
        head.move(to: to)
        head.addLine(to: CGPoint(x: to.x - headLen * cos(angle + .pi / 6), y: to.y - headLen * sin(angle + .pi / 6)))
        context.stroke(head, with: .color(.red), lineWidth: 2)

        context.draw(
            Text("?").font(.system(size: 16, weight: .bold)).foregroundColor(.red),
            at: CGPoint(x: from.x + 4, y: from.y - 12)
        )
    }
}

#Preview {
    VStack(spacing: 20) {
        QuizFeedbackLoopDiagram(highlightLabel: "receptor")
        QuizFeedbackLoopDiagram(highlightLabel: "effector")
    }
    .padding()
}
