import SwiftUI

struct BodyPlanesView: View {
    @State private var showSagittal = false
    @State private var showFrontal = false
    @State private var showTransverse = false

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Tap a plane to toggle it on/off")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                // Diagram area
                ZStack {
                    // Body outline
                    HumanBodyShape()
                        .stroke(Color.primary.opacity(0.6), lineWidth: 2)
                        .background(
                            HumanBodyShape()
                                .fill(Color.gray.opacity(0.08))
                        )

                    // Sagittal plane — vertical, divides left/right
                    if showSagittal {
                        SagittalPlane()
                            .fill(Color.red.opacity(0.25))
                            .transition(.opacity)
                        SagittalPlane()
                            .stroke(Color.red, lineWidth: 1.5)
                            .transition(.opacity)
                    }

                    // Frontal plane — vertical, divides front/back (shown as angled)
                    if showFrontal {
                        FrontalPlane()
                            .fill(Color.blue.opacity(0.2))
                            .transition(.opacity)
                        FrontalPlane()
                            .stroke(Color.blue, lineWidth: 1.5)
                            .transition(.opacity)
                    }

                    // Transverse plane — horizontal
                    if showTransverse {
                        TransversePlane()
                            .fill(Color.green.opacity(0.25))
                            .transition(.opacity)
                        TransversePlane()
                            .stroke(Color.green, lineWidth: 1.5)
                            .transition(.opacity)
                    }
                }
                .frame(height: 400)
                .padding(.horizontal)
                .animation(.easeInOut(duration: 0.3), value: showSagittal)
                .animation(.easeInOut(duration: 0.3), value: showFrontal)
                .animation(.easeInOut(duration: 0.3), value: showTransverse)

                // Toggle buttons
                VStack(spacing: 12) {
                    PlaneToggleButton(
                        title: "Sagittal Plane",
                        subtitle: "Divides into Left and Right",
                        color: .red,
                        isOn: $showSagittal
                    )
                    PlaneToggleButton(
                        title: "Frontal (Coronal) Plane",
                        subtitle: "Divides into Anterior and Posterior",
                        color: .blue,
                        isOn: $showFrontal
                    )
                    PlaneToggleButton(
                        title: "Transverse Plane",
                        subtitle: "Divides into Superior and Inferior",
                        color: .green,
                        isOn: $showTransverse
                    )
                }
                .padding(.horizontal)

                Spacer(minLength: 40)
            }
            .padding(.top)
        }
        .navigationTitle("Body Planes")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Plane toggle button

struct PlaneToggleButton: View {
    let title: String
    let subtitle: String
    let color: Color
    @Binding var isOn: Bool

    var body: some View {
        Button {
            isOn.toggle()
        } label: {
            HStack {
                Circle()
                    .fill(isOn ? color : color.opacity(0.3))
                    .frame(width: 14, height: 14)
                    .overlay(
                        Circle().stroke(color, lineWidth: 1.5)
                    )

                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(isOn ? color : .primary)
                    Text(subtitle)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }

                Spacer()

                Image(systemName: isOn ? "eye.fill" : "eye.slash")
                    .foregroundColor(isOn ? color : .secondary)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(isOn ? color.opacity(0.1) : Color(.systemGray6))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isOn ? color.opacity(0.4) : Color.clear, lineWidth: 1.5)
            )
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Human body shape

struct HumanBodyShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.width
        let h = rect.height
        let cx = w * 0.5

        // Head
        let headR: CGFloat = w * 0.08
        let headCY = h * 0.07
        path.addEllipse(in: CGRect(
            x: cx - headR, y: headCY - headR,
            width: headR * 2, height: headR * 2.2
        ))

        // Neck
        let neckTop = headCY + headR * 1.1
        let neckW: CGFloat = w * 0.035
        path.move(to: CGPoint(x: cx - neckW, y: neckTop))
        path.addLine(to: CGPoint(x: cx - neckW, y: neckTop + h * 0.03))
        path.move(to: CGPoint(x: cx + neckW, y: neckTop))
        path.addLine(to: CGPoint(x: cx + neckW, y: neckTop + h * 0.03))

        // Torso
        let shoulderY = h * 0.17
        let shoulderW = w * 0.22
        let waistY = h * 0.45
        let waistW = w * 0.13
        let hipY = h * 0.52
        let hipW = w * 0.16

        path.move(to: CGPoint(x: cx - shoulderW, y: shoulderY))
        // Left side down
        path.addCurve(
            to: CGPoint(x: cx - waistW, y: waistY),
            control1: CGPoint(x: cx - shoulderW, y: shoulderY + h * 0.1),
            control2: CGPoint(x: cx - waistW - w * 0.02, y: waistY - h * 0.05)
        )
        path.addCurve(
            to: CGPoint(x: cx - hipW, y: hipY),
            control1: CGPoint(x: cx - waistW + w * 0.01, y: waistY + h * 0.03),
            control2: CGPoint(x: cx - hipW, y: hipY - h * 0.02)
        )

        // Crotch
        let crotchY = h * 0.58
        path.addLine(to: CGPoint(x: cx - hipW, y: hipY))
        path.addCurve(
            to: CGPoint(x: cx, y: crotchY),
            control1: CGPoint(x: cx - hipW, y: crotchY),
            control2: CGPoint(x: cx - w * 0.03, y: crotchY)
        )
        path.addCurve(
            to: CGPoint(x: cx + hipW, y: hipY),
            control1: CGPoint(x: cx + w * 0.03, y: crotchY),
            control2: CGPoint(x: cx + hipW, y: crotchY)
        )

