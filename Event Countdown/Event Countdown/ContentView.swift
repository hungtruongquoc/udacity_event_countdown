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
    @State private var isAddingEvent: Bool = false // Flag for add/edit mode
    
    var body: some View {
        NavigationStack {
            VStack {
                headerView
                if events.isEmpty {
                    emptyStateView
                }
                else {
                    eventListView
                }
            }
            .background(Color(uiColor: .systemGroupedBackground))
            .toolbar {
                addButton
            }
            .navigationDestination(isPresented: $isAddingEvent) {
                addEventView
            }
            .navigationDestination(for: Event.self) { event in
                editEventView(for: event)
            }
        }
    }
}

#Preview {
    ContentView()
}

extension ContentView {
    // Header View
    private var headerView: some View {
        Text("Events")
            .font(.title.bold())
            .foregroundColor(.blue)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
    }
    
    // Empty State View
    private var emptyStateView: some View {
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
    
    // Event List View
    private var eventListView: some View {
        List {
            ForEach(events.sorted(by: { $0.date < $1.date }), id: \.id) { event in
                NavigationLink(value: event) {
                    EventRow(event: event)
                }
            }
            .onDelete(perform: deleteEvent)
        }
    }
    
    // Toolbar Button
    private var addButton: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button {
                isAddingEvent = true
            } label: {
                Image(systemName: "plus")
            }
        }
    }
    
    // Add Event View
    private var addEventView: some View {
        EventForm(
            mode: .add,
            eventTitle: "",
            eventDate: Date(),
            titleColor: .blue
        ) { title, date, color in
            let newEvent = Event(title: title, date: date, textColor: color)
            events.append(newEvent)
            isAddingEvent = false
        }
    }
    
    // Edit Event View
    private func editEventView(for event: Event) -> some View {
        EventForm(
            mode: .edit,
            eventTitle: event.title,
            eventDate: event.date,
            titleColor: event.textColor
        ) { title, date, color in
            events = events.map { existingEvent in
                if existingEvent.id == event.id {
                    return Event(id: event.id, title: title, date: date, textColor: color)
                }
                return existingEvent
            }
        }
    }
    
    // Delete Event
    private func deleteEvent(at offsets: IndexSet) {
        events.remove(atOffsets: offsets)
    }
}
