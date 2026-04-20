//
//  StreakCalculator.swift
//  GratefulMoments
//
//  Created by JENNA on 4/21/26.
//

import Foundation

struct StreakCalculator {
    let calendar = Calendar.current
    
    /// Count the number of days in a row a moment has been saved
    ///
    /// Days are measured from the end of the day, rather than whatever time of day it is currently
    /// - precondition : `moments` must be sorted by timestamp, from earlist to latest
    func calculateStreak(for moments: [Moment]) -> Int {
        let startOfToday = calendar.startOfDay(for: .now)
        let endOfToday = calendar.date(byAdding: DateComponents(day: 1, second: -1), to: startOfToday)!
        
        // TODO: 이해 필요....
        // Ex. [0, 0, 1, 2, 4, 5]
        let dayAgoArray = moments
            .reversed()
            .map(\.timestamp)
            .map { calendar.dateComponents([.day], from: $0, to: endOfToday)}
            .compactMap { $0.day }
        
        // 0부터 시작해서 1, 2, 3 순서로 끊기지 않고 있는지 확인
        var streak = 0
        for daysAgo in dayAgoArray {
            if daysAgo == streak {
                streak += 1
            }
        }
        
        return streak
    }
}
