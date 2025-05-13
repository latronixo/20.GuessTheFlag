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
            Color.secondary
                .frame(minWidth: 200, maxHeight: 200)
            Text("Hello, world!")
            Text("This is another text view")
        }
        .background(.red)
    }
}

#Preview {
    ContentView()
}
