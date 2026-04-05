import SwiftUI

struct MatchingGameListView: View {
    @AppStorage("matchingBestTimes") private var bestTimesData: Data = Data()

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
                            NavigationLink {
                                MatchingGameView(matchingSet: set)
                            } label: {
                                matchingSetRow(set)
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
        }
    }

    private func matchingSetRow(_ set: MatchingSet) -> some View {
        HStack(spacing: 12) {
            Image(systemName: iconForCategory(set.category))
                .font(.title2)
                .foregroundColor(.blue)
                .frame(width: 36, alignment: .center)

            VStack(alignment: .leading, spacing: 3) {
                Text(set.title)
                    .font(.headline)

                HStack(spacing: 12) {
                    Label("\(set.pairCount) pairs", systemImage: "square.grid.2x2")
                        .font(.caption)
                        .foregroundColor(.secondary)

                    if let best = bestTimes[set.id] {
                        Label(formatTime(best), systemImage: "trophy.fill")
                            .font(.caption.weight(.medium))
                            .foregroundColor(.orange)
                    }
                }
            }

            Spacer()

            if bestTimes[set.id] != nil {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
                    .font(.subheadline)
            }
        }
        .padding(.vertical, 4)
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
