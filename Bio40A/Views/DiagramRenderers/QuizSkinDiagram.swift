import SwiftUI

struct QuizSkinDiagram: View {
    let highlightLabel: String?

    var body: some View {
        Canvas { context, size in
            let w = size.width
            let h = size.height

            // Background skin cross-section
            // Epidermis (top layer)
            let epidermisH = h * 0.22
            let epidermisRect = CGRect(x: 0, y: 0, width: w, height: epidermisH)
            context.fill(Path(epidermisRect), with: .color(Color(red: 0.96, green: 0.87, blue: 0.76)))

            // Stratum corneum line at very top
            let scRect = CGRect(x: 0, y: 0, width: w, height: h * 0.05)
            context.fill(Path(scRect), with: .color(Color(red: 0.9, green: 0.8, blue: 0.68)))

            // Epidermis-dermis boundary (wavy line)
            var wavyLine = Path()
            wavyLine.move(to: CGPoint(x: 0, y: epidermisH))
            let segments = 8
            for i in 0..<segments {
                let segW = w / CGFloat(segments)
                let x1 = CGFloat(i) * segW + segW * 0.5
                let x2 = CGFloat(i + 1) * segW
                let cy = epidermisH + (i % 2 == 0 ? h * 0.03 : -h * 0.02)
                wavyLine.addQuadCurve(to: CGPoint(x: x2, y: epidermisH), control: CGPoint(x: x1, y: cy))
            }
            context.stroke(wavyLine, with: .color(.brown.opacity(0.5)), lineWidth: 1.5)

            // Dermis (middle layer)
            let dermisTop = epidermisH
            let dermisH = h * 0.42
            let dermisRect = CGRect(x: 0, y: dermisTop, width: w, height: dermisH)
            context.fill(Path(dermisRect), with: .color(Color(red: 0.95, green: 0.82, blue: 0.78)))

            // Dermis-hypodermis boundary
            var dermisBorder = Path()
            dermisBorder.move(to: CGPoint(x: 0, y: dermisTop + dermisH))
            dermisBorder.addLine(to: CGPoint(x: w, y: dermisTop + dermisH))
            context.stroke(dermisBorder, with: .color(.brown.opacity(0.3)), style: StrokeStyle(lineWidth: 1, dash: [4, 3]))

            // Hypodermis (bottom layer)
            let hypoTop = dermisTop + dermisH
            let hypoRect = CGRect(x: 0, y: hypoTop, width: w, height: h - hypoTop)
            context.fill(Path(hypoRect), with: .color(Color(red: 1.0, green: 0.93, blue: 0.7)))

            // Fat cells in hypodermis
            for i in 0..<5 {
                let fatX = w * 0.12 + CGFloat(i) * w * 0.17
                let fatY = hypoTop + (h - hypoTop) * 0.4
                let fatR: CGFloat = min(w, h) * 0.04
                let fatRect = CGRect(x: fatX - fatR, y: fatY - fatR, width: fatR * 2, height: fatR * 2)
                context.fill(Path(ellipseIn: fatRect), with: .color(Color(red: 1.0, green: 0.95, blue: 0.65)))
                context.stroke(Path(ellipseIn: fatRect), with: .color(.orange.opacity(0.4)), lineWidth: 1)
            }

            // Hair follicle
            var hair = Path()
            hair.move(to: CGPoint(x: w * 0.35, y: 0))
            hair.addLine(to: CGPoint(x: w * 0.35, y: h * 0.05))
            hair.move(to: CGPoint(x: w * 0.35, y: h * 0.05))
            hair.addLine(to: CGPoint(x: w * 0.34, y: dermisTop + dermisH * 0.7))
            context.stroke(hair, with: .color(.brown.opacity(0.6)), lineWidth: 1.5)

            // Hair bulb
            let bulbR: CGFloat = w * 0.025
            let bulbCenter = CGPoint(x: w * 0.34, y: dermisTop + dermisH * 0.7)
            context.fill(Path(ellipseIn: CGRect(x: bulbCenter.x - bulbR, y: bulbCenter.y - bulbR, width: bulbR * 2, height: bulbR * 2.5)), with: .color(.brown.opacity(0.4)))

            // Sweat gland (coiled shape in dermis)
            var sweat = Path()
            let sgX = w * 0.65
            let sgY = dermisTop + dermisH * 0.5
            sweat.move(to: CGPoint(x: sgX, y: sgY))
            sweat.addQuadCurve(to: CGPoint(x: sgX + w * 0.04, y: sgY + h * 0.03), control: CGPoint(x: sgX + w * 0.06, y: sgY))
            sweat.addQuadCurve(to: CGPoint(x: sgX, y: sgY + h * 0.06), control: CGPoint(x: sgX - w * 0.02, y: sgY + h * 0.04))
            context.stroke(sweat, with: .color(.blue.opacity(0.5)), lineWidth: 1.5)

            // Duct to surface
            var duct = Path()
            duct.move(to: CGPoint(x: sgX, y: sgY))
            duct.addLine(to: CGPoint(x: sgX + w * 0.02, y: h * 0.02))
            context.stroke(duct, with: .color(.blue.opacity(0.3)), lineWidth: 1)

            // Blood vessel in dermis
            var vessel = Path()
            vessel.move(to: CGPoint(x: w * 0.1, y: dermisTop + dermisH * 0.8))
            vessel.addQuadCurve(to: CGPoint(x: w * 0.5, y: dermisTop + dermisH * 0.7), control: CGPoint(x: w * 0.3, y: dermisTop + dermisH * 0.9))
            vessel.addQuadCurve(to: CGPoint(x: w * 0.9, y: dermisTop + dermisH * 0.8), control: CGPoint(x: w * 0.7, y: dermisTop + dermisH * 0.6))
            context.stroke(vessel, with: .color(.red.opacity(0.5)), lineWidth: 1.5)

            // Layer labels (small, on the left side)
            context.draw(Text("E").font(.system(size: 9, weight: .medium)).foregroundColor(.brown.opacity(0.6)),
                         at: CGPoint(x: w * 0.06, y: epidermisH * 0.5))
            context.draw(Text("D").font(.system(size: 9, weight: .medium)).foregroundColor(.brown.opacity(0.6)),
                         at: CGPoint(x: w * 0.06, y: dermisTop + dermisH * 0.5))
            context.draw(Text("H").font(.system(size: 9, weight: .medium)).foregroundColor(.brown.opacity(0.6)),
                         at: CGPoint(x: w * 0.06, y: hypoTop + (h - hypoTop) * 0.5))

            // Highlight arrow
            if let label = highlightLabel {
                let target: CGPoint
                let arrowOrigin: CGPoint

                switch label.lowercased() {
                case "epidermis":
                    target = CGPoint(x: w * 0.55, y: epidermisH * 0.55)
                    arrowOrigin = CGPoint(x: w * 0.92, y: h * 0.04)
                case "dermis":
                    target = CGPoint(x: w * 0.55, y: dermisTop + dermisH * 0.5)
                    arrowOrigin = CGPoint(x: w * 0.92, y: h * 0.22)
                case "hypodermis", "subcutaneous":
                    target = CGPoint(x: w * 0.55, y: hypoTop + (h - hypoTop) * 0.4)
                    arrowOrigin = CGPoint(x: w * 0.92, y: h * 0.88)
                case "stratum corneum":
                    target = CGPoint(x: w * 0.55, y: h * 0.025)
                    arrowOrigin = CGPoint(x: w * 0.92, y: h * 0.04)
                case "hair follicle":
                    target = CGPoint(x: w * 0.34, y: dermisTop + dermisH * 0.4)
                    arrowOrigin = CGPoint(x: w * 0.12, y: h * 0.85)
                case "sweat gland":
                    target = CGPoint(x: sgX, y: sgY + h * 0.03)
                    arrowOrigin = CGPoint(x: w * 0.92, y: h * 0.62)
                case "blood vessel":
                    target = CGPoint(x: w * 0.5, y: dermisTop + dermisH * 0.75)
                    arrowOrigin = CGPoint(x: w * 0.12, y: h * 0.72)
                default:
                    target = CGPoint(x: w * 0.5, y: h * 0.5)
                    arrowOrigin = CGPoint(x: w * 0.9, y: h * 0.15)
                }

                drawArrowWithLabel(context: context, from: arrowOrigin, to: target)
            }
        }
        .frame(width: 200, height: 200)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        )
        .shadow(color: .black.opacity(0.06), radius: 4, y: 2)
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
        QuizSkinDiagram(highlightLabel: "epidermis")
        QuizSkinDiagram(highlightLabel: "hypodermis")
    }
    .padding()
}
