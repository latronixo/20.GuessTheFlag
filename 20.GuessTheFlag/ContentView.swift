//
//  ContentView.swift
//  20.GuessTheFlag
//
//  Created by Валентин on 13.05.2025.
//

import SwiftUI

struct ContentView: View {
    private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Russia", "US"]
    private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
            VStack (spacing: 30) {
                VStack {
                    Text("Нажмите на флаг")
                        .foregroundStyle(.white)
                    Text(countries[correctAnswer])
                        .foregroundStyle(.white)
                }
                ForEach(0..<3) { number in
                    Button {
                        //событие нажатия на флаг
                    } label: {
                        Image(countries[number])
                    }
                }
            }
        }
    }

    func executeDelete () {
        print("Удалено")
    }
}

#Preview {
    ContentView()
}

