//
//  ContentView.swift
//  20.GuessTheFlag
//
//  Created by Валентин on 13.05.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Button 1") { }
                .buttonStyle(.bordered)

            Button("Button 2", role: .destructive) { }
                .buttonStyle(.bordered)

            Button("Button 3") { }
                .buttonStyle(.borderedProminent)
                .tint(.indigo)

            Button("Button 4", role: .destructive) { }
                .buttonStyle(.borderedProminent)

        }
    }

    func executeDelete () {
        print("Удалено")
    }
}

#Preview {
    ContentView()
}

