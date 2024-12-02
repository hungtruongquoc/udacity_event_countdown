//
//  EventForm.swift
//  Event Countdown
//
//  Created by Hung Truong on 12/2/24.
//

import SwiftUI

struct EventForm: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Form {
            // Your form content here
            Text("Form content")
        }
        .navigationTitle("Add Event")
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
        EventForm()
    }
}
