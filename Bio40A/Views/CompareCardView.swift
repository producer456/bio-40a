import SwiftUI

struct CompareCardView: View {
    let cards: [CompareCard]
    let startIndex: Int

    @State private var currentIndex: Int = 0
    @State private var revealedSide: RevealSide = .both
    @Environment(\.dismiss) private var dismiss

    enum RevealSide: String, CaseIterable {
        case both = "Show Both"
        case hideB = "Hide Right"
        case hideA = "Hide Left"
    }

    init(cards: [CompareCard], startIndex: Int = 0) {
        self.cards = cards
        self.startIndex = startIndex
        _currentIndex = State(initialValue: startIndex)
    }

    var body: some View {
        VStack(spacing: 0) {
            // Mode picker
            Picker("Reveal Mode", selection: $revealedSide) {
                ForEach(RevealSide.allCases, id: \.self) { side in
                    Text(side.rawValue).tag(side)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            .padding(.top, 8)

            // Card pager
            TabView(selection: $currentIndex) {
                ForEach(Array(cards.enumerated()), id: \.element.id) { index, card in
                    ScrollView {
                        compareCardContent(card: card)
                            .padding()
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .automatic))

            // Card counter
            Text("\(currentIndex + 1) of \(cards.count)")
                .font(.caption)
                .foregroundColor(.secondary)
                .padding(.bottom, 8)
        }
        .navigationTitle(cards.indices.contains(currentIndex) ? cards[currentIndex].title : "Compare")
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Card Content

    @ViewBuilder
    private func compareCardContent(card: CompareCard) -> some View {
        VStack(spacing: 0) {
            // Header row with item names
            headerRow(card: card)

            // Category rows
            ForEach(Array(card.categories.enumerated()), id: \.element.id) { index, category in
                categoryRow(category: category, isEven: index % 2 == 0)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(.systemGray4), lineWidth: 1)
        )
    }

    private func headerRow(card: CompareCard) -> some View {
        HStack(spacing: 0) {
            // Item A header
            Text(card.itemA.name)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .padding(.horizontal, 8)
                .background(colorForName(card.itemA.color))

            // Item B header
            Text(card.itemB.name)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .padding(.horizontal, 8)
                .background(colorForName(card.itemB.color))
        }
    }

    private func categoryRow(category: CompareCategory, isEven: Bool) -> some View {
        VStack(spacing: 0) {
            // Category label
            Text(category.label)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 6)
                .background(Color(.systemGray5))

            // Values
            HStack(alignment: .top, spacing: 0) {
                // Value A
                valueCell(
                    text: category.valueA,
                    isHidden: revealedSide == .hideA,
                    tintColor: .blue.opacity(0.05),
                    side: .hideA
                )

                Divider()

                // Value B
                valueCell(
                    text: category.valueB,
                    isHidden: revealedSide == .hideB,
                    tintColor: .orange.opacity(0.05),
                    side: .hideB
                )
            }
            .background(isEven ? Color(.systemBackground) : Color(.secondarySystemBackground))

            Divider()
        }
    }

    @ViewBuilder
    private func valueCell(text: String, isHidden: Bool, tintColor: Color, side: RevealSide) -> some View {
        ZStack {
            tintColor

            if isHidden {
                Button {
                    withAnimation(.easeInOut(duration: 0.25)) {
                        revealedSide = .both
                    }
                } label: {
                    VStack(spacing: 4) {
                        Image(systemName: "eye.slash.fill")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Text("Tap to reveal")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity, minHeight: 44)
                }
                .buttonStyle(.plain)
            } else {
                Text(text)
                    .font(.caption)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity, minHeight: 44)
            }
        }
        .frame(maxWidth: .infinity)
    }

    // MARK: - Color Helper

    private func colorForName(_ name: String) -> Color {
        switch name.lowercased() {
        case "blue": return .blue
        case "orange": return .orange
        case "green": return .green
        case "red": return .red
        case "purple": return .purple
        default: return .gray
        }
    }
}

#Preview {
    NavigationStack {
        CompareCardView(cards: CompareData.cardsWeeks1_2)
    }
}
