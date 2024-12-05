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
                    List {
                        ForEach(events.sorted(by: { $0.date < $1.date }), id: \.id) { event in
                            let destination = EventForm(
                                mode: .edit,
                                eventTitle: event.title,
                                eventDate: event.date,
                                titleColor: event.textColor
                            ) { title, date, color in
                                if let index = events.firstIndex(where: { $0.id == event.id }) {
                                    events[index] = Event(id: event.id, title: title, date: date, textColor: color)
                                }
                            }
                            
                            NavigationLink(destination: destination) {
                                EventRow(event: event)
                            }
                        }
                        .onDelete { indexSet in
                            events.remove(atOffsets: indexSet)
                        }
                    }
                }
            }
            .background(Color(uiColor: .systemGroupedBackground))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(
                        destination: {
                            EventForm(
                                mode: .add,
                                eventTitle: "",
                                eventDate: Date(),
                                titleColor: .blue
                            ) { title, date, color in
                                // Add the new event to the list
                                let newEvent = Event(title: title, date: date, textColor: color)
                                events.append(newEvent)
                            }
                        },
                        label: {
                            Image(systemName: "plus")
                        }
                    )
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
