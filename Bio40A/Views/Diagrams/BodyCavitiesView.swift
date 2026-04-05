import SwiftUI

struct CavityInfo: Identifiable {
    let id = UUID()
    let name: String
    let group: String // "Dorsal" or "Ventral"
    let color: Color
    let contents: String
}

private let cavities: [CavityInfo] = [
    CavityInfo(name: "Cranial Cavity", group: "Dorsal", color: .blue,
               contents: "Contains: Brain, meninges, cerebrospinal fluid"),
    CavityInfo(name: "Spinal Cavity", group: "Dorsal", color: .blue,
               contents: "Contains: Spinal cord, meninges, cerebrospinal fluid"),
    CavityInfo(name: "Thoracic Cavity", group: "Ventral", color: .green,
               contents: "Contains: Heart, lungs, esophagus, trachea, major blood vessels"),
    CavityInfo(name: "Abdominopelvic Cavity", group: "Ventral", color: .orange,
               contents: "Contains: Stomach, intestines, liver, kidneys, bladder, reproductive organs"),
]

struct BodyCavitiesView: View {
    @State private var selectedCavity: CavityInfo?

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Tap a cavity region to see its contents")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                // Body diagram with cavities
                ZStack {
                    CavityBodyOutline()
                        .stroke(Color.primary.opacity(0.5), lineWidth: 2)

                    // Cranial cavity
                    CranialRegion()
                        .fill(Color.blue.opacity(0.3))
                        .onTapGesture { selectedCavity = cavities[0] }
                    CranialRegion()
                        .stroke(Color.blue, lineWidth: 1)

                    // Spinal cavity
                    SpinalRegion()
                        .fill(Color.blue.opacity(0.25))
                        .onTapGesture { selectedCavity = cavities[1] }
                    SpinalRegion()
                        .stroke(Color.blue, lineWidth: 1)

                    // Thoracic cavity
                    ThoracicRegion()
                        .fill(Color.green.opacity(0.3))
                        .onTapGesture { selectedCavity = cavities[2] }
                    ThoracicRegion()
                        .stroke(Color.green, lineWidth: 1)

                    // Abdominopelvic cavity
                    AbdominopelvicRegion()
                        .fill(Color.orange.opacity(0.3))
                        .onTapGesture { selectedCavity = cavities[3] }
                    AbdominopelvicRegion()
                        .stroke(Color.orange, lineWidth: 1)

                    // Labels on diagram
                    GeometryReader { geo in
                        let w = geo.size.width
                        let h = geo.size.height

                        Text("Cranial")
                            .font(.caption2).bold()
                            .foregroundColor(.blue)
                            .position(x: w * 0.5, y: h * 0.075)

                        Text("Spinal")
                            .font(.caption2).bold()
                            .foregroundColor(.blue)
                            .position(x: w * 0.68, y: h * 0.3)

                        Text("Thoracic")
                            .font(.caption2).bold()
                            .foregroundColor(.green)
                            .position(x: w * 0.35, y: h * 0.27)

                        Text("Abdomino-\npelvic")
                            .font(.caption2).bold()
                            .foregroundColor(.orange)
                            .multilineTextAlignment(.center)
                            .position(x: w * 0.35, y: h * 0.47)
                    }
                }
                .frame(height: 420)
                .padding(.horizontal, 30)

                // Grouping legend
                VStack(spacing: 12) {
                    GroupingCard(
                        title: "Dorsal (Posterior) Cavity",
                        cavities: ["Cranial Cavity", "Spinal Cavity"],
                        color: .blue
                    )
                    GroupingCard(
                        title: "Ventral (Anterior) Cavity",
                        cavities: ["Thoracic Cavity", "Abdominopelvic Cavity"],
                        color: .green
                    )
                }
                .padding(.horizontal)

                Spacer(minLength: 40)
            }
            .padding(.top)
        }
        .navigationTitle("Body Cavities")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(item: $selectedCavity) { cavity in
            CavityDetailSheet(cavity: cavity)
                .presentationDetents([.height(220)])
        }
    }
}

struct GroupingCard: View {
    let title: String
    let cavities: [String]
    let color: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.subheadline).bold()
                .foregroundColor(color)
            ForEach(cavities, id: \.self) { name in
                HStack(spacing: 8) {
                    Circle().fill(color.opacity(0.5)).frame(width: 8, height: 8)
                    Text(name).font(.subheadline)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(color.opacity(0.08))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(color.opacity(0.2), lineWidth: 1)
        )
    }
}

struct CavityDetailSheet: View {
    let cavity: CavityInfo

    var body: some View {
        VStack(spacing: 16) {
            RoundedRectangle(cornerRadius: 3)
                .fill(Color.secondary.opacity(0.4))
                .frame(width: 40, height: 5)
                .padding(.top, 10)

            Text(cavity.name)
                .font(.title2).bold()
                .foregroundColor(cavity.color)

            Text("Group: \(cavity.group) Cavity")
                .font(.subheadline)
                .foregroundColor(.secondary)

            Text(cavity.contents)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Spacer()
        }
        .padding()
    }
}

// MARK: - Cavity Body Outline

