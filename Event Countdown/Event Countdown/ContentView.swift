//
//  ContentView.swift
//  Event Countdown
//
//  Created by Hung Truong on 11/30/24.
//

import SwiftUI

struct ContentView: View {
    @State private var formMode: EventForm.Mode = .add
    @State private var events: [Event] = [] // List of events
    @State private var selectedEvent: Event? = nil // Selected event for editing
    @State private var isEditing: Bool = false // Flag for add/edit mode
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Events")
                    .font(.title.bold())
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                if events.isEmpty {
                    VStack {
                        Text("No events yet!")
                            .font(.headline)
                            .foregroundColor(.secondary)
                            .padding(.bottom, 4)
                        Text("Tap the + button to create a new event.")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                }
                else {
                    
                }
            }
            .background(Color(uiColor: .systemGroupedBackground))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        // Assign selectedEvent on navigation
                        EventForm(
                            eventTitle: Binding(get: { selectedEvent?.title ?? "" }, set: { selectedEvent?.title = $0 }),
                            eventDate: Binding(get: { selectedEvent?.date ?? Date() }, set: { selectedEvent?.date = $0 }),
                            titleColor: Binding(get: { selectedEvent?.textColor ?? .blue }, set: { selectedEvent?.textColor = $0 }),
                            mode: .add,
                            onSave: {
                                if let newEvent = selectedEvent {
                                    events.append(newEvent)
                                }
                                selectedEvent = nil
                            }
                        )
                        .onAppear {
                            selectedEvent = Event(title: "", date: Date(), textColor: .blue)
                        }
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
