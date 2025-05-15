//
//  ContentView.swift
//  20.GuessTheFlag
//
//  Created by Валентин on 13.05.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Russia", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false //отображение алерта после каждого ответа
    @State private var showingEndRound = false //отображение алерта после окончания раунда
    @State private var scoreTitle = ""      //заголовок алерта
    @State private var score = 0            //счет
    @State private var round = 1            //номер раунда
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Угадай флаг")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                
                VStack (spacing: 15) {
                    VStack {
                        Text("Нажмите на флаг")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            //.foregroundStyle(.white)
                            .font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()

                Text("Ваш счет: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Text("Раунд: \(round)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Продолжить") {
                    if round == 9  {
                        score = 0
                        round = 1
                    }
                    
                    //askQuestion()
                }
            } message: {
            Text("Ваш счет: \(score)")
            }
            .padding()
        }
        
        .alert("Игра окончена", isPresented: $showingEndRound) {
            Button("Следующий раунд") {
                    score = 0
                    round = 1
            }
        } message: {
        Text("Ваш счет: \(score)")
        }

    }

    //событие тапа на флаг
    func flagTapped (_ number: Int) {
        if number == correctAnswer {
            //scoreTitle = "Верно"
            score += 1
        } else {
            scoreTitle = "Не правильно! Это флаг \(countries[number])"
            score -= 1
            showingScore = true
            
        }
        round += 1
        
        //показать алерт
        if round == 9 {
            showingEndRound = true
        }
        
        askQuestion()
    }
    
    //новый раунд
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}

