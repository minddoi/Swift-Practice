//
//  Friend.swift
//  FriendsFavoriteMovies
//
//  Created by JENNA on 4/12/26.
//

import Foundation
import SwiftData

@Model
class Friend {
    var name: String
    var favoriteMovie : Movie?
    
    //객체를 “사용 가능한 상태”로 만드는 과정
    init(name: String) {
        self.name = name
    }
    
    static let sampleData = [
        Friend(name: "Jenna"),
        Friend(name: "Kyo"),
        Friend(name: "Avery"),
        Friend(name: "Lydia"),
        Friend(name: "Sam"),
    ]
}
