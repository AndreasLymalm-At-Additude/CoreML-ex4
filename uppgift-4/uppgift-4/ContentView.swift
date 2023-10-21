//
//  ContentView.swift
//  uppgift-4
//
//  Created by Andreas Lymalm on 2023-10-21.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    @State var Prediction = ""
    @State var PredictionColor: Color = .white
    @State var CorrectAnswer = ""
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    let chinchilla = UIImage(named: "chinchilla")!
                    
                    Image(uiImage: chinchilla)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Button(action: {
                        let result = MachineLearning.PredictImage(image: chinchilla)
                        if (result != nil) {
                            Prediction = result!
                            PredictionColor = .gray
                            CorrectAnswer = "Chinchilla (rodent)"
                        }
                    }) {
                        Text("Predict animal")
                            .foregroundStyle(.gray)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 3)
                                    .foregroundStyle(.gray)
                            )
                    }
                }
                VStack {
                    let shibaInu = UIImage(named: "shiba-inu")!
                    
                    Image(uiImage: shibaInu)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Button(action: {
                        let result = MachineLearning.PredictImage(image: shibaInu)
                        if (result != nil) {
                            Prediction = result!
                            PredictionColor = .orange
                            CorrectAnswer = "Shiba inu (dog)"
                        }
                    }) {
                        Text("Predict animal")
                            .foregroundStyle(.orange)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 3)
                                    .foregroundStyle(.orange)
                            )
                    }
                }
            }
            Text(String(Prediction))
                .font(.system(size: 30))
                .frame(maxWidth: .infinity)
                .padding()
                .background(PredictionColor)
            HStack {
                if (CorrectAnswer != "") {
                    Text("Correct answer:")
                    Text(String(CorrectAnswer))
                        .italic()
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
