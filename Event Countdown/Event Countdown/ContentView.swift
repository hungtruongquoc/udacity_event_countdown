//
//  ContentView.swift
//  Event Countdown
//
//  Created by Hung Truong on 11/30/24.
//

import SwiftUI

struct ContentView: View {
    @State private var formMode: EventForm.Mode = .add
    var body: some View {
        NavigationStack {
            VStack {
                Text("Events")
                    .font(.title.bold())
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                List {
                    Text("Content")
                }
            }
            .background(Color(uiColor: .systemGroupedBackground))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        EventForm(mode: formMode)
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