        // Right side up
        path.addCurve(
            to: CGPoint(x: cx + waistW, y: waistY),
            control1: CGPoint(x: cx + hipW, y: hipY - h * 0.02),
            control2: CGPoint(x: cx + waistW - w * 0.01, y: waistY + h * 0.03)
        )
        path.addCurve(
            to: CGPoint(x: cx + shoulderW, y: shoulderY),
            control1: CGPoint(x: cx + waistW + w * 0.02, y: waistY - h * 0.05),
            control2: CGPoint(x: cx + shoulderW, y: shoulderY + h * 0.1)
        )

        // Close top (shoulders)
        path.addLine(to: CGPoint(x: cx - shoulderW, y: shoulderY))

        // Left arm
        let armStartY = shoulderY + h * 0.01
        let armEndY = h * 0.50
        let armOutX = cx - shoulderW - w * 0.1
        let armW: CGFloat = w * 0.04
        path.move(to: CGPoint(x: cx - shoulderW, y: armStartY))
        path.addCurve(
            to: CGPoint(x: armOutX - armW, y: armEndY),
            control1: CGPoint(x: cx - shoulderW - w * 0.06, y: armStartY + h * 0.02),
            control2: CGPoint(x: armOutX - armW - w * 0.01, y: armEndY - h * 0.1)
        )
        path.addLine(to: CGPoint(x: armOutX + armW, y: armEndY))
        path.addCurve(
            to: CGPoint(x: cx - shoulderW + w * 0.02, y: armStartY + h * 0.02),
            control1: CGPoint(x: armOutX + armW + w * 0.01, y: armEndY - h * 0.1),
            control2: CGPoint(x: cx - shoulderW + w * 0.03, y: armStartY + h * 0.06)
        )

        // Right arm
        let rArmOutX = cx + shoulderW + w * 0.1
        path.move(to: CGPoint(x: cx + shoulderW, y: armStartY))
        path.addCurve(
            to: CGPoint(x: rArmOutX + armW, y: armEndY),
            control1: CGPoint(x: cx + shoulderW + w * 0.06, y: armStartY + h * 0.02),
            control2: CGPoint(x: rArmOutX + armW + w * 0.01, y: armEndY - h * 0.1)
        )
        path.addLine(to: CGPoint(x: rArmOutX - armW, y: armEndY))
        path.addCurve(
            to: CGPoint(x: cx + shoulderW - w * 0.02, y: armStartY + h * 0.02),
            control1: CGPoint(x: rArmOutX - armW - w * 0.01, y: armEndY - h * 0.1),
            control2: CGPoint(x: cx + shoulderW - w * 0.03, y: armStartY + h * 0.06)
        )

        // Left leg
        let legTopY = crotchY
        let legBotY = h * 0.93
        let lLegOutX = cx - hipW + w * 0.02
        let legW: CGFloat = w * 0.055
        path.move(to: CGPoint(x: cx - w * 0.03, y: legTopY))
        path.addCurve(
            to: CGPoint(x: lLegOutX - legW, y: legBotY),
            control1: CGPoint(x: cx - w * 0.06, y: legTopY + h * 0.1),
            control2: CGPoint(x: lLegOutX - legW, y: legBotY - h * 0.15)
        )
        path.addLine(to: CGPoint(x: lLegOutX + legW, y: legBotY))
        path.addCurve(
            to: CGPoint(x: cx - w * 0.01, y: legTopY + h * 0.02),
            control1: CGPoint(x: lLegOutX + legW, y: legBotY - h * 0.15),
            control2: CGPoint(x: cx - w * 0.02, y: legTopY + h * 0.1)
        )

        // Right leg
        let rLegOutX = cx + hipW - w * 0.02
        path.move(to: CGPoint(x: cx + w * 0.03, y: legTopY))
        path.addCurve(
            to: CGPoint(x: rLegOutX + legW, y: legBotY),
            control1: CGPoint(x: cx + w * 0.06, y: legTopY + h * 0.1),
            control2: CGPoint(x: rLegOutX + legW, y: legBotY - h * 0.15)
        )
        path.addLine(to: CGPoint(x: rLegOutX - legW, y: legBotY))
        path.addCurve(
            to: CGPoint(x: cx + w * 0.01, y: legTopY + h * 0.02),
            control1: CGPoint(x: rLegOutX - legW, y: legBotY - h * 0.15),
            control2: CGPoint(x: cx + w * 0.02, y: legTopY + h * 0.1)
        )

        return path
    }
}

// MARK: - Plane shapes

struct SagittalPlane: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let cx = rect.width * 0.5
        let planeW: CGFloat = 3
        path.addRect(CGRect(
            x: cx - planeW / 2,
            y: rect.height * 0.02,
            width: planeW,
            height: rect.height * 0.94
        ))
        return path
    }
}

struct FrontalPlane: Shape {
    func path(in rect: CGRect) -> Path {
        // Shown as an angled stripe to suggest depth (front/back)
        var path = Path()
        let w = rect.width
        let h = rect.height
        let offset: CGFloat = w * 0.12
        path.move(to: CGPoint(x: w * 0.15 + offset, y: h * 0.02))
        path.addLine(to: CGPoint(x: w * 0.85 + offset, y: h * 0.02))
        path.addLine(to: CGPoint(x: w * 0.85 - offset, y: h * 0.96))
        path.addLine(to: CGPoint(x: w * 0.15 - offset, y: h * 0.96))
        path.closeSubpath()
        return path
    }
}

struct TransversePlane: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.width
        let h = rect.height
        let cy = h * 0.38
        let planeH: CGFloat = 3
        path.addRect(CGRect(
            x: w * 0.05,
            y: cy - planeH / 2,
            width: w * 0.9,
            height: planeH
        ))
        return path
    }
}

#Preview {
    NavigationView {
        BodyPlanesView()
    }
}
