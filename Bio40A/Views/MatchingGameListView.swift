import SwiftUI

struct MatchingGameListView: View {
    @AppStorage("matchingBestTimes") private var bestTimesData: Data = Data()
    @State private var lockedAlertWeek: Int?
    @State private var showLockedAlert = false

    private var bestTimes: [String: TimeInterval] {
        (try? JSONDecoder().decode([String: TimeInterval].self, from: bestTimesData)) ?? [:]
    }

    private var groupedMatchingSets: [(String, [MatchingSet])] {
        let grouped = Dictionary(grouping: MatchingData.allSets) { $0.category }
        return grouped.sorted { $0.key < $1.key }
    }

    var body: some View {
        NavigationStack {
            List {
                // MARK: - Matching Games Section
                Section {
                    ForEach(groupedMatchingSets, id: \.0) { category, sets in
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
                    }
                } header: {
                    Label("Matching", systemImage: "square.grid.2x2")
                        .font(.subheadline.weight(.semibold))
                } footer: {
                    Text("Tap a term, then tap its matching definition.")
                        .font(.caption)
                }

                // MARK: - Fill in the Blank Section
                Section {
                    let fibWeeks = Set(FillInBlankData.allQuestions.map { $0.weekNumber }).sorted()
                    // All weeks option
                    let allUnlocked = fibWeeks.allSatisfy { ContentUnlockManager.isUnlocked($0) }
                    if allUnlocked || fibWeeks.contains(where: { ContentUnlockManager.isUnlocked($0) }) {
                        NavigationLink {
                            FillInBlankView(weekFilter: nil)
                        } label: {
                            gameRow(
                                icon: "pencil.line",
                                title: "All Topics",
                                subtitle: "\(FillInBlankData.allQuestions.count) questions",
                                color: .purple,
                                isLocked: false
                            )
                        }
                    }

                    ForEach(fibWeeks, id: \.self) { week in
                        let unlocked = ContentUnlockManager.isUnlocked(week)
                        let count = FillInBlankData.allQuestions.filter { $0.weekNumber == week }.count
                        if unlocked {
                            NavigationLink {
                                FillInBlankView(weekFilter: week)
                            } label: {
                                gameRow(
                                    icon: "pencil.line",
                                    title: "Week \(week)",
                                    subtitle: "\(count) questions",
                                    color: .purple,
                                    isLocked: false
                                )
                            }
                        } else {
                            Button {
                                lockedAlertWeek = week
                                showLockedAlert = true
                            } label: {
                                gameRow(
                                    icon: "lock.fill",
                                    title: "Week \(week)",
                                    subtitle: "\(count) questions",
                                    color: .gray,
                                    isLocked: true
                                )
                            }
                            .buttonStyle(.plain)
                        }
                    }
                } header: {
                    Label("Fill in the Blank", systemImage: "pencil.line")
                        .font(.subheadline.weight(.semibold))
                } footer: {
                    Text("Type the missing word to complete each statement.")
                        .font(.caption)
                }

                // MARK: - True or False Section
                Section {
                    let tfWeeks = Set(TrueFalseData.allStatements.map { $0.weekNumber }).sorted()

                    NavigationLink {
                        TrueFalseGameView(weekFilter: nil)
                    } label: {
                        gameRow(
                            icon: "hand.thumbsup.fill",
                            title: "All Topics",
                            subtitle: "\(TrueFalseData.allStatements.count) statements",
                            color: .orange,
                            isLocked: false
                        )
                    }

                    ForEach(tfWeeks, id: \.self) { week in
                        let unlocked = ContentUnlockManager.isUnlocked(week)
                        let count = TrueFalseData.allStatements.filter { $0.weekNumber == week }.count
                        if unlocked {
                            NavigationLink {
                                TrueFalseGameView(weekFilter: week)
                            } label: {
                                gameRow(
                                    icon: "hand.thumbsup.fill",
                                    title: "Week \(week)",
                                    subtitle: "\(count) statements",
                                    color: .orange,
                                    isLocked: false
                                )
                            }
                        } else {
                            Button {
                                lockedAlertWeek = week
                                showLockedAlert = true
                            } label: {
                                gameRow(
                                    icon: "lock.fill",
                                    title: "Week \(week)",
                                    subtitle: "\(count) statements",
                                    color: .gray,
                                    isLocked: true
                                )
                            }
                            .buttonStyle(.plain)
                        }
                    }
                } header: {
                    Label("True or False", systemImage: "hand.thumbsup.fill")
                        .font(.subheadline.weight(.semibold))
                } footer: {
                    Text("Swipe or tap to answer. 5-second timer per question!")
                        .font(.caption)
                }

                // MARK: - Category Sort Section
                Section {
                    ForEach(CategorySortData.allSets) { sortSet in
                        let unlocked = ContentUnlockManager.isUnlocked(sortSet.weekNumber)
                        if unlocked {
                            NavigationLink {
                                CategorySortView(sortSet: sortSet)
                            } label: {
                                gameRow(
                                    icon: "tray.2.fill",
                                    title: sortSet.title,
                                    subtitle: "\(sortSet.items.count) items \u{2022} \(sortSet.categories.count) categories",
                                    color: .teal,
                                    isLocked: false
                                )
                            }
                        } else {
                            Button {
                                lockedAlertWeek = sortSet.weekNumber
                                showLockedAlert = true
                            } label: {
                                gameRow(
                                    icon: "lock.fill",
                                    title: sortSet.title,
                                    subtitle: "\(sortSet.items.count) items \u{2022} \(sortSet.categories.count) categories",
                                    color: .gray,
                                    isLocked: true
                                )
                            }
                            .buttonStyle(.plain)
                        }
                    }
                } header: {
                    Label("Category Sort", systemImage: "tray.2.fill")
                        .font(.subheadline.weight(.semibold))
                } footer: {
                    Text("Sort items into the correct category as fast as you can.")
                        .font(.caption)
                }
            }
            .navigationTitle("Study Games")
            .alert("Content Locked", isPresented: $showLockedAlert) {
                Button("OK", role: .cancel) {}
            } message: {
                if let week = lockedAlertWeek {
                    Text("This game unlocks in Week \(week) (\(ContentUnlockManager.unlockDateString(for: week)))")
                }
            }
        }
    }

    // MARK: - Row Builders

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

    private func gameRow(icon: String, title: String, subtitle: String, color: Color, isLocked: Bool) -> some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(isLocked ? .gray : color)
                .frame(width: 36, alignment: .center)

            VStack(alignment: .leading, spacing: 3) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(isLocked ? .secondary : .primary)
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()

            if isLocked {
                Image(systemName: "lock.fill")
                    .foregroundColor(.secondary)
                    .font(.subheadline)
            }
        }
        .padding(.vertical, 4)
        .opacity(isLocked ? 0.6 : 1.0)
    }

    // MARK: - Helpers

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
