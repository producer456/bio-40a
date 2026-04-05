import SwiftUI

struct AssignmentListView: View {
    var embedded: Bool = false
    @EnvironmentObject var progress: ProgressManager
    @State private var selectedFilter: AssignmentFilter = .all

    enum AssignmentFilter: String, CaseIterable {
        case all = "All"
        case preLecture = "Pre-lecture"
        case homework = "Homework"
        case quiz = "Quiz"
        case midterm = "Midterm"

        var assignmentType: Assignment.AssignmentType? {
            switch self {
            case .all: return nil
            case .preLecture: return .preLecture
            case .homework: return .homework
            case .quiz: return .quiz
            case .midterm: return .midterm
            }
        }
    }

    private var filteredAssignments: [Assignment] {
        let all = AssignmentData.allAssignments
        if let type = selectedFilter.assignmentType {
            return all.filter { $0.type == type }
        }
        return all
    }

    private var groupedByWeek: [(weekNumber: Int, assignments: [Assignment])] {
        let sorted = filteredAssignments.sorted { $0.dueDate < $1.dueDate }
        let grouped = Dictionary(grouping: sorted, by: \.weekNumber)
        return grouped.keys.sorted().map { week in
            (weekNumber: week, assignments: grouped[week]!)
        }
    }

    private var content: some View {
        VStack(spacing: 0) {
            filterBar
            assignmentList
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Assignments")
    }

    var body: some View {
        if embedded {
            NavigationStack {
                content
            }
        } else {
            content
        }
    }

    // MARK: - Filter Bar

    private var filterBar: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(AssignmentFilter.allCases, id: \.self) { filter in
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            selectedFilter = filter
                        }
                    } label: {
                        Text(filter.rawValue)
                            .font(.subheadline)
                            .fontWeight(selectedFilter == filter ? .semibold : .regular)
                            .padding(.horizontal, 14)
                            .padding(.vertical, 7)
                            .background(
                                Capsule()
                                    .fill(selectedFilter == filter ? Color.blue : Color(.systemGray5))
                            )
                            .foregroundColor(selectedFilter == filter ? .white : .primary)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
        }
        .background(Color(.systemBackground))
    }

    // MARK: - Assignment List

    private var assignmentList: some View {
        ScrollView {
            LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
                ForEach(groupedByWeek, id: \.weekNumber) { group in
                    Section {
                        ForEach(group.assignments) { assignment in
                            AssignmentRow(
                                assignment: assignment,
                                isComplete: progress.isAssignmentComplete(assignment.id)
                            ) {
                                progress.toggleAssignment(assignment.id)
                            }
                        }
                    } header: {
                        weekHeader(group.weekNumber)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
        }
    }

    private func weekHeader(_ weekNumber: Int) -> some View {
        HStack {
            Text("Week \(weekNumber)")
                .font(.headline)
                .foregroundColor(.primary)
            Spacer()
            let weekAssignments = filteredAssignments.filter { $0.weekNumber == weekNumber }
            let completedCount = weekAssignments.filter { progress.isAssignmentComplete($0.id) }.count
            Text("\(completedCount)/\(weekAssignments.count)")
                .font(.caption)
                .foregroundColor(.secondary)
                .padding(.horizontal, 8)
                .padding(.vertical, 3)
                .background(Capsule().fill(Color(.systemGray5)))
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 4)
        .background(Color(.systemGroupedBackground))
    }
}

// MARK: - Assignment Row

struct AssignmentRow: View {
    let assignment: Assignment
    let isComplete: Bool
    let onToggle: () -> Void

    private var typeColor: Color {
        switch assignment.type.color {
        case "blue": return .blue
        case "purple": return .purple
        case "green": return .green
        case "red": return .red
        case "orange": return .orange
        default: return .gray
        }
    }

    var body: some View {
        HStack(spacing: 12) {
            // Completion toggle
            Button(action: onToggle) {
                Image(systemName: isComplete ? "checkmark.circle.fill" : "circle")
                    .font(.title3)
                    .foregroundColor(isComplete ? .green : .gray)
            }
            .buttonStyle(.plain)

            // Type icon
            Image(systemName: assignment.type.icon)
                .font(.body)
                .foregroundColor(typeColor)
                .frame(width: 28)

            // Content
            VStack(alignment: .leading, spacing: 3) {
                HStack(spacing: 6) {
                    Text(assignment.code)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(isComplete ? .secondary : .primary)
                        .strikethrough(isComplete)

                    if assignment.isDueToday && !isComplete {
                        dueBadge("Due today", color: .orange)
                    } else if assignment.isDueTomorrow && !isComplete {
                        dueBadge("Due tomorrow", color: .yellow)
                    }
                }

                Text(assignment.title)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(1)

                HStack(spacing: 10) {
                    Text(assignment.dueDateFormatted)
                        .font(.caption2)
                        .foregroundColor(
                            assignment.isPastDue && !isComplete ? .red : .secondary
                        )

                    Text("\(assignment.points) pts")
                        .font(.caption2)
                        .foregroundColor(.secondary)

                    if !isComplete {
                        Text(assignment.dueLabel)
                            .font(.caption2)
                            .fontWeight(.medium)
                            .foregroundColor(
                                assignment.isPastDue ? .red :
                                assignment.isDueToday ? .orange :
                                assignment.isDueTomorrow ? .yellow : .blue
                            )
                    }
                }
            }

            Spacer()
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(
                    assignment.isPastDue && !isComplete
                        ? Color.red.opacity(0.06)
                        : Color(.systemBackground)
                )
                .shadow(color: .black.opacity(0.04), radius: 4, y: 1)
        )
        .padding(.vertical, 3)
        .opacity(isComplete ? 0.7 : 1.0)
    }

    private func dueBadge(_ text: String, color: Color) -> some View {
        Text(text)
            .font(.system(size: 9, weight: .bold))
            .textCase(.uppercase)
            .padding(.horizontal, 6)
            .padding(.vertical, 2)
            .background(Capsule().fill(color.opacity(0.2)))
            .foregroundColor(color)
    }
}

// MARK: - Due Soon Section (for HomeView)

struct DueSoonSection: View {
    @EnvironmentObject var progress: ProgressManager

    private var upcomingAssignments: [Assignment] {
        let now = Date()
        return AssignmentData.allAssignments
            .filter { $0.dueDate >= now && !progress.isAssignmentComplete($0.id) }
            .sorted { $0.dueDate < $1.dueDate }
            .prefix(3)
            .map { $0 }
    }

    var body: some View {
        if !upcomingAssignments.isEmpty {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("Due Soon")
                        .font(.headline)
                    Spacer()
                    NavigationLink {
                        AssignmentListView()
                    } label: {
                        Text("See All")
                            .font(.caption)
                            .foregroundColor(.blue)
                    }
                }

                ForEach(upcomingAssignments) { assignment in
                    DueSoonRow(assignment: assignment, isComplete: progress.isAssignmentComplete(assignment.id)) {
                        progress.toggleAssignment(assignment.id)
                    }
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .shadow(color: .black.opacity(0.05), radius: 8, y: 2)
            )
        }
    }
}

