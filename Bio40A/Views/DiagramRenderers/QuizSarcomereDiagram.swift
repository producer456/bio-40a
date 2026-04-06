import SwiftUI

struct QuizSarcomereDiagram: View {
    let highlightLabel: String?

    var body: some View {
        Canvas { context, size in
            let w = size.width
            let h = size.height

            let topY = h * 0.2
            let botY = h * 0.8
            let midY = (topY + botY) * 0.5

            // Z-disc positions
            let zLeftX = w * 0.1
            let zRightX = w * 0.9
            let zMidLeftX = w * 0.35  // where actin ends overlap
            let zMidRightX = w * 0.65

            // Z-discs (vertical dark lines)
            for zx in [zLeftX, zRightX] {
                var zLine = Path()
                zLine.move(to: CGPoint(x: zx, y: topY - h * 0.05))
                zLine.addLine(to: CGPoint(x: zx, y: botY + h * 0.05))
                context.stroke(zLine, with: .color(.primary.opacity(0.8)), lineWidth: 3)
            }

            // I-band regions (lighter, near Z-discs)
            let iBandLeft = CGRect(x: zLeftX, y: topY, width: w * 0.1, height: botY - topY)
            let iBandRight = CGRect(x: zRightX - w * 0.1, y: topY, width: w * 0.1, height: botY - topY)
            context.fill(Path(iBandLeft), with: .color(Color(red: 0.85, green: 0.9, blue: 0.95)))
            context.fill(Path(iBandRight), with: .color(Color(red: 0.85, green: 0.9, blue: 0.95)))

            // A-band (darker, entire myosin region)
            let aBandX = zLeftX + w * 0.1
            let aBandW = (zRightX - w * 0.1) - aBandX
            let aBandRect = CGRect(x: aBandX, y: topY, width: aBandW, height: botY - topY)
            context.fill(Path(aBandRect), with: .color(Color(red: 0.8, green: 0.75, blue: 0.85).opacity(0.4)))

            // H-zone (lighter center of A-band, no actin overlap)
            let hZoneX = zMidLeftX + w * 0.05
            let hZoneW = (zMidRightX - w * 0.05) - hZoneX
            let hZoneRect = CGRect(x: hZoneX, y: topY + (botY - topY) * 0.1, width: hZoneW, height: (botY - topY) * 0.8)
            context.fill(Path(hZoneRect), with: .color(Color(red: 0.92, green: 0.88, blue: 0.95).opacity(0.5)))

            // M-line (center vertical line)
            let mLineX = w * 0.5
            var mLine = Path()
            mLine.move(to: CGPoint(x: mLineX, y: topY))
            mLine.addLine(to: CGPoint(x: mLineX, y: botY))
            context.stroke(mLine, with: .color(.primary.opacity(0.4)), style: StrokeStyle(lineWidth: 2, dash: [4, 3]))

            // Actin filaments (thin lines from Z-discs toward center)
            let actinCount = 5
            for i in 0..<actinCount {
                let fraction = CGFloat(i) / CGFloat(actinCount - 1)
                let y = topY + (botY - topY) * 0.15 + (botY - topY) * 0.7 * fraction

                // Left actin
                var leftActin = Path()
                leftActin.move(to: CGPoint(x: zLeftX, y: y))
                leftActin.addLine(to: CGPoint(x: zMidLeftX + w * 0.05, y: y))
                context.stroke(leftActin, with: .color(.blue.opacity(0.6)), lineWidth: 1.5)

                // Right actin
                var rightActin = Path()
                rightActin.move(to: CGPoint(x: zRightX, y: y))
                rightActin.addLine(to: CGPoint(x: zMidRightX - w * 0.05, y: y))
                context.stroke(rightActin, with: .color(.blue.opacity(0.6)), lineWidth: 1.5)
            }

            // Myosin filaments (thicker lines in center)
            let myosinCount = 4
            for i in 0..<myosinCount {
                let fraction = CGFloat(i) / CGFloat(myosinCount - 1)
                let y = topY + (botY - topY) * 0.2 + (botY - topY) * 0.6 * fraction

                var myosin = Path()
                myosin.move(to: CGPoint(x: aBandX + w * 0.02, y: y))
                myosin.addLine(to: CGPoint(x: aBandX + aBandW - w * 0.02, y: y))
                context.stroke(myosin, with: .color(.red.opacity(0.5)), lineWidth: 3)

                // Cross-bridges (small diagonal ticks)
                let bridgeCount = 6
                for b in 0..<bridgeCount {
                    let bx = aBandX + w * 0.04 + CGFloat(b) * (aBandW - w * 0.08) / CGFloat(bridgeCount - 1)
                    var bridge = Path()
                    bridge.move(to: CGPoint(x: bx, y: y - 3))
                    bridge.addLine(to: CGPoint(x: bx + 3, y: y - 6))
                    context.stroke(bridge, with: .color(.red.opacity(0.3)), lineWidth: 1)
                }
            }

            // Band labels (small text below diagram)
            let labelY = botY + h * 0.1
            context.draw(Text("I").font(.system(size: 8, weight: .bold)).foregroundColor(.blue.opacity(0.6)),
                         at: CGPoint(x: zLeftX + w * 0.05, y: labelY))
            context.draw(Text("A").font(.system(size: 8, weight: .bold)).foregroundColor(.purple.opacity(0.6)),
                         at: CGPoint(x: w * 0.5, y: labelY))
            context.draw(Text("I").font(.system(size: 8, weight: .bold)).foregroundColor(.blue.opacity(0.6)),
                         at: CGPoint(x: zRightX - w * 0.05, y: labelY))
            context.draw(Text("H").font(.system(size: 8, weight: .bold)).foregroundColor(.purple.opacity(0.4)),
                         at: CGPoint(x: w * 0.5, y: topY - h * 0.08))

            // Highlight arrow
            if let label = highlightLabel {
                let target: CGPoint
                let arrowOrigin: CGPoint

                switch label.lowercased() {
                case "z-disc", "z-line", "z disc":
                    target = CGPoint(x: zLeftX, y: midY)
                    arrowOrigin = CGPoint(x: w * 0.05, y: h * 0.08)
                case "a-band", "a band":
                    target = CGPoint(x: w * 0.5, y: topY + (botY - topY) * 0.3)
                    arrowOrigin = CGPoint(x: w * 0.5, y: h * 0.02)
                case "i-band", "i band":
                    target = CGPoint(x: zLeftX + w * 0.05, y: midY)
                    arrowOrigin = CGPoint(x: w * 0.05, y: h * 0.95)
                case "h-zone", "h zone":
                    target = CGPoint(x: w * 0.5, y: midY)
                    arrowOrigin = CGPoint(x: w * 0.5, y: h * 0.95)
                case "m-line", "m line":
                    target = CGPoint(x: mLineX, y: midY)
                    arrowOrigin = CGPoint(x: w * 0.75, y: h * 0.02)
                case "actin", "thin filament":
                    target = CGPoint(x: zLeftX + w * 0.13, y: topY + (botY - topY) * 0.35)
                    arrowOrigin = CGPoint(x: w * 0.05, y: h * 0.05)
                case "myosin", "thick filament":
                    target = CGPoint(x: w * 0.5, y: topY + (botY - topY) * 0.5)
                    arrowOrigin = CGPoint(x: w * 0.92, y: h * 0.05)
                default:
                    target = CGPoint(x: w * 0.5, y: midY)
                    arrowOrigin = CGPoint(x: w * 0.9, y: h * 0.1)
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
        QuizSarcomereDiagram(highlightLabel: "z-disc")
        QuizSarcomereDiagram(highlightLabel: "myosin")
    }
    .padding()
}
