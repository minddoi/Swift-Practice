//
//  Player.swift
//  ScoreKeeper
//
//  Created by JENNA on 4/11/26.
//

import Foundation

struct Player: Identifiable {
    let id = UUID()
    
    var name: String
    var score: Int
}