struct DueSoonRow: View {
    let assignment: Assignment
    let isComplete: Bool
    let onToggle: () -> Void

    private var typeColor: Color {
        switch assignment.type.color {
        case "blue": return .blue
        case "purple": return .purple
        case "green": return .green
        case "red": return .red
        case "orange": return .orange
        default: return .gray
        }
    }

    var body: some View {
        HStack(spacing: 10) {
            Button(action: onToggle) {
                Image(systemName: isComplete ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(isComplete ? .green : .gray)
            }
            .buttonStyle(.plain)

            Image(systemName: assignment.type.icon)
                .foregroundColor(typeColor)
                .frame(width: 24)

            VStack(alignment: .leading, spacing: 2) {
                Text(assignment.code)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .strikethrough(isComplete)

                Text(assignment.dueDateFormatted)
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }

            Spacer()

            if assignment.isDueToday {
                Text("TODAY")
                    .font(.system(size: 9, weight: .bold))
                    .padding(.horizontal, 6)
                    .padding(.vertical, 2)
                    .background(Capsule().fill(Color.orange.opacity(0.2)))
                    .foregroundColor(.orange)
            } else if assignment.isDueTomorrow {
                Text("TOMORROW")
                    .font(.system(size: 9, weight: .bold))
                    .padding(.horizontal, 6)
                    .padding(.vertical, 2)
                    .background(Capsule().fill(Color.yellow.opacity(0.2)))
                    .foregroundColor(.yellow)
            } else {
                Text(assignment.dueLabel)
                    .font(.caption2)
                    .foregroundColor(.blue)
            }
        }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.systemGray6))
        )
    }
}

#Preview {
    AssignmentListView()
        .environmentObject(ProgressManager())
}
