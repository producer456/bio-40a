import SwiftUI

struct QuizBodyDiagram: View {
    let highlightLabel: String?

    var body: some View {
        Canvas { context, size in
            let w = size.width
            let h = size.height
            let cx = w * 0.5

            // Draw body outline
            drawBody(context: context, w: w, h: h, cx: cx)

            // Draw region highlights and arrow
            if let label = highlightLabel {
                drawHighlight(context: context, label: label, w: w, h: h, cx: cx)
            }
        }
        .frame(width: 200, height: 200)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.06), radius: 4, y: 2)
        )
    }

    private func drawBody(context: GraphicsContext, w: CGFloat, h: CGFloat, cx: CGFloat) {
        var body = Path()

        // Head
        let headR: CGFloat = w * 0.07
        let headCY = h * 0.1
        body.addEllipse(in: CGRect(x: cx - headR, y: headCY - headR, width: headR * 2, height: headR * 2.2))

        // Neck
        body.move(to: CGPoint(x: cx - w * 0.025, y: headCY + headR * 1.1))
        body.addLine(to: CGPoint(x: cx - w * 0.025, y: h * 0.2))
        body.move(to: CGPoint(x: cx + w * 0.025, y: headCY + headR * 1.1))
        body.addLine(to: CGPoint(x: cx + w * 0.025, y: h * 0.2))

        // Torso
        let shoulderY = h * 0.2
        let shoulderW = w * 0.2
        let waistY = h * 0.48
        let waistW = w * 0.12
        let hipW = w * 0.15
        let hipY = h * 0.55
        let crotchY = h * 0.62

        body.move(to: CGPoint(x: cx - shoulderW, y: shoulderY))
        body.addLine(to: CGPoint(x: cx - waistW, y: waistY))
        body.addLine(to: CGPoint(x: cx - hipW, y: hipY))
        body.addQuadCurve(to: CGPoint(x: cx, y: crotchY), control: CGPoint(x: cx - hipW, y: crotchY))
        body.addQuadCurve(to: CGPoint(x: cx + hipW, y: hipY), control: CGPoint(x: cx + hipW, y: crotchY))
        body.addLine(to: CGPoint(x: cx + waistW, y: waistY))
        body.addLine(to: CGPoint(x: cx + shoulderW, y: shoulderY))
        body.closeSubpath()

        // Arms
        body.move(to: CGPoint(x: cx - shoulderW, y: shoulderY + h * 0.01))
        body.addLine(to: CGPoint(x: cx - shoulderW - w * 0.12, y: h * 0.48))
        body.move(to: CGPoint(x: cx + shoulderW, y: shoulderY + h * 0.01))
        body.addLine(to: CGPoint(x: cx + shoulderW + w * 0.12, y: h * 0.48))

        // Legs
        body.move(to: CGPoint(x: cx - w * 0.04, y: crotchY))
        body.addLine(to: CGPoint(x: cx - hipW + w * 0.02, y: h * 0.92))
        body.move(to: CGPoint(x: cx + w * 0.04, y: crotchY))
        body.addLine(to: CGPoint(x: cx + hipW - w * 0.02, y: h * 0.92))

        context.stroke(body, with: .color(.primary.opacity(0.5)), lineWidth: 1.5)

        // Fill torso lightly
        var torso = Path()
        torso.move(to: CGPoint(x: cx - shoulderW, y: shoulderY))
        torso.addLine(to: CGPoint(x: cx - waistW, y: waistY))
        torso.addLine(to: CGPoint(x: cx - hipW, y: hipY))
        torso.addQuadCurve(to: CGPoint(x: cx, y: crotchY), control: CGPoint(x: cx - hipW, y: crotchY))
        torso.addQuadCurve(to: CGPoint(x: cx + hipW, y: hipY), control: CGPoint(x: cx + hipW, y: crotchY))
        torso.addLine(to: CGPoint(x: cx + waistW, y: waistY))
        torso.addLine(to: CGPoint(x: cx + shoulderW, y: shoulderY))
        torso.closeSubpath()
        context.fill(torso, with: .color(.gray.opacity(0.06)))
    }

    private func drawHighlight(context: GraphicsContext, label: String, w: CGFloat, h: CGFloat, cx: CGFloat) {
        let targetPoint: CGPoint
        let arrowStart: CGPoint

        switch label.lowercased() {
        case "cranial", "head":
            targetPoint = CGPoint(x: cx, y: h * 0.1)
            arrowStart = CGPoint(x: w * 0.8, y: h * 0.06)
        case "thoracic cavity", "thoracic":
            targetPoint = CGPoint(x: cx, y: h * 0.3)
            arrowStart = CGPoint(x: w * 0.85, y: h * 0.18)
        case "abdominal cavity", "abdominal":
            targetPoint = CGPoint(x: cx, y: h * 0.43)
            arrowStart = CGPoint(x: w * 0.85, y: h * 0.35)
        case "pelvic cavity", "pelvic":
            targetPoint = CGPoint(x: cx, y: h * 0.55)
            arrowStart = CGPoint(x: w * 0.85, y: h * 0.5)
        case "anterior", "ventral":
            targetPoint = CGPoint(x: cx + w * 0.02, y: h * 0.35)
            arrowStart = CGPoint(x: w * 0.85, y: h * 0.28)
        case "posterior", "dorsal":
            targetPoint = CGPoint(x: cx - w * 0.02, y: h * 0.35)
            arrowStart = CGPoint(x: w * 0.12, y: h * 0.28)
        case "superior":
            targetPoint = CGPoint(x: cx, y: h * 0.06)
            arrowStart = CGPoint(x: w * 0.82, y: h * 0.04)
        case "inferior":
            targetPoint = CGPoint(x: cx, y: h * 0.88)
            arrowStart = CGPoint(x: w * 0.82, y: h * 0.84)
        case "sagittal plane":
            // Draw vertical line through center
            var plane = Path()
            plane.move(to: CGPoint(x: cx, y: h * 0.04))
            plane.addLine(to: CGPoint(x: cx, y: h * 0.92))
            context.stroke(plane, with: .color(.blue.opacity(0.5)), style: StrokeStyle(lineWidth: 2, dash: [6, 3]))
            targetPoint = CGPoint(x: cx, y: h * 0.5)
            arrowStart = CGPoint(x: w * 0.85, y: h * 0.42)
        case "frontal plane", "coronal plane":
            // Draw horizontal line across shoulders
            var plane = Path()
            plane.move(to: CGPoint(x: w * 0.15, y: h * 0.35))
            plane.addLine(to: CGPoint(x: w * 0.85, y: h * 0.35))
            context.stroke(plane, with: .color(.blue.opacity(0.5)), style: StrokeStyle(lineWidth: 2, dash: [6, 3]))
            targetPoint = CGPoint(x: cx, y: h * 0.35)
            arrowStart = CGPoint(x: w * 0.85, y: h * 0.22)
        case "transverse plane":
            var plane = Path()
            plane.move(to: CGPoint(x: w * 0.18, y: h * 0.4))
            plane.addLine(to: CGPoint(x: w * 0.82, y: h * 0.4))
            context.stroke(plane, with: .color(.green.opacity(0.5)), style: StrokeStyle(lineWidth: 2, dash: [6, 3]))
            targetPoint = CGPoint(x: cx, y: h * 0.4)
            arrowStart = CGPoint(x: w * 0.85, y: h * 0.3)
        default:
            targetPoint = CGPoint(x: cx, y: h * 0.35)
            arrowStart = CGPoint(x: w * 0.85, y: h * 0.25)
        }

        // Draw arrow
        drawArrowWithLabel(context: context, from: arrowStart, to: targetPoint)
    }

    private func drawArrowWithLabel(context: GraphicsContext, from: CGPoint, to: CGPoint) {
        // Arrow line
        var arrow = Path()
        arrow.move(to: from)
        arrow.addLine(to: to)
        context.stroke(arrow, with: .color(.red), lineWidth: 2)

        // Arrowhead
        let angle = atan2(to.y - from.y, to.x - from.x)
        let headLen: CGFloat = 8
        var head = Path()
        head.move(to: to)
        head.addLine(to: CGPoint(
            x: to.x - headLen * cos(angle - .pi / 6),
            y: to.y - headLen * sin(angle - .pi / 6)
        ))
        head.move(to: to)
        head.addLine(to: CGPoint(
            x: to.x - headLen * cos(angle + .pi / 6),
            y: to.y - headLen * sin(angle + .pi / 6)
        ))
        context.stroke(head, with: .color(.red), lineWidth: 2)

        // "?" label
        let labelPoint = CGPoint(x: from.x + 4, y: from.y - 12)
        context.draw(
            Text("?").font(.system(size: 16, weight: .bold)).foregroundColor(.red),
            at: labelPoint
        )
    }
}

#Preview {
    VStack(spacing: 20) {
        QuizBodyDiagram(highlightLabel: "thoracic cavity")
        QuizBodyDiagram(highlightLabel: "sagittal plane")
    }
    .padding()
}
