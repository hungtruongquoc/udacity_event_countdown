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
    
    // Bindings for event properties
    @Binding var eventTitle: String
    @Binding var eventDate: Date
    @Binding var titleColor: Color
    
    var mode: Mode
    var onSave: () -> Void // Callback to handle saving the event
    // Dismiss environment
   @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Form {
            // Title text field
            TextField("Title", text: $eventTitle)
                .foregroundColor(titleColor)
                .textFieldStyle(PlainTextFieldStyle())

            // Horizontal stack for date and time pickers
            HStack {
                Text("Date")
                    .font(.headline)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                DatePicker("", selection: $eventDate, displayedComponents: .date)
                    .datePickerStyle(.compact)
                    .labelsHidden() // Hides the default label
            }

            // Color picker for title color
            ColorPicker("Title Color", selection: $titleColor)
        }
        .navigationTitle(mode == .add ? "Add Event" : "Edit Event")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    // Dismiss the view
                    dismiss()
                } label: {
                    HStack(spacing: 5) {
                        Image(systemName: "chevron.left")
                        Text("Events")
                    }
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: onSave) {
                    Image(systemName: "checkmark")
                        .fontWeight(.bold)
                }
                .disabled(eventTitle.isEmpty) // Disable save button if title is empty
            }
        }
    }
}

#Preview {
}
