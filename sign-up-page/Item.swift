// In file: Item.swift

import Foundation

// This struct defines what a "Note" is.
// Identifiable: So SwiftUI can uniquely identify each note in a list.
// Codable: So you can easily save/load notes to storage later.
struct Note: Identifiable, Codable, Hashable {
    var id = UUID()
    var title: String
    var content: String
    var timestamp: Date = Date()
    var isImportant: Bool = false
    
    // Some sample notes to get you started!
    static var sampleData: [Note] = [
        Note(title: "Meeting Notes", content: "Discuss Q3 goals and new project timelines.", isImportant: true),
        Note(title: "Grocery List", content: "- Milk\n- Bread\n- Eggs\n- Coffee"),
        Note(title: "App Idea", content: "A social network for gardeners to share tips and photos of their plants."),
        Note(title: "Book to Read", content: "Finish 'The Three-Body Problem' by Cixin Liu.")
    ]
}
