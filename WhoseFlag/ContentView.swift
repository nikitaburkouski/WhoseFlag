//
//  ContentView.swift
//  WhoseFlag
//
//  Created by Nikita on 12/23/20.
//  Copyright © 2020 Nikita. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Russia", "USA", "Japan", "Canada", "Finland", "France", "Germany", "Spain", "Thailand", "UK", "Poland", "Australia", "Bulgaria", "China", "Cyprus", "Denmark", "Estonia", "Israel", "Latvia", "Portugal", "Romania", "Sweden", "Ukraine", "Albania", "Algeria", "Angola", "Argentina", "Armenia", "Azerbaijan", "Belgium", "Bolivia", "Botswana", "Brazil", "Burkina Faso", "Burundi", "Cameroon", "Chad", "Cuba", "Czech Republic", "Dominica", "England", "Eritrea", "Georgia", "Ghana", "Guinea", "Hong Kong", "Iceland", "Indonesia", "Iran", "Ireland", "Italy", "Jamaica", "Kazakhstan", "Kuwait", "Kyrgyzstan", "Laos", "Liberia", "Liechtenstein", "Lithuania", "Luxembourg", "Madagascar", "Malawi", "Malaysia", "Mali", "Malta", "Micronesia", "Moldova", "Mongolia", "Morocco", "Nepal", "Nicaragua", "Niger", "North Korea", "Oman", "Paraguay", "Peru", "Puerto Rico", "Qatar", "Rwanda", "Scotland", "Serbia", "Singapore", "Slovakia", "Slovenia", "Somalia", "South Korea", "Sri Lanka", "Suriname", "Switzerland", "Syria", "Taiwan", "Tunisia", "Turkey", "Turkmenistan", "Uganda", "Uruguay", "Uzbekistan", "Vietnam", "Wales", "Yemen"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack (spacing: 30) {
                VStack {
                Text("CHOOSE FLAG ")
                    .foregroundColor(Color.white)
                    .font(.headline)
                Text(countries[correctAnswer])
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .animation(.easeInOut)
            
                }
            ForEach(0..<3) { number in
                Button(action: {
                    self.flagTapped(number)
                    self.showingScore = true
                }) {
                    Image(self.countries[number])
                        .renderingMode(.original)
                        .frame(width: 255, height: 130)
                        .clipShape(Capsule())
                    .overlay(Capsule()
                        .stroke(Color.black, lineWidth: 1))
                        .shadow(color: .black, radius: 2)
                        .animation(.default)
                    
                    
                
                }
            }
                Text("Score: \(score)")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .animation(.default)
                    
                
            
        }
    } .alert(isPresented: $showingScore) {
        Alert(title: Text(scoreTitle), message: Text("Score: \(score)"), dismissButton: .default(Text("Continue")) {
            self.askQuestion()
            } )
        }
    }
        func askQuestion() {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
        }
        func flagTapped(_ number: Int) {
            if number == correctAnswer {
                scoreTitle = "Correct answer!"
                score += 1
                
            
            } else {
                scoreTitle = "Incorrect answer! This is flag \(countries[number])"
                score -= 1
            }
    
        }
    













struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    
}
}
}
