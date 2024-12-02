//
//  ContentView.swift
//  Event Countdown
//
//  Created by Hung Truong on 11/30/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Events")
                .font(.title.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            List {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Content")/*@END_MENU_TOKEN@*/
            }
        }
    }
}

#Preview {
    ContentView()
}
