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
    
    @State private var rotationAmount = [0.0, 0.0, 0.0]     //угол поворота флагов
    @State private var opacityValues = [1.0, 1.0, 1.0]      //непрозрачность флагов
    @State private var scaleValues = [1.0, 1.0, 1.0]        //коэффициент размера флагов
    @State private var isDisabled = false                   //недоступность флагов (включим на время анимации)
    
    struct FlagImage: View {
        let imageName: String
        let opacity: Double
        var body: some View {
            Image(imageName)
                .clipShape(.capsule)
                .shadow(radius: 5)
                .opacity(opacity)
        }
    }
    
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
                            .font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<min(3, countries.count), id: \.self) { number in
                        // Проверка, что индекс существует
                        if countries.indices.contains(number) {
                            Button {
                                flagTapped(number)
                            } label: {
                                FlagImage(imageName: countries[number], opacity: opacityValues[number])
                                    .scaleEffect(scaleValues[number])   //добавляем эффект масштабирования
                            }
                            .rotation3DEffect(.degrees(rotationAmount[number]), axis: (x: 0, y: 1, z: 0))
                            .disabled(isDisabled)
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
        //Блокируем все кнопки
        isDisabled = true
        
        //Устанавливаем прозрачность для неактивных флагов
        for i in 0..<3 {
            opacityValues[i] = i == number ? 1.0 : 0.25
            scaleValues[i] = i == number ? 1.0 : 0.75
        }
        
        //запускаем анимации выбранного флага
        withAnimation {
             rotationAmount[number] += 360
            withAnimation(.easeInOut(duration: 0.5)) {
                scaleValues[number] = 1.0
            }
        }
        
        //запускаем алерт на 2 секунды
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in

        if number == correctAnswer {
            score += 1
        } else {
            scoreTitle = "Не правильно! Вы выбрали флаг \(countries[number]), а надо было выбрать \(countries[correctAnswer]) "
            score -= 1
            showingScore = true
            
        }
        round += 1
        
            if round == 9 {
                showingEndRound = true
            }
            
            //сбрасываем состояния флагов
            resetFlags()
            
            askQuestion()
        }
    }
    
    func resetFlags() {
        opacityValues = [1.0, 1.0, 1.0]
        scaleValues = [1.0, 1.0, 1.0]
        isDisabled = false
    }
    
    //новый раунд
    func askQuestion() {
        guard countries.count >= 3 else {
            fatalError("Недостаточно стран в массиве")
        }

        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        print("Текущие флаги: \(countries.prefix(3))")
        print("Правильный ответ: \(countries[correctAnswer])")
    }
}

#Preview {
    ContentView()
}

