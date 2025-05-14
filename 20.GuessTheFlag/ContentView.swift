//
//  ContentView.swift
//  20.GuessTheFlag
//
//  Created by Валентин on 13.05.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button {
            print("Button was tapped")
        } label: {
            VStack (alignment: .leading) {
                Color.yellow
                Text("Hello, world!")
                Text("This is another text view")
            }
            .background(.red)
        }
    }

    func executeDelete () {
        print("Удалено")
    }
}

#Preview {
    ContentView()
}

