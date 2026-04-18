//
//  Scoreboard.swift
//  ScoreKeeper
//
//  Created by JENNA on 4/11/26.
//

import Foundation

struct Scoreboard {
    var players: [Player] = [
        Player(name: "Jenna", score: 0),
        Player(name: "Niya", score: 0),
        Player(name: "Nana", score: 0),
    ]
    
    //초기 상태 지정
    var state = GameState.setup
    var doesHighestScoreWin = true
    var checkRound = false
    
    var winners: [Player] {
        guard state == .gameOver else { return [] } //게임오버 상태가 아니라면 반환
        
        var winningScore = 0
        if doesHighestScoreWin {
            winningScore = Int.min //시작값 제일 작은 값으로
            for player in players {
                winningScore = max(player.score, winningScore)
            }
        } else {
            winningScore = Int.max
            for player in players {
                winningScore = min(player.score, winningScore)
            }
        }
        
        //player.score가 최고 점수랑 같은 플레이어만 남기기
        return players.filter { player in
            player.score == winningScore
        }
    }
    
    mutating func resetScores(to newValue: Int) {
        for index in 0..<players.count {
            players[index].score = newValue
        }
    }
}
