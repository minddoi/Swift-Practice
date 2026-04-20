//
//  BadgeManager.swift
//  GratefulMoments
//
//  Created by JENNA on 4/21/26.
//

import Foundation
import SwiftData

// 앱 시작 → 모든 badge 생성 → DB에 저장
class BadgeManager {
    private let modelContainer: ModelContainer
    
    init(modelContainer: ModelContainer) {
        self.modelContainer = modelContainer
    }
    
    func unlockBadges (newMoment: Moment) throws {
        let context = modelContainer.mainContext
        let moments = try context.fetch(FetchDescriptor<Moment>())
        // 어디에 쓰는겨
        let lockedBadges = try context.fetch(FetchDescriptor<Badge>(predicate: #Predicate { $0.timestamp == nil}))
        
        var newlyUnlocked: [Badge] = []
        for badge in lockedBadges {
            // Add badge to newlyUnlocked if earned
            switch badge.details {
            case .firstEntry where moments.count >= 1,
                    .fiveStars where moments.count >= 5,
                    .shutterbug where moments.count(where: { $0.image != nil }) >= 3,
                    .expressive where moments.count(where: { $0.image != nil && !$0.note.isEmpty }) >= 5,
                    .perfectTen where moments.count >= 10 && lockedBadges.count == 1:
                newlyUnlocked.append(badge)
            default:
                continue
            }
        }
        
        for badge in newlyUnlocked {
            badge.moment = newMoment
            badge.timestamp = newMoment.timestamp
        }
    }
    
    // badge가 없을 때만 초기 데이터 한 번 넣는 함수
    func loadBadgesIfNeeded() throws {
        let context = modelContainer.mainContext
        var fetchDescriptor = FetchDescriptor<Badge>()
        fetchDescriptor.fetchLimit = 1
        
        // 위에서 설정한 조건을 기반으로 badge 정보 가져오기
        let existingBadges = try context.fetch(fetchDescriptor)
        
        // badges가 비어있다면
        if existingBadges.isEmpty {
            for details in BadgeDetails.allCases {
                context.insert(Badge(details: details))
            }
        }
    }
}
