//
//  AchievementsView.swift
//  GratefulMoments
//
//  Created by JENNA on 4/21/26.
//

import SwiftUI
import SwiftData

struct AchievementsView: View {
    // TODO: Query 부분 좀 더 이해 필요....
    @Query(filter: #Predicate<Badge> { $0.timestamp != nil })
    private var unlockedBadges: [Badge]
    
    @Query(filter: #Predicate<Badge> { $0.timestamp == nil })
    private var lockedBadges: [Badge]
    
    @Query(sort: \Moment.timestamp)
    private var moments: [Moment]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                contentStack
            }
            .navigationTitle("Achievements")
        }
        // 글자 크기를 XXX Large까지만 키우겠다는 설정
        .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
    }
    
    private var contentStack: some View {
        VStack(alignment: .leading) {
            StreakView(numberOfDays: StreakCalculator().calculateStreak(for: moments))
                .frame(maxWidth: .infinity)
            if !unlockedBadges.isEmpty {
                header("Your Badges")
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(sortedUnlockedBadges) { badge in
                            UnlockedBadgesView(badge: badge)
                        }
                    }
                }
                .scrollClipDisabled()
                .scrollIndicators(.hidden)
            }
            
            if !lockedBadges.isEmpty {
                header("Locked Badges")
                ForEach(sortedLockedBadges) { badge in
                    LockedBadgeView(badge: badge)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
    
    func header(_ text: String) -> some View {
        Text(text)
            .font(.subheadline.bold())
            .padding()
    }
    
    private var sortedUnlockedBadges: [Badge] {
        unlockedBadges.sorted {
            ($0.timestamp!, $0.details.title) < ($1.timestamp!, $1.details.title)
        }
    }
    
    // 항상 .firstEntry가 첫번째,.perfectTen이 마지막이어야하니까
    private var sortedLockedBadges: [Badge] {
        lockedBadges.sorted {
            $0.details.rawValue < $1.details.rawValue
        }
    }
}

#Preview {
    AchievementsView()
        .sampleDataContainer()
}
