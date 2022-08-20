//
//  PointsView.swift
//  Bullseye
//
//  Created by Afshan Shabnam on 8/18/22.
//

import SwiftUI

struct PointsView: View {
    
    @Binding var alertIsVisible: Bool
    
    @Binding var sliderValue: Double
    
    @Binding var game: Game
    var body: some View {
        
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedValue)
        
        VStack(spacing: 10) {
            
            InstructionsView(text: "The sliders value is")
            BigNumberView(text: String(roundedValue))
            BodyTextView(text: "You scored \(points) points \n 🎉🎉🎉")
            Button (action:{
                withAnimation{
                alertIsVisible = false
                }
                game.startNewRound(points: points)
                
            } ) {
            ButtonTextView(text: "Start New Round")
            }
            
        }
            .padding()
            .frame(maxWidth: 300)
            .background(Color("BackgroundColor"))
            .cornerRadius(Constants.General.roundRectCornerRadius)
            .shadow(radius: 10, x: 5, y: 5)
            .transition(.scale)
        
    }
}

struct PointsView_Previews: PreviewProvider {
    static private var aleartIsVisible = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.0)
    static private var game = Binding.constant(Game())
    
    static var previews: some View {
       PointsView(alertIsVisible: aleartIsVisible, sliderValue: sliderValue, game: game)
        
        PointsView(alertIsVisible: aleartIsVisible, sliderValue: sliderValue, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
        
        PointsView(alertIsVisible: aleartIsVisible, sliderValue: sliderValue, game: game)
            .preferredColorScheme (.dark)
        
        PointsView(alertIsVisible: aleartIsVisible, sliderValue: sliderValue, game: game)
            .preferredColorScheme (.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
