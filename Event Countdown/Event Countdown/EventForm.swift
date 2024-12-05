//
//  EventForm.swift
//  Event Countdown
//
//  Created by Hung Truong on 12/2/24.
//

import SwiftUI

struct EventForm: View {
    // Enumeration to specify the mode of operation
    enum Mode {
        case add
        case edit
    }
    
    // State variables for event properties
    @State private var eventTitle: String
    @State private var eventDate: Date
    @State private var titleColor: Color
    
    var mode: Mode
    var onSave: (String, Date, Color) -> Void // Callback to pass the updated values
    @Environment(\.dismiss) private var dismiss // Dismiss environment variable
    
    init(
        mode: Mode,
        eventTitle: String,
        eventDate: Date,
        titleColor: Color,
        onSave: @escaping (String, Date, Color) -> Void
    ) {
        self.mode = mode
        self._eventTitle = State(initialValue: eventTitle)
        self._eventDate = State(initialValue: eventDate)
        self._titleColor = State(initialValue: titleColor)
        self.onSave = onSave
    }
    
    var body: some View {
        Form {
            // Title text field
            TextField("Title", text: $eventTitle)
                .foregroundColor(titleColor)
                .textFieldStyle(PlainTextFieldStyle())
            
            // Date picker
            HStack {
                Text("Date")
                    .font(.headline)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                DatePicker("", selection: $eventDate, displayedComponents: .date)
                    .datePickerStyle(.compact)
                    .labelsHidden()
                DatePicker("", selection: $eventDate, displayedComponents: .hourAndMinute)
                    .datePickerStyle(.compact)
                    .labelsHidden()
            }
            
            // Color picker
            ColorPicker("Title Color", selection: $titleColor)
        }
        .navigationTitle(mode == .add ? "Add Event" : "Edit \(eventTitle)")
        .lineLimit(1) // Restrict to a single line
        .truncationMode(.tail) // Truncate with "..."
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss() // Dismiss to return to the previous view
                } label: {
                    HStack(spacing: 5) {
                        Image(systemName: "chevron.left")
                        Text("Events")
                    }
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    onSave(eventTitle, eventDate, titleColor) // Pass updated values
                    dismiss()
                }) {
                    Image(systemName: "checkmark")
                        .fontWeight(.bold)
                }
                .disabled(eventTitle.isEmpty) // Disable save button if title is empty
            }
        }
    }
}

#Preview {
    NavigationStack {
        EventForm(
            mode: .add,
            eventTitle: "",
            eventDate: Date(),
            titleColor: .blue
        ) { title, date, color in
            print("Saved Event: \(title), \(date), \(color)")
        }
    }
}
