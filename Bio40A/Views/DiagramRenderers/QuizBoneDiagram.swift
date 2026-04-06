import SwiftUI

struct QuizBoneDiagram: View {
    let highlightLabel: String?

    var body: some View {
        Canvas { context, size in
            let w = size.width
            let h = size.height
            let cx = w * 0.45

            // Long bone cross-section (femur-like)
            // Proximal epiphysis (top bulge)
            let epiTopY = h * 0.05
            let epiTopH = h * 0.2
            let epiW = w * 0.22
            let epiTopRect = CGRect(x: cx - epiW, y: epiTopY, width: epiW * 2, height: epiTopH)
            let epiTopPath = Path(roundedRect: epiTopRect, cornerRadius: epiW * 0.6)
            context.fill(epiTopPath, with: .color(Color(red: 0.95, green: 0.92, blue: 0.85)))
            context.stroke(epiTopPath, with: .color(Color(red: 0.75, green: 0.65, blue: 0.5)), lineWidth: 1.5)

            // Spongy bone inside proximal epiphysis (dots/circles pattern)
            for row in 0..<3 {
                for col in 0..<4 {
                    let dotX = cx - epiW * 0.6 + CGFloat(col) * epiW * 0.4
                    let dotY = epiTopY + h * 0.05 + CGFloat(row) * h * 0.04
                    let dotR: CGFloat = 3
                    context.fill(Path(ellipseIn: CGRect(x: dotX - dotR, y: dotY - dotR, width: dotR * 2, height: dotR * 2)),
                                 with: .color(Color(red: 0.85, green: 0.75, blue: 0.6).opacity(0.6)))
                }
            }

            // Diaphysis (shaft)
            let shaftTop = epiTopY + epiTopH - h * 0.02
            let shaftBot = h * 0.73
            let shaftW = w * 0.11

            var shaft = Path()
            shaft.move(to: CGPoint(x: cx - shaftW, y: shaftTop))
            shaft.addLine(to: CGPoint(x: cx - shaftW, y: shaftBot))
            shaft.addLine(to: CGPoint(x: cx + shaftW, y: shaftBot))
            shaft.addLine(to: CGPoint(x: cx + shaftW, y: shaftTop))
            shaft.closeSubpath()

            // Compact bone (outer shaft)
            context.fill(shaft, with: .color(Color(red: 0.92, green: 0.88, blue: 0.78)))
            context.stroke(shaft, with: .color(Color(red: 0.75, green: 0.65, blue: 0.5)), lineWidth: 1.5)

            // Medullary cavity (inner shaft - yellow)
            let cavW = shaftW * 0.55
            let cavTop = shaftTop + h * 0.05
            let cavBot = shaftBot - h * 0.05
            let cavRect = CGRect(x: cx - cavW, y: cavTop, width: cavW * 2, height: cavBot - cavTop)
            context.fill(Path(cavRect), with: .color(Color(red: 1.0, green: 0.95, blue: 0.6)))
            context.stroke(Path(cavRect), with: .color(Color(red: 0.85, green: 0.78, blue: 0.5)), lineWidth: 1)

            // Distal epiphysis (bottom bulge)
            let epiBotY = shaftBot - h * 0.02
            let epiBotH = h * 0.2
            let epiBotRect = CGRect(x: cx - epiW, y: epiBotY, width: epiW * 2, height: epiBotH)
            let epiBotPath = Path(roundedRect: epiBotRect, cornerRadius: epiW * 0.6)
            context.fill(epiBotPath, with: .color(Color(red: 0.95, green: 0.92, blue: 0.85)))
            context.stroke(epiBotPath, with: .color(Color(red: 0.75, green: 0.65, blue: 0.5)), lineWidth: 1.5)

            // Spongy bone in distal epiphysis
            for row in 0..<3 {
                for col in 0..<4 {
                    let dotX = cx - epiW * 0.6 + CGFloat(col) * epiW * 0.4
                    let dotY = epiBotY + h * 0.05 + CGFloat(row) * h * 0.04
                    let dotR: CGFloat = 3
                    context.fill(Path(ellipseIn: CGRect(x: dotX - dotR, y: dotY - dotR, width: dotR * 2, height: dotR * 2)),
                                 with: .color(Color(red: 0.85, green: 0.75, blue: 0.6).opacity(0.6)))
                }
            }

            // Periosteum (thin outer line on diaphysis)
            var periosteum = Path()
            periosteum.move(to: CGPoint(x: cx - shaftW - 3, y: shaftTop + h * 0.02))
            periosteum.addLine(to: CGPoint(x: cx - shaftW - 3, y: shaftBot - h * 0.02))
            periosteum.move(to: CGPoint(x: cx + shaftW + 3, y: shaftTop + h * 0.02))
            periosteum.addLine(to: CGPoint(x: cx + shaftW + 3, y: shaftBot - h * 0.02))
            context.stroke(periosteum, with: .color(.blue.opacity(0.5)), lineWidth: 2)

            // Articular cartilage (thin cap at top and bottom)
            var cartTop = Path()
            cartTop.addRoundedRect(in: CGRect(x: cx - epiW + 2, y: epiTopY, width: (epiW - 2) * 2, height: h * 0.02), cornerSize: CGSize(width: 4, height: 4))
            context.fill(cartTop, with: .color(.cyan.opacity(0.4)))

            var cartBot = Path()
            cartBot.addRoundedRect(in: CGRect(x: cx - epiW + 2, y: epiBotY + epiBotH - h * 0.02, width: (epiW - 2) * 2, height: h * 0.02), cornerSize: CGSize(width: 4, height: 4))
            context.fill(cartBot, with: .color(.cyan.opacity(0.4)))

            // Highlight arrow
            if let label = highlightLabel {
                let target: CGPoint
                let arrowOrigin: CGPoint

                switch label.lowercased() {
                case "epiphysis", "proximal epiphysis":
                    target = CGPoint(x: cx, y: epiTopY + epiTopH * 0.5)
                    arrowOrigin = CGPoint(x: w * 0.88, y: h * 0.06)
                case "distal epiphysis":
                    target = CGPoint(x: cx, y: epiBotY + epiBotH * 0.5)
                    arrowOrigin = CGPoint(x: w * 0.88, y: h * 0.92)
                case "diaphysis":
                    target = CGPoint(x: cx, y: (shaftTop + shaftBot) * 0.5)
                    arrowOrigin = CGPoint(x: w * 0.88, y: h * 0.42)
                case "medullary cavity", "marrow cavity":
                    target = CGPoint(x: cx, y: (cavTop + cavBot) * 0.5)
                    arrowOrigin = CGPoint(x: w * 0.88, y: h * 0.5)
                case "compact bone":
                    target = CGPoint(x: cx + shaftW - shaftW * 0.25, y: (shaftTop + shaftBot) * 0.5)
                    arrowOrigin = CGPoint(x: w * 0.9, y: h * 0.36)
                case "spongy bone":
                    target = CGPoint(x: cx, y: epiTopY + epiTopH * 0.5)
                    arrowOrigin = CGPoint(x: w * 0.88, y: h * 0.2)
                case "periosteum":
                    target = CGPoint(x: cx + shaftW + 3, y: (shaftTop + shaftBot) * 0.5)
                    arrowOrigin = CGPoint(x: w * 0.92, y: h * 0.3)
                case "articular cartilage":
                    target = CGPoint(x: cx, y: epiTopY + h * 0.01)
                    arrowOrigin = CGPoint(x: w * 0.88, y: h * 0.02)
                default:
                    target = CGPoint(x: cx, y: h * 0.5)
                    arrowOrigin = CGPoint(x: w * 0.88, y: h * 0.3)
                }

                drawArrowWithLabel(context: context, from: arrowOrigin, to: target)
            }
        }
        .frame(width: 200, height: 200)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.06), radius: 4, y: 2)
        )
    }

    private func drawArrowWithLabel(context: GraphicsContext, from: CGPoint, to: CGPoint) {
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
        QuizBoneDiagram(highlightLabel: "diaphysis")
        QuizBoneDiagram(highlightLabel: "medullary cavity")
    }
    .padding()
}
