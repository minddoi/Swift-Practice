//
//  SampleData.swift
//  FriendsFavoriteMovies
//
//  Created by JENNA on 4/12/26.
//

import Foundation
import SwiftData

@MainActor //해당 코드가 메인 스레드에서만 실행되도록 보장하는 선언(UI 관련 작업 → 반드시 메인 스레드)
class SampleData {
    //앱 전체에서 하나만 존재해야 하는 객체 (shared → 유일한 객체)
    static let shared = SampleData()
    
    let modelContainer: ModelContainer
    
    var context: ModelContext {
        modelContainer.mainContext
    }
    
    // ! <- 강제 언래핑 - 무조건 데이터가 있다고 확신할 수 있을 떄 사용
    var friend: Friend {
        Friend.sampleData.first!
    }
    
    var movie: Movie {
        Movie.sampleData.first!
    }
    
    //추가 생성 막음
    private init () {
        //이 DB에 어떤 모델들을 넣을지 정의하는 목록 (여러 개 동시에)
        let schema = Schema([
            Friend.self,
            Movie.self,
        ])
        
        //DB 생성 옵션 설정 (위에서 만든 schema 사용, 메모리에만 저장)
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        
        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            
            insertSampleData()
            
            try context.save()
        } catch {
            //DB 생성 실패하면 그냥 앱을 강제 종료(fatalError)
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    private func insertSampleData() {
        for friend in Friend.sampleData {
            context.insert(friend)
        }
        
        for movie in Movie.sampleData {
            context.insert(movie)
        }
        
        Friend.sampleData[0].favoriteMovie = Movie.sampleData[1]
        Friend.sampleData[2].favoriteMovie = Movie.sampleData[0]
        Friend.sampleData[3].favoriteMovie = Movie.sampleData[2]
        Friend.sampleData[4].favoriteMovie = Movie.sampleData[0]
    }
}
