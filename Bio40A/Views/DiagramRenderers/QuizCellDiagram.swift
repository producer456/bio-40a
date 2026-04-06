import SwiftUI

struct QuizCellDiagram: View {
    let highlightLabel: String?

    var body: some View {
        Canvas { context, size in
            let w = size.width
            let h = size.height
            let cx = w * 0.5
            let cy = h * 0.5

            // Cell membrane (outer oval)
            let cellRect = CGRect(x: w * 0.08, y: h * 0.1, width: w * 0.84, height: h * 0.8)
            let cellPath = Path(ellipseIn: cellRect)
            context.fill(cellPath, with: .color(Color(red: 0.95, green: 0.97, blue: 0.9)))
            context.stroke(cellPath, with: .color(.green.opacity(0.7)), lineWidth: 3)

            // Nucleus
            let nucR: CGFloat = w * 0.14
            let nucCenter = CGPoint(x: cx - w * 0.05, y: cy + h * 0.02)
            let nucRect = CGRect(x: nucCenter.x - nucR, y: nucCenter.y - nucR, width: nucR * 2, height: nucR * 2)
            let nucPath = Path(ellipseIn: nucRect)
            context.fill(nucPath, with: .color(Color(red: 0.7, green: 0.75, blue: 0.95)))
            context.stroke(nucPath, with: .color(.indigo.opacity(0.7)), lineWidth: 2)

            // Nucleolus (small circle inside nucleus)
            let nloR: CGFloat = w * 0.04
            let nloRect = CGRect(x: nucCenter.x - nloR, y: nucCenter.y - nloR, width: nloR * 2, height: nloR * 2)
            context.fill(Path(ellipseIn: nloRect), with: .color(.indigo.opacity(0.5)))

            // Mitochondria (oval shapes)
            drawMitochondria(context: context, center: CGPoint(x: cx + w * 0.2, y: cy - h * 0.12), w: w)
            drawMitochondria(context: context, center: CGPoint(x: cx + w * 0.08, y: cy + h * 0.22), w: w)

            // Rough ER (wavy lines near nucleus)
            drawRoughER(context: context, startX: nucCenter.x + nucR + w * 0.03, centerY: nucCenter.y, w: w, h: h)

            // Golgi apparatus (stacked curves)
            drawGolgi(context: context, center: CGPoint(x: cx + w * 0.22, y: cy + h * 0.1), w: w)

            // Ribosomes (tiny dots)
            let ribPositions: [CGPoint] = [
                CGPoint(x: cx - w * 0.25, y: cy - h * 0.2),
                CGPoint(x: cx - w * 0.28, y: cy - h * 0.12),
                CGPoint(x: cx - w * 0.22, y: cy + h * 0.18),
                CGPoint(x: cx + w * 0.3, y: cy - h * 0.25),
            ]
            for pos in ribPositions {
                let ribRect = CGRect(x: pos.x - 2, y: pos.y - 2, width: 4, height: 4)
                context.fill(Path(ellipseIn: ribRect), with: .color(.brown.opacity(0.6)))
            }

            // Lysosome
            let lysoCenter = CGPoint(x: cx - w * 0.22, y: cy + h * 0.08)
            let lysoR: CGFloat = w * 0.045
            let lysoRect = CGRect(x: lysoCenter.x - lysoR, y: lysoCenter.y - lysoR, width: lysoR * 2, height: lysoR * 2)
            context.fill(Path(ellipseIn: lysoRect), with: .color(.orange.opacity(0.4)))
            context.stroke(Path(ellipseIn: lysoRect), with: .color(.orange.opacity(0.7)), lineWidth: 1.5)

            // Highlight arrow
            if let label = highlightLabel {
                let target: CGPoint
                let arrowOrigin: CGPoint

                switch label.lowercased() {
                case "nucleus":
                    target = nucCenter
                    arrowOrigin = CGPoint(x: w * 0.88, y: h * 0.14)
                case "nucleolus":
                    target = nucCenter
                    arrowOrigin = CGPoint(x: w * 0.85, y: h * 0.12)
                case "mitochondria", "mitochondrion":
                    target = CGPoint(x: cx + w * 0.2, y: cy - h * 0.12)
                    arrowOrigin = CGPoint(x: w * 0.88, y: h * 0.18)
                case "rough er", "rough endoplasmic reticulum":
                    target = CGPoint(x: nucCenter.x + nucR + w * 0.08, y: nucCenter.y)
                    arrowOrigin = CGPoint(x: w * 0.9, y: h * 0.38)
                case "golgi", "golgi apparatus":
                    target = CGPoint(x: cx + w * 0.22, y: cy + h * 0.1)
                    arrowOrigin = CGPoint(x: w * 0.9, y: h * 0.76)
                case "cell membrane", "plasma membrane":
                    target = CGPoint(x: w * 0.9, y: cy)
                    arrowOrigin = CGPoint(x: w * 0.92, y: h * 0.18)
                case "ribosome", "ribosomes":
                    target = CGPoint(x: cx - w * 0.25, y: cy - h * 0.2)
                    arrowOrigin = CGPoint(x: w * 0.1, y: h * 0.12)
                case "lysosome":
                    target = lysoCenter
                    arrowOrigin = CGPoint(x: w * 0.1, y: h * 0.84)
                case "cytoplasm":
                    target = CGPoint(x: cx - w * 0.15, y: cy - h * 0.22)
                    arrowOrigin = CGPoint(x: w * 0.1, y: h * 0.1)
                default:
                    target = CGPoint(x: cx, y: cy)
                    arrowOrigin = CGPoint(x: w * 0.88, y: h * 0.14)
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

    private func drawMitochondria(context: GraphicsContext, center: CGPoint, w: CGFloat) {
        let mw: CGFloat = w * 0.08
        let mh: CGFloat = w * 0.045
        let rect = CGRect(x: center.x - mw, y: center.y - mh, width: mw * 2, height: mh * 2)
        let path = Path(ellipseIn: rect)
        context.fill(path, with: .color(Color(red: 0.95, green: 0.8, blue: 0.8)))
        context.stroke(path, with: .color(.red.opacity(0.6)), lineWidth: 1.5)

        // Inner folds (cristae)
        var cristae = Path()
        cristae.move(to: CGPoint(x: center.x - mw * 0.5, y: center.y - mh * 0.6))
        cristae.addLine(to: CGPoint(x: center.x - mw * 0.5, y: center.y + mh * 0.4))
        cristae.move(to: CGPoint(x: center.x, y: center.y - mh * 0.6))
        cristae.addLine(to: CGPoint(x: center.x, y: center.y + mh * 0.6))
        cristae.move(to: CGPoint(x: center.x + mw * 0.5, y: center.y - mh * 0.4))
        cristae.addLine(to: CGPoint(x: center.x + mw * 0.5, y: center.y + mh * 0.6))
        context.stroke(cristae, with: .color(.red.opacity(0.3)), lineWidth: 1)
    }

    private func drawRoughER(context: GraphicsContext, startX: CGFloat, centerY: CGFloat, w: CGFloat, h: CGFloat) {
        for i in 0..<3 {
            let offset = CGFloat(i) * w * 0.035
            var erPath = Path()
            let y = centerY - h * 0.06 + CGFloat(i) * h * 0.06
            erPath.move(to: CGPoint(x: startX + offset, y: y))
            erPath.addQuadCurve(
                to: CGPoint(x: startX + offset + w * 0.12, y: y),
                control: CGPoint(x: startX + offset + w * 0.06, y: y - h * 0.02)
            )
            context.stroke(erPath, with: .color(.purple.opacity(0.5)), lineWidth: 1.5)

            // Ribosomes on ER
            for j in 0..<3 {
                let dotX = startX + offset + CGFloat(j) * w * 0.04 + w * 0.02
                let dotRect = CGRect(x: dotX - 1.5, y: y - 3.5, width: 3, height: 3)
                context.fill(Path(ellipseIn: dotRect), with: .color(.brown.opacity(0.5)))
            }
        }
    }

    private func drawGolgi(context: GraphicsContext, center: CGPoint, w: CGFloat) {
        for i in 0..<4 {
            let y = center.y - w * 0.05 + CGFloat(i) * w * 0.03
            var golgiPath = Path()
            golgiPath.move(to: CGPoint(x: center.x - w * 0.07, y: y))
            golgiPath.addQuadCurve(
                to: CGPoint(x: center.x + w * 0.07, y: y),
                control: CGPoint(x: center.x, y: y - w * 0.02)
            )
            context.stroke(golgiPath, with: .color(.yellow.opacity(0.7)), lineWidth: 2)
        }
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
        QuizCellDiagram(highlightLabel: "nucleus")
        QuizCellDiagram(highlightLabel: "mitochondria")
    }
    .padding()
}
