//
//  Game.swift
//  Bullseye
//
//  Created by Afshan Shabnam on 8/16/22.
//

import Foundation

import SwiftUI



struct LeaderboardEntry {
    
    let score: Int
    let date: Date
}

struct Game {
    
    var target = Int.random(in: 1...100)
    
    var score = 0
    
    var round = 1
    
    var leaderboardEntries: [LeaderboardEntry] = []
    
    init(loadTestData: Bool = false) {
      if loadTestData {
        leaderboardEntries.append(LeaderboardEntry(score: 100, date: Date()))
        leaderboardEntries.append(LeaderboardEntry(score: 80, date: Date()))
        leaderboardEntries.append(LeaderboardEntry(score: 60, date: Date()))
        leaderboardEntries.append(LeaderboardEntry(score: 40, date: Date()))
        leaderboardEntries.append(LeaderboardEntry(score: 20, date: Date()))
      }
    }
    
    
    func points(sliderValue: Int) -> Int {
        
    
        let difference = abs(sliderValue - target)
        let bonus: Int
        
        if difference == 0 {
            bonus = 100
        } else if difference <= 2 {
                    bonus = 50
        } else {
            bonus = 0
        }
        
        let awardedPoints = 100 - difference + bonus
        
        return awardedPoints
    }
    
    mutating func addToLeaderboard(point: Int) {
      leaderboardEntries.append(LeaderboardEntry (score: point, date: Date()))
      leaderboardEntries.sort { $0.score > $1.score }
    }
    
    mutating func startNewRound(points:Int){
        
     score += points
       round += 1
        target = Int.random(in: 1...100)
        addToLeaderboard(point: points)
        
    }
    
    mutating func restart(){
        
     score = 0
       round = 1
        target = Int.random(in: 1...100)
        
    }
}
