//
//  EventRow.swift
//  Event Countdown
//
//  Created by Hung Truong on 12/4/24.
//

import SwiftUI

struct EventRow: View {
    var event: Event // Event data for this row
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            // Event title with dynamic text color
            Text(event.title)
                .font(.headline)
                .foregroundColor(event.textColor)
            
            // Relative date using RelativeDateTimeFormatter
            Text(relativeDate(for: event.date))
                .font(.subheadline)
                .foregroundColor(.secondary)
                .id(event.date) // Ensure updates in real time
        }
        .padding(.vertical, 8)
    }
    
    // Function to format the relative date
    private func relativeDate(for date: Date) -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: date, relativeTo: Date())
    }
}

#Preview {
    EventRow(
        event: Event(
            title: "Meeting with Client",
            date: Date().addingTimeInterval(3600), // 1 hour from now
            textColor: .blue
        )
    )
}
