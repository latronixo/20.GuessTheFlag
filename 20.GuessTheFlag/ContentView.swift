//
//  ContentView.swift
//  20.GuessTheFlag
//
//  Created by Валентин on 13.05.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image(systemName: "pencil.circle")
            .foregroundStyle(.red)
            .font(.largeTitle)
    }

    func executeDelete () {
        print("Удалено")
    }
}

#Preview {
    ContentView()
}

