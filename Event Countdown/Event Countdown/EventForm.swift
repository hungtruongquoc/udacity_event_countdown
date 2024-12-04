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
    
    @Environment(\.dismiss) private var dismiss
    @State private var eventTitle: String = ""
    @State private var eventDate: Date = Date()
    @State private var titleColor: Color = .blue
    var mode: Mode
    
    var body: some View {
        Form {
            Section(header: Text("Event Details")) {
                TextField("Event Title", text: $eventTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                DatePicker("Event Date", selection: $eventDate, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())

                ColorPicker("Title Color", selection: $titleColor)
            }
        }
        .navigationTitle(mode == .add ? "Add Event" : "Edit Event")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    // Add save logic here
                    dismiss()
                } label: {
                    HStack(spacing: 5) {
                        Image(systemName: "chevron.left")
                        Text("Events")
                    }
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    // Add save logic here
                    dismiss()
                } label: {
                    Image(systemName: "checkmark")
                        .fontWeight(.bold)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        // Test the form in both Add and Edit modes
        VStack {
            EventForm(mode: .add)
            EventForm(mode: .edit)
        }
    }
}
