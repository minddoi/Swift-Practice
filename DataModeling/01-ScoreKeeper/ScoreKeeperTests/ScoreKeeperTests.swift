//
//  ScoreKeeperTests.swift
//  ScoreKeeperTests
//
//  Created by JENNA on 4/11/26.
//

import Testing
@testable import ScoreKeeper

struct ScoreKeeperTests {

    @Test("Reset player scores", arguments: [0, 10, 20])
    func resetScores(to newValue: Int) async throws {
        var scoreboard = Scoreboard(players: [
            Player(name: "Jenna", score: 21),
            Player(name: "Niya", score: 0)
        ])
        scoreboard.resetScores(to: newValue)
        
        for player in scoreboard.players {
            #expect(player.score == newValue)
        }
    }
    
    @Test("Highest score wins")
    func highestScoreWins() {
        let scoreboard = Scoreboard(
            players: [
                Player(name: "Jenna", score: 21),
                Player(name: "Niya", score: 14)
            ],
            state: .gameOver,
            doesHighestScoreWin: true
        )
        let winner = scoreboard.winners
        #expect(winner == [Player(name: "Jenna", score: 21)])
        
    }
    
    @Test("Lowest score wins")
    func lowestScoreWins() {
        let scoreboard = Scoreboard(
            players: [
                Player(name: "Jenna", score: 21),
                Player(name: "Niya", score: 14)
            ],
            state: .gameOver,
            doesHighestScoreWin: false
        )
        let winner = scoreboard.winners
        #expect(winner == [Player(name: "Niya", score: 14)])
    }

}
