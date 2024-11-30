//
//  Event.swift
//  Event Countdown
//
//  Created by Hung Truong on 11/30/24.
//

import Foundation
import SwiftUI

struct Event: Identifiable, Comparable {
    let id: UUID
    var title: String
    var date: Date
    var textColor: Color
    
    init(id: UUID = UUID(), title: String, date: Date, textColor: Color = .primary) {
        self.id = id
        self.title = title
        self.date = date
        self.textColor = textColor
    }
    
    // Comparable protocol implementation
    static func < (lhs: Event, rhs: Event) -> Bool {
        lhs.date < rhs.date
    }
    
    static func == (lhs: Event, rhs: Event) -> Bool {
        lhs.id == rhs.id
    }
}

// Extension for sample data if needed
extension Event {
    static var sampleEvent: Event {
        Event(
            title: "Sample Event",
            date: Date(),
            textColor: .blue
        )
    }
    
    static var sampleEvents: [Event] {
        [
            Event(title: "Team Meeting", date: Date().addingTimeInterval(3600), textColor: .blue),
            Event(title: "Lunch Break", date: Date().addingTimeInterval(7200), textColor: .green),
            Event(title: "Project Deadline", date: Date().addingTimeInterval(86400), textColor: .red)
        ]
    }
}
