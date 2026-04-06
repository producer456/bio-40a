import Foundation

struct CompareCard: Identifiable, Codable {
    let id: String
    let title: String           // "Osteoblasts vs Osteoclasts"
    let itemA: CompareItem
    let itemB: CompareItem
    let categories: [CompareCategory]  // rows of comparison
    let weekNumber: Int
}

struct CompareItem: Codable {
    let name: String            // "Osteoblast"
    let color: String           // "blue" or "orange" for visual distinction
}

struct CompareCategory: Identifiable, Codable {
    let id: String
    let label: String           // "Function"
    let valueA: String          // "Builds new bone"
    let valueB: String          // "Breaks down bone"
}
