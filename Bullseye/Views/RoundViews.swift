//
//  RoundViews.swift
//  Bullseye
//
//  Created by Afshan Shabnam on 8/17/22.
//

import SwiftUI

struct RoundedImageViewFilled: View {
    
var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .background(
                Circle()
                    .fill(Color("ButtonFilledBackgroundColor"))
                )
            
    }
}



struct RoundedImageViewStroked: View {
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .overlay(
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"),lineWidth: Constants.General.strokeWidth)
            )
    }
}

struct CloseLeaderboardView: View {
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .background(
                Circle()
                    .fill(Color("ButtonFilledBackgroundColor"))
                )
    }
                }


struct RoundRectTextView: View {
 
    
    var text: String
    
    var body: some View {
        VStack {
            Text(String (text))
                .font(.title3)
                .bold()
                .kerning(-0.2)
                .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
                .overlay(
                    RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                        .strokeBorder( Color("ButtonStrokeColor"),lineWidth: Constants.General.strokeWidth)
                )

        }
    }
}

struct RoundedTextView: View {
    let text : String
    
    var body: some View {
        Text(text)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .overlay(
                Circle()
                    .strokeBorder(Color("LeaderboardRowColor"),lineWidth: Constants.General.strokeWidth)
            )
    }
}

struct PreviewViews: View {
    var body: some View {
        VStack(spacing: 10){
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            RoundedImageViewFilled(systemName: "list.dash")
        RoundRectTextView(text: "999")
            RoundedTextView(text: "1")
            CloseLeaderboardView(systemName: "xmark")
            
        }
    }
}



struct RoundViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewViews()
        PreviewViews()
            .preferredColorScheme(.dark)
    }
}
