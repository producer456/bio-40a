import SwiftUI

struct CompareListView: View {
    @State private var lockedAlertWeek: Int?
    @State private var showLockedAlert = false

    private var groupedCards: [(week: Int, cards: [CompareCard])] {
        let grouped = Dictionary(grouping: CompareData.allCards) { $0.weekNumber }
        return grouped.keys.sorted().map { week in
            (week: week, cards: grouped[week]!)
        }
    }

    var body: some View {
        List {
            ForEach(groupedCards, id: \.week) { group in
                Section {
                    let unlocked = ContentUnlockManager.isUnlocked(group.week)
                    let weekCards = group.cards

                    ForEach(weekCards) { card in
                        if unlocked {
                            NavigationLink {
                                CompareCardView(
                                    cards: weekCards,
                                    startIndex: weekCards.firstIndex(where: { $0.id == card.id }) ?? 0
                                )
                            } label: {
                                CompareCardRow(card: card, isLocked: false)
                            }
                        } else {
                            Button {
                                lockedAlertWeek = group.week
                                showLockedAlert = true
                            } label: {
                                CompareCardRow(card: card, isLocked: true)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                } header: {
                    let weekLabel: String = {
                        // Group weeks into pairs for display
                        let w = group.week
                        if w <= 2 { return "Weeks 1-2" }
                        if w <= 4 { return "Weeks 3-4" }
                        if w <= 6 { return "Weeks 5-6" }
                        if w <= 8 { return "Weeks 7-8" }
                        if w <= 10 { return "Weeks 9-10" }
                        return "Week 11"
                    }()
                    Text(weekLabel)
                }
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle("Compare & Contrast")
        .alert("Content Locked", isPresented: $showLockedAlert) {
            Button("OK", role: .cancel) {}
        } message: {
            if let week = lockedAlertWeek {
                Text("This content unlocks in Week \(week) (\(ContentUnlockManager.unlockDateString(for: week)))")
            }
        }
    }
}

// MARK: - Row View

struct CompareCardRow: View {
    let card: CompareCard
    var isLocked: Bool = false

    var body: some View {
        HStack(spacing: 14) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(isLocked ? Color.gray.opacity(0.15) : Color.indigo.opacity(0.15))
                    .frame(width: 48, height: 48)

                Image(systemName: isLocked ? "lock.fill" : "arrow.left.arrow.right")
                    .font(.title3)
                    .foregroundColor(isLocked ? .gray : .indigo)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(card.title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(isLocked ? .secondary : .primary)

                Text("\(card.categories.count) comparison points")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()

            if isLocked {
                Image(systemName: "lock.fill")
                    .foregroundColor(.secondary)
                    .font(.caption)
            } else {
                Image(systemName: "chevron.right")
                    .foregroundColor(.secondary)
                    .font(.caption)
            }
        }
        .padding(.vertical, 6)
        .opacity(isLocked ? 0.6 : 1.0)
    }
}

#Preview {
    NavigationStack {
        CompareListView()
    }
}
