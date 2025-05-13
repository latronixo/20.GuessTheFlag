//
//  ContentView.swift
//  20.GuessTheFlag
//
//  Created by Валентин on 13.05.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Color(red: 1, green: 0.8, blue: 0)
                .frame(minWidth: 200, maxHeight: 200)
            Text("Hello, world!")
            Text("This is another text view")
        }
        .background(.blue)
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
