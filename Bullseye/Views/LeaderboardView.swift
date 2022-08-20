//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Afshan Shabnam on 8/18/22.
//

import SwiftUI



struct LeaderboardView: View {
    
    @Binding var leaderboardIsShowing: Bool
    
    @Binding var game: Game
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 10) {
                HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
                LabelsView()
                ScrollView{
                VStack (spacing: 10){
                    ForEach(game.leaderboardEntries.indices) { i
                        in
                        let leaderboardEntry = game.leaderboardEntries[i]
                        RowView(index: i, score: leaderboardEntry.score, date: leaderboardEntry.date)
                    }
                    }
                }
            }
        }
    }
    
    
    struct LabelsView: View {
        var body: some View {
            HStack {
                Spacer()
                    .frame(width: Constants.General.roundedViewLength)
                Spacer()
                LabelText(text: "Score")
                    .frame(width: Constants.Leaderboard.LeaderboardScoreColWidth)
                Spacer()
                LabelText(text: "Date")
                    .frame(width: Constants.Leaderboard.LeaderboardDateColWidth)
            }
            .padding(.leading)
            .padding(.trailing)
            .frame(maxWidth: Constants.Leaderboard.LeaderboardMaxRowWidth)
        }
        
    }
    
    struct HeaderView: View {
        
        @Binding var leaderboardIsShowing: Bool
        @Environment(\.verticalSizeClass) var verticalSizeClass
        @Environment(\.horizontalSizeClass) var horizontalSizeClass
        
        
        var body: some View {
            ZStack{
                HStack{
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    BigBoldText(text: "Leaderboard")
                        .padding(.leading)
                    Spacer()
                } else {
                    BigBoldText(text: "Leaderboard")
                }
                }
                .padding(.top)
                HStack{
                    Spacer()
                    
                    Button(action: {leaderboardIsShowing = false}){
                        CloseLeaderboardView(systemName: "xmark")}
                    .padding(.trailing)
                   
                }
            }
            
        }
    }
}
    
    struct RowView: View {
        let index:Int
        let score:Int
        let date:Date
        
        var body: some View {
            
            HStack (spacing: 10){
                
                RoundedTextView(text: String(index))
                Spacer()
                ScoreText(score: score)
                    .frame(width: Constants.Leaderboard.LeaderboardScoreColWidth)
                Spacer()
                DateText(date: Date())
                    .frame(width: Constants.Leaderboard.LeaderboardDateColWidth)
            }
            .background(
                RoundedRectangle(cornerRadius: .infinity)
                    .strokeBorder( Color("LeaderboardRowColor"),lineWidth: Constants.General.strokeWidth)
            )
            .padding(.leading)
            .padding(.trailing)
            .frame(maxWidth: Constants.Leaderboard.LeaderboardMaxRowWidth)
        }
    }
    


struct LeaderboardView_Previews: PreviewProvider {
    
    static private var leaderboardIsShowing = Binding.constant(true)
    
    static private var game = Binding.constant(Game(loadTestData: true))

    
    static var previews: some View {
        LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
        LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
        LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
            .preferredColorScheme (.dark)
        LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
            .preferredColorScheme (.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}

