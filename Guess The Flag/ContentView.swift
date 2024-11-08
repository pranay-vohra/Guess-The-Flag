//
//  ContentView.swift
//  Guess The Flag
//
//  Created by pranay vohra on 07/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var countries=["India","Estonia","France","Germany","Ireland","Italy","Nigeria","Poland","Spain","UK","Ukraine","US"].shuffled()
    
    @State private var correctAnswer=Int.random(in: 0...2)
    
    @State private var scoreTitle=""
    @State private var showScore=false
    @State private var score=0
    var body: some View {
        ZStack{
            RadialGradient(stops: [.init(color: .cyan, location: 0.3),.init(color: .blue, location: 0.6)],
                center: .top, startRadius: 200, endRadius:700)
                .ignoresSafeArea()
            VStack{
                Spacer()
                
                Text("Guess The Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                
                VStack(spacing:15){
                    VStack{
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3){number in
                        Button{
                            flagTapped(number)
                        }label:{
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                            
                        }
                        
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical,20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius:50))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .font(.title.weight(.heavy))
                    .foregroundStyle(.white)
                
                Spacer()
            }
            .padding()
            .alert(scoreTitle, isPresented:$showScore){
                Button("Continue",action:askQuestion)
            } message: {
                Text("your score is \(score)")
            }
            
        }
        
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer=Int.random(in: 0...2)
    }
    
    func flagTapped(_ num:Int){
        if(num==correctAnswer){
            scoreTitle="correct"
            score+=1
        }else{
            scoreTitle="wrong"
            score=0
        }
        
        showScore=true
    }
    
    
   
}

#Preview {
    ContentView()
}
