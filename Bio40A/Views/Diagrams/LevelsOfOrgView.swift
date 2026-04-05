import SwiftUI

struct OrgLevel: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    let definition: String
    let example: String
    let colorIndex: Int
}

private let levels: [OrgLevel] = [
    OrgLevel(name: "Organism", icon: "figure.stand",
             definition: "A complete living being made up of all organ systems working together.",
             example: "A human being", colorIndex: 7),
    OrgLevel(name: "Organ System", icon: "heart.text.square.fill",
             definition: "A group of organs that work together to perform a major function.",
             example: "Cardiovascular system (heart + blood vessels)", colorIndex: 6),
    OrgLevel(name: "Organ", icon: "heart.fill",
             definition: "A structure composed of two or more tissue types that performs a specific function.",
             example: "Heart, liver, stomach", colorIndex: 5),
    OrgLevel(name: "Tissue", icon: "square.grid.3x3.fill",
             definition: "A group of similar cells that work together to perform a common function.",
             example: "Muscle tissue, epithelial tissue", colorIndex: 4),
    OrgLevel(name: "Cell", icon: "circle.hexagongrid.fill",
             definition: "The smallest unit of life that can carry out all life functions.",
             example: "Red blood cell, neuron", colorIndex: 3),
    OrgLevel(name: "Organelle", icon: "circle.grid.2x1.fill",
             definition: "A specialized structure within a cell that performs a specific function.",
             example: "Mitochondria, nucleus, ribosome", colorIndex: 2),
    OrgLevel(name: "Molecule", icon: "atom",
             definition: "Two or more atoms bonded together.",
             example: "Water (H2O), DNA, glucose", colorIndex: 1),
    OrgLevel(name: "Atom", icon: "sparkle",
             definition: "The smallest unit of matter that retains the properties of an element.",
             example: "Carbon, hydrogen, oxygen", colorIndex: 0),
]

struct LevelsOfOrgView: View {
    @State private var expandedID: UUID?

    private func colorForIndex(_ index: Int) -> Color {
        let colors: [Color] = [
            .blue, .cyan, .teal, .green, .yellow, .orange, .red, .purple
        ]
        return colors[min(index, colors.count - 1)]
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Text("Tap a level to learn more")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 12)

                // Arrow at top
                Image(systemName: "arrow.up")
                    .font(.title3)
                    .foregroundColor(.purple)
                Text("Most complex")
                    .font(.caption2)
                    .foregroundColor(.purple)
                    .padding(.bottom, 8)

                ForEach(Array(levels.enumerated()), id: \.element.id) { index, level in
                    LevelCard(
                        level: level,
                        color: colorForIndex(level.colorIndex),
                        isExpanded: expandedID == level.id,
                        width: widthFraction(for: index, total: levels.count)
                    )
                    .onTapGesture {
                        withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                            if expandedID == level.id {
                                expandedID = nil
                            } else {
                                expandedID = level.id
                            }
                        }
                    }

                    if index < levels.count - 1 {
                        Image(systemName: "chevron.down")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .padding(.vertical, 2)
                    }
                }

                Text("Simplest")
                    .font(.caption2)
                    .foregroundColor(.blue)
                    .padding(.top, 8)
                Image(systemName: "arrow.down")
                    .font(.title3)
                    .foregroundColor(.blue)

                Spacer(minLength: 40)
            }
            .padding(.horizontal)
            .padding(.top)
        }
        .navigationTitle("Levels of Organization")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func widthFraction(for index: Int, total: Int) -> CGFloat {
        // Top level (organism) = widest, bottom (atom) = narrowest
        // index 0 = organism (wide), index 7 = atom (narrow)
        let minFrac: CGFloat = 0.5
        let maxFrac: CGFloat = 1.0
        let step = (maxFrac - minFrac) / CGFloat(total - 1)
        return maxFrac - step * CGFloat(index)
    }
}

struct LevelCard: View {
    let level: OrgLevel
    let color: Color
    let isExpanded: Bool
    let width: CGFloat

    var body: some View {
        GeometryReader { geo in
            let cardWidth = geo.size.width * width

            VStack(spacing: 6) {
                HStack(spacing: 10) {
                    Image(systemName: level.icon)
                        .font(.title3)
                        .foregroundColor(.white)
                        .frame(width: 30, height: 30)

                    Text(level.name)
                        .font(.headline)
                        .foregroundColor(.white)

                    Spacer()

                    Image(systemName: isExpanded ? "chevron.up" : "info.circle")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.8))
                }

                if isExpanded {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(level.definition)
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.95))

                        HStack(spacing: 6) {
                            Image(systemName: "star.fill")
                                .font(.caption)
                                .foregroundColor(.yellow)
                            Text("Example: \(level.example)")
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.9))
                        }
                    }
                    .transition(.opacity.combined(with: .move(edge: .top)))
                }
            }
            .padding(.horizontal, 14)
            .padding(.vertical, isExpanded ? 14 : 10)
            .frame(width: cardWidth)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(color.gradient)
                    .shadow(color: color.opacity(0.3), radius: isExpanded ? 6 : 2, y: 2)
            )
            .frame(width: geo.size.width) // center it
        }
        .frame(height: isExpanded ? 130 : 50)
    }
}

#Preview {
    NavigationView {
        LevelsOfOrgView()
    }
}
