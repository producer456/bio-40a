import SwiftUI

struct MatchingGameListView: View {
    @AppStorage("matchingBestTimes") private var bestTimesData: Data = Data()
    @State private var lockedAlertWeek: Int?
    @State private var showLockedAlert = false

    private var bestTimes: [String: TimeInterval] {
        (try? JSONDecoder().decode([String: TimeInterval].self, from: bestTimesData)) ?? [:]
    }

    private var groupedSets: [(String, [MatchingSet])] {
        let grouped = Dictionary(grouping: MatchingData.allSets) { $0.category }
        return grouped.sorted { $0.key < $1.key }
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(groupedSets, id: \.0) { category, sets in
                    Section {
                        ForEach(sets) { set in
                            let unlocked = ContentUnlockManager.isUnlocked(set.weekNumber)
                            if unlocked {
                                NavigationLink {
                                    MatchingGameView(matchingSet: set)
                                } label: {
                                    matchingSetRow(set, isLocked: false)
                                }
                            } else {
                                Button {
                                    lockedAlertWeek = set.weekNumber
                                    showLockedAlert = true
                                } label: {
                                    matchingSetRow(set, isLocked: true)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    } header: {
                        Text(category)
                    }
                }

                Section {
                    HStack {
                        Spacer()
                        VStack(spacing: 6) {
                            Image(systemName: "gamecontroller.fill")
                                .font(.title2)
                                .foregroundColor(.secondary.opacity(0.5))
                            Text("Tap a term, then tap its matching definition.")
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.center)
                            Text("Race the clock for your best time!")
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.center)
                        }
                        Spacer()
                    }
                    .listRowBackground(Color.clear)
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("Matching Games")
            .alert("Content Locked", isPresented: $showLockedAlert) {
                Button("OK", role: .cancel) {}
            } message: {
                if let week = lockedAlertWeek {
                    Text("This matching game unlocks in Week \(week) (\(ContentUnlockManager.unlockDateString(for: week)))")
                }
            }
        }
    }

    private func matchingSetRow(_ set: MatchingSet, isLocked: Bool) -> some View {
        HStack(spacing: 12) {
            Image(systemName: isLocked ? "lock.fill" : iconForCategory(set.category))
                .font(.title2)
                .foregroundColor(isLocked ? .gray : .blue)
                .frame(width: 36, alignment: .center)

            VStack(alignment: .leading, spacing: 3) {
                Text(set.title)
                    .font(.headline)
                    .foregroundColor(isLocked ? .secondary : .primary)

                HStack(spacing: 12) {
                    Label("\(set.pairCount) pairs", systemImage: "square.grid.2x2")
                        .font(.caption)
                        .foregroundColor(.secondary)

                    if !isLocked, let best = bestTimes[set.id] {
                        Label(formatTime(best), systemImage: "trophy.fill")
                            .font(.caption.weight(.medium))
                            .foregroundColor(.orange)
                    }
                }
            }

            Spacer()

            if isLocked {
                Image(systemName: "lock.fill")
                    .foregroundColor(.secondary)
                    .font(.subheadline)
            } else if bestTimes[set.id] != nil {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
                    .font(.subheadline)
            }
        }
        .padding(.vertical, 4)
        .opacity(isLocked ? 0.6 : 1.0)
    }

    private func iconForCategory(_ category: String) -> String {
        switch category {
        case "Anatomical Terminology": return "figure.stand"
        case "Chemistry": return "atom"
        default: return "gamecontroller.fill"
        }
    }

    private func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
}
