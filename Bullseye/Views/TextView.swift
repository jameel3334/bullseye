//
//  TextView.swift
//  Bullseye
//
//  Created by Afshan Shabnam on 8/17/22.
//

import SwiftUI

struct InstructionsView: View {
    
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
    }
    
}

struct BigNumberView: View {
        
        var text : String
        
        var body: some View {
            Text(text)
                .fontWeight(.black)
                .bold()
                .kerning(-1.0)
                .font(.largeTitle)
                .foregroundColor(Color("TextColor"))
        }
        
    }


struct LabelText: View {
        
        var text : String
        
        var body: some View {
            Text(text.uppercased())
                .bold()
                .kerning(1.5)
                .font(.caption)
                .foregroundColor(Color("TextColor"))
        }
        
    }


struct SliderLabelTextView: View {

        
        var text : String
        
        var body: some View {
            Text (text)
            .bold()
            .font(.callout)
            .foregroundColor(Color("TextColor"))
            .frame(width: 35)
        }
}

struct BodyTextView: View {

        
        var text : String
        
        var body: some View {
            Text (text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12.0)
            .foregroundColor(Color("TextColor"))
            
        }
}

struct ButtonTextView: View {

        
        var text : String
        
        var body: some View {
            Text (text)
            .font(.body)
            .bold()
            .foregroundColor(Color.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color("AccentColor"))
            .cornerRadius(12)
        }
}

struct ScoreText: View {

        
        var score : Int
        
        var body: some View {
            Text (String(score))
            .font(.title3)
            .bold()
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
            
        }
}

struct DateText: View {

        
        var date : Date
        
        var body: some View {
            Text (date, style: .date)
                .font(.title3)
                .bold()
                .kerning(-0.2)
                .foregroundColor(Color("TextColor"))
                
        }
}
struct BigBoldText: View {

        
        var text : String
        
        var body: some View {
            Text (text.uppercased())
                .font(.title)
                .fontWeight(.black)
                .bold()
                .kerning(2.0)
                .foregroundColor(Color("TextColor"))
                
        }
}
    
    struct TextView_Previews: PreviewProvider {
        static var previews: some View {
            VStack {
                InstructionsView(text: "Instructions")
                BigNumberView(text: "999")
                SliderLabelTextView(text: "1")
                LabelText(text: "Round")
                BodyTextView(text: "You scored 200 points \n 🎉🎉🎉")
                Button(action: {}) { ButtonTextView(text: "Start New Round")
                }
                ScoreText(score: 999)
                DateText(date: Date())
                BigBoldText(text: "Leaderboard")
                }
            .padding()
            }
        }
    

