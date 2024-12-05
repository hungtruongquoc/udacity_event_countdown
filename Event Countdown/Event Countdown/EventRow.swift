//
//  EventRow.swift
//  Event Countdown
//
//  Created by Hung Truong on 12/4/24.
//

import SwiftUI

struct EventRow: View {
    var event: Event // Event data for this row
    
    // Timer to trigger updates for real-time countdown
    @State private var relativeDateString: String = ""
    private let timer = Timer.publish(every: 10, on: .main, in: .common).autoconnect()
        
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            // Event title with dynamic text color
            Text(event.title)
                .font(.headline)
                .foregroundColor(event.textColor)
            
            // Relative date using RelativeDateTimeFormatter
            Text(relativeDateString)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .id(event.date) // Ensure updates in real time
        }
        .padding(.vertical, 8)
        .onAppear { updateRelativeDate() }
        .onReceive(timer) { _ in
            updateRelativeDate()
        }
    }
    
    // Function to calculate and update the relative date string
    private func updateRelativeDate() {
        relativeDateString = relativeDate(for: event.date)
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
