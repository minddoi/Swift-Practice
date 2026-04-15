//
//  Movie.swift
//  FriendsFavoriteMovies
//
//  Created by JENNA on 4/12/26.
//

import Foundation
import SwiftData

@Model
class Movie {
    var title: String
    var releaseDate: Date
    
    //var a: [Friend] = []랑 같은 의미로 빈 Friend 배열 생성
    var favoritedBy = [Friend]()
    
    init(title: String, releaseDate: Date) {
        self.title = title
        self.releaseDate = releaseDate
    }
    
    static let sampleData = [
        Movie(title: "악마는 프라다를 입는다", releaseDate: Date(timeIntervalSinceReferenceDate: -402_000_000)),
        Movie(title: "왕과 사는 남자", releaseDate: Date(timeIntervalSinceReferenceDate: -20_000_000)),
        Movie(title: "위 리브 인 타임", releaseDate: Date(timeIntervalSinceReferenceDate: 300_000_000)),
        Movie(title: "극한직업", releaseDate: Date(timeIntervalSinceReferenceDate: 120_000_000)),
        Movie(title: "런닝맨", releaseDate: Date(timeIntervalSinceReferenceDate: 550_000_000)),
        Movie(title: "인사이드 아웃2", releaseDate: Date(timeIntervalSinceReferenceDate: -1_700_000_000)),
    ]
}