struct CavityBodyOutline: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.width
        let h = rect.height
        let cx = w * 0.5

        // Side profile of torso for cavity view
        // Head
        let headR = w * 0.1
        let headCY = h * 0.07
        path.addEllipse(in: CGRect(
            x: cx - headR, y: headCY - headR,
            width: headR * 2, height: headR * 2.2
        ))

        // Torso outline (front profile)
        let shoulderY = h * 0.19
        let shoulderW = w * 0.24
        let hipY = h * 0.55
        let hipW = w * 0.18

        // Neck
        path.move(to: CGPoint(x: cx - w * 0.04, y: headCY + headR * 1.1))
        path.addLine(to: CGPoint(x: cx - w * 0.04, y: shoulderY))

        path.move(to: CGPoint(x: cx + w * 0.04, y: headCY + headR * 1.1))
        path.addLine(to: CGPoint(x: cx + w * 0.04, y: shoulderY))

        // Torso
        path.move(to: CGPoint(x: cx - shoulderW, y: shoulderY))
        path.addCurve(
            to: CGPoint(x: cx - hipW, y: hipY),
            control1: CGPoint(x: cx - shoulderW, y: h * 0.35),
            control2: CGPoint(x: cx - hipW, y: h * 0.45)
        )
        path.addLine(to: CGPoint(x: cx - hipW, y: h * 0.65))

        path.move(to: CGPoint(x: cx + shoulderW, y: shoulderY))
        path.addCurve(
            to: CGPoint(x: cx + hipW, y: hipY),
            control1: CGPoint(x: cx + shoulderW, y: h * 0.35),
            control2: CGPoint(x: cx + hipW, y: h * 0.45)
        )
        path.addLine(to: CGPoint(x: cx + hipW, y: h * 0.65))

        // Bottom
        path.move(to: CGPoint(x: cx - hipW, y: h * 0.65))
        path.addCurve(
            to: CGPoint(x: cx + hipW, y: h * 0.65),
            control1: CGPoint(x: cx - hipW * 0.5, y: h * 0.68),
            control2: CGPoint(x: cx + hipW * 0.5, y: h * 0.68)
        )

        return path
    }
}

// MARK: - Cavity Regions

struct CranialRegion: Shape {
    func path(in rect: CGRect) -> Path {
        let w = rect.width
        let h = rect.height
        let cx = w * 0.5
        let headR = w * 0.08
        let headCY = h * 0.07
        var path = Path()
        path.addEllipse(in: CGRect(
            x: cx - headR, y: headCY - headR * 0.7,
            width: headR * 2, height: headR * 1.8
        ))
        return path
    }
}

struct SpinalRegion: Shape {
    func path(in rect: CGRect) -> Path {
        let w = rect.width
        let h = rect.height
        let cx = w * 0.5
        var path = Path()
        let spineW: CGFloat = w * 0.025
        path.addRoundedRect(
            in: CGRect(x: cx - spineW, y: h * 0.1, width: spineW * 2, height: h * 0.52),
            cornerSize: CGSize(width: spineW, height: spineW)
        )
        return path
    }
}

struct ThoracicRegion: Shape {
    func path(in rect: CGRect) -> Path {
        let w = rect.width
        let h = rect.height
        let cx = w * 0.5
        var path = Path()
        // Rib cage area
        let topY = h * 0.2
        let botY = h * 0.37
        let halfW = w * 0.17
        path.move(to: CGPoint(x: cx - halfW * 0.6, y: topY))
        path.addCurve(
            to: CGPoint(x: cx - halfW, y: (topY + botY) / 2),
            control1: CGPoint(x: cx - halfW, y: topY),
            control2: CGPoint(x: cx - halfW, y: topY + (botY - topY) * 0.3)
        )
        path.addCurve(
            to: CGPoint(x: cx - halfW * 0.5, y: botY),
            control1: CGPoint(x: cx - halfW, y: (topY + botY) / 2 + (botY - topY) * 0.3),
            control2: CGPoint(x: cx - halfW * 0.7, y: botY)
        )
        path.addLine(to: CGPoint(x: cx + halfW * 0.5, y: botY))
        path.addCurve(
            to: CGPoint(x: cx + halfW, y: (topY + botY) / 2),
            control1: CGPoint(x: cx + halfW * 0.7, y: botY),
            control2: CGPoint(x: cx + halfW, y: (topY + botY) / 2 + (botY - topY) * 0.3)
        )
        path.addCurve(
            to: CGPoint(x: cx + halfW * 0.6, y: topY),
            control1: CGPoint(x: cx + halfW, y: topY + (botY - topY) * 0.3),
            control2: CGPoint(x: cx + halfW, y: topY)
        )
        path.closeSubpath()
        return path
    }
}

struct AbdominopelvicRegion: Shape {
    func path(in rect: CGRect) -> Path {
        let w = rect.width
        let h = rect.height
        let cx = w * 0.5
        var path = Path()
        let topY = h * 0.38
        let botY = h * 0.6
        let halfW = w * 0.16
        path.move(to: CGPoint(x: cx - halfW * 0.6, y: topY))
        path.addCurve(
            to: CGPoint(x: cx - halfW, y: (topY + botY) * 0.48),
            control1: CGPoint(x: cx - halfW * 0.8, y: topY),
            control2: CGPoint(x: cx - halfW, y: topY + (botY - topY) * 0.2)
        )
        path.addCurve(
            to: CGPoint(x: cx, y: botY),
            control1: CGPoint(x: cx - halfW, y: botY - (botY - topY) * 0.1),
            control2: CGPoint(x: cx - halfW * 0.4, y: botY)
        )
        path.addCurve(
            to: CGPoint(x: cx + halfW, y: (topY + botY) * 0.48),
            control1: CGPoint(x: cx + halfW * 0.4, y: botY),
            control2: CGPoint(x: cx + halfW, y: botY - (botY - topY) * 0.1)
        )
        path.addCurve(
            to: CGPoint(x: cx + halfW * 0.6, y: topY),
            control1: CGPoint(x: cx + halfW, y: topY + (botY - topY) * 0.2),
            control2: CGPoint(x: cx + halfW * 0.8, y: topY)
        )
        path.closeSubpath()
        return path
    }
}

#Preview {
    NavigationView {
        BodyCavitiesView()
    }
}
