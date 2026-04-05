import Foundation

struct AssignmentData {
    /// Helper to build a Date in 2026 at a specific time.
    private static func date(_ month: Int, _ day: Int, hour: Int = 23, minute: Int = 59) -> Date {
        var comps = DateComponents()
        comps.year = 2026
        comps.month = month
        comps.day = day
        comps.hour = hour
        comps.minute = minute
        comps.second = 0
        comps.timeZone = TimeZone.current
        return Calendar.current.date(from: comps)!
    }

    /// Noon shorthand (pre-lecture deadlines are typically noon)
    private static func noon(_ month: Int, _ day: Int) -> Date {
        date(month, day, hour: 12, minute: 0)
    }

    /// End of class shorthand for lecture activities
    private static func classTime(_ month: Int, _ day: Int) -> Date {
        date(month, day, hour: 14, minute: 50)
    }

    static let allAssignments: [Assignment] = [
        // ============================================================
        // WEEK 1 — Apr 6–10, 2026
        // ============================================================
        Assignment(id: "la1m", code: "LA1m", title: "Lecture Activity 1 (Mon)", type: .lectureActivity,
                   dueDate: classTime(4, 6), weekNumber: 1, points: 2),
        Assignment(id: "p1", code: "P1", title: "Pre-lecture Work 1", type: .preLecture,
                   dueDate: noon(4, 8), weekNumber: 1, points: 5),
        Assignment(id: "la1w", code: "LA1w", title: "Lecture Activity 1 (Wed)", type: .lectureActivity,
                   dueDate: classTime(4, 8), weekNumber: 1, points: 2),
        Assignment(id: "h1", code: "H1", title: "Homework 1", type: .homework,
                   dueDate: date(4, 12), weekNumber: 1, points: 10),

        // ============================================================
        // WEEK 2 — Apr 13–17, 2026
        // ============================================================
        Assignment(id: "p2", code: "P2", title: "Pre-lecture Work 2", type: .preLecture,
                   dueDate: noon(4, 13), weekNumber: 2, points: 5),
        Assignment(id: "la2m", code: "LA2m", title: "Lecture Activity 2 (Mon)", type: .lectureActivity,
                   dueDate: classTime(4, 13), weekNumber: 2, points: 2),
        Assignment(id: "q1", code: "Q1", title: "Quiz 1", type: .quiz,
                   dueDate: classTime(4, 15), weekNumber: 2, points: 20),
        Assignment(id: "la2w", code: "LA2w", title: "Lecture Activity 2 (Wed)", type: .lectureActivity,
                   dueDate: classTime(4, 15), weekNumber: 2, points: 2),
        Assignment(id: "h2", code: "H2", title: "Homework 2", type: .homework,
                   dueDate: date(4, 19), weekNumber: 2, points: 10),

        // ============================================================
        // WEEK 3 — Apr 20–24, 2026
        // ============================================================
        Assignment(id: "p3", code: "P3", title: "Pre-lecture Work 3", type: .preLecture,
                   dueDate: noon(4, 20), weekNumber: 3, points: 5),
        Assignment(id: "la3m", code: "LA3m", title: "Lecture Activity 3 (Mon)", type: .lectureActivity,
                   dueDate: classTime(4, 20), weekNumber: 3, points: 2),
        Assignment(id: "q2", code: "Q2", title: "Quiz 2", type: .quiz,
                   dueDate: classTime(4, 22), weekNumber: 3, points: 20),
        Assignment(id: "la3w", code: "LA3w", title: "Lecture Activity 3 (Wed)", type: .lectureActivity,
                   dueDate: classTime(4, 22), weekNumber: 3, points: 2),
        Assignment(id: "h3", code: "H3", title: "Homework 3", type: .homework,
                   dueDate: date(4, 26), weekNumber: 3, points: 10),

        // ============================================================
        // WEEK 4 — Apr 27–May 1, 2026
        // ============================================================
        Assignment(id: "p4", code: "P4", title: "Pre-lecture Work 4", type: .preLecture,
                   dueDate: noon(4, 27), weekNumber: 4, points: 5),
        Assignment(id: "mt1", code: "MT1", title: "Midterm 1", type: .midterm,
                   dueDate: classTime(4, 27), weekNumber: 4, points: 100),
        Assignment(id: "la4w", code: "LA4w", title: "Lecture Activity 4 (Wed)", type: .lectureActivity,
                   dueDate: classTime(4, 29), weekNumber: 4, points: 2),
        Assignment(id: "h4", code: "H4", title: "Homework 4", type: .homework,
                   dueDate: date(5, 3), weekNumber: 4, points: 10),

        // ============================================================
        // WEEK 5 — May 4–8, 2026
        // ============================================================
        Assignment(id: "p5", code: "P5", title: "Pre-lecture Work 5", type: .preLecture,
                   dueDate: noon(5, 4), weekNumber: 5, points: 5),
        Assignment(id: "la5m", code: "LA5m", title: "Lecture Activity 5 (Mon)", type: .lectureActivity,
                   dueDate: classTime(5, 4), weekNumber: 5, points: 2),
        Assignment(id: "q3", code: "Q3", title: "Quiz 3", type: .quiz,
                   dueDate: classTime(5, 6), weekNumber: 5, points: 20),
        Assignment(id: "la5w", code: "LA5w", title: "Lecture Activity 5 (Wed)", type: .lectureActivity,
                   dueDate: classTime(5, 6), weekNumber: 5, points: 2),
        Assignment(id: "h5", code: "H5", title: "Homework 5", type: .homework,
                   dueDate: date(5, 10), weekNumber: 5, points: 10),

        // ============================================================
        // WEEK 6 — May 11–15, 2026
        // ============================================================
        Assignment(id: "p6", code: "P6", title: "Pre-lecture Work 6", type: .preLecture,
                   dueDate: noon(5, 11), weekNumber: 6, points: 5),
        Assignment(id: "la6m", code: "LA6m", title: "Lecture Activity 6 (Mon)", type: .lectureActivity,
                   dueDate: classTime(5, 11), weekNumber: 6, points: 2),
        Assignment(id: "q4", code: "Q4", title: "Quiz 4", type: .quiz,
                   dueDate: classTime(5, 13), weekNumber: 6, points: 20),
        Assignment(id: "la6w", code: "LA6w", title: "Lecture Activity 6 (Wed)", type: .lectureActivity,
                   dueDate: classTime(5, 13), weekNumber: 6, points: 2),
        Assignment(id: "h6", code: "H6", title: "Homework 6", type: .homework,
                   dueDate: date(5, 17), weekNumber: 6, points: 10),

        // ============================================================
        // WEEK 7 — May 18–22, 2026
        // ============================================================
        Assignment(id: "p7", code: "P7", title: "Pre-lecture Work 7", type: .preLecture,
                   dueDate: noon(5, 18), weekNumber: 7, points: 5),
        Assignment(id: "la7m", code: "LA7m", title: "Lecture Activity 7 (Mon)", type: .lectureActivity,
                   dueDate: classTime(5, 18), weekNumber: 7, points: 2),
        Assignment(id: "mt2", code: "MT2", title: "Midterm 2", type: .midterm,
                   dueDate: classTime(5, 20), weekNumber: 7, points: 100),
        Assignment(id: "h7", code: "H7", title: "Homework 7", type: .homework,
                   dueDate: date(5, 24), weekNumber: 7, points: 10),

        // ============================================================
        // WEEK 8 — May 25–29, 2026 (Mon 5/25 = Memorial Day holiday)
        // ============================================================
        Assignment(id: "p8", code: "P8", title: "Pre-lecture Work 8", type: .preLecture,
                   dueDate: noon(5, 27), weekNumber: 8, points: 5),
        Assignment(id: "la8w", code: "LA8w", title: "Lecture Activity 8 (Wed)", type: .lectureActivity,
                   dueDate: classTime(5, 27), weekNumber: 8, points: 2),
        Assignment(id: "h8", code: "H8", title: "Homework 8", type: .homework,
                   dueDate: date(5, 31), weekNumber: 8, points: 10),

        // ============================================================
        // WEEK 9 — Jun 1–5, 2026
        // ============================================================
        Assignment(id: "p9", code: "P9", title: "Pre-lecture Work 9", type: .preLecture,
                   dueDate: noon(6, 1), weekNumber: 9, points: 5),
        Assignment(id: "la9m", code: "LA9m", title: "Lecture Activity 9 (Mon)", type: .lectureActivity,
                   dueDate: classTime(6, 1), weekNumber: 9, points: 2),
        Assignment(id: "q5", code: "Q5", title: "Quiz 5", type: .quiz,
                   dueDate: classTime(6, 3), weekNumber: 9, points: 20),
        Assignment(id: "la9w", code: "LA9w", title: "Lecture Activity 9 (Wed)", type: .lectureActivity,
                   dueDate: classTime(6, 3), weekNumber: 9, points: 2),
        Assignment(id: "h9", code: "H9", title: "Homework 9", type: .homework,
                   dueDate: date(6, 7), weekNumber: 9, points: 10),

        // ============================================================
        // WEEK 10 — Jun 8–12, 2026
        // ============================================================
        Assignment(id: "p10", code: "P10", title: "Pre-lecture Work 10", type: .preLecture,
                   dueDate: noon(6, 8), weekNumber: 10, points: 5),
        Assignment(id: "la10m", code: "LA10m", title: "Lecture Activity 10 (Mon)", type: .lectureActivity,
                   dueDate: classTime(6, 8), weekNumber: 10, points: 2),
        Assignment(id: "q6", code: "Q6", title: "Quiz 6", type: .quiz,
                   dueDate: classTime(6, 10), weekNumber: 10, points: 20),
        Assignment(id: "la10w", code: "LA10w", title: "Lecture Activity 10 (Wed)", type: .lectureActivity,
                   dueDate: classTime(6, 10), weekNumber: 10, points: 2),
        Assignment(id: "h10", code: "H10", title: "Homework 10", type: .homework,
                   dueDate: date(6, 14), weekNumber: 10, points: 10),

        // ============================================================
        // WEEK 11 — Jun 15–19, 2026
        // ============================================================
        Assignment(id: "p11", code: "P11", title: "Pre-lecture Work 11", type: .preLecture,
                   dueDate: noon(6, 15), weekNumber: 11, points: 5),
        Assignment(id: "la11m", code: "LA11m", title: "Lecture Activity 11 (Mon)", type: .lectureActivity,
                   dueDate: classTime(6, 15), weekNumber: 11, points: 2),
        Assignment(id: "mt3", code: "MT3", title: "Midterm 3", type: .midterm,
                   dueDate: classTime(6, 17), weekNumber: 11, points: 100),
        Assignment(id: "h11", code: "H11", title: "Homework 11", type: .homework,
                   dueDate: date(6, 21), weekNumber: 11, points: 10),

        // ============================================================
        // WEEK 12 — Finals Week (Jun 22–26, 2026)
        // ============================================================
        // No regular assignments during finals week; final exam handled separately if needed
    ]
}
