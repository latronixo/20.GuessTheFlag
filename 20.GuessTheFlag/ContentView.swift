//
//  ContentView.swift
//  20.GuessTheFlag
//
//  Created by Валентин on 13.05.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Circle()
            .fill(
                AngularGradient(
                    gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]),
                    center: .center,
                    startAngle: .degrees(0), // Начальный угол
                    endAngle: .degrees(360) // Конечный угол (полный круг)
                )
            )
            .rotationEffect(.degrees(90)) // Поворот всего Circle
            .frame(width: 300, height: 500)
    }
}

#Preview {
    ContentView()
}

