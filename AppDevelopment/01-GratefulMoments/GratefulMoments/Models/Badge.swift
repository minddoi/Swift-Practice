//
//  Badge.swift
//  GratefulMoments
//
//  Created by JENNA on 4/21/26.
//

import Foundation
import SwiftData

/// Use `timestamp` to determine if a badge is unlocked.
/// A `Moment` may be deleted but the timestamp stays
/// Once awarded, badges aren't relocked.

@Model
class Badge {
    var details: BadgeDetails
    var moment: Moment?
    // 획득 여부를 자체적으로 저장해야 한다 → timestamp 사용
    var timestamp: Date?
    
    init(details: BadgeDetails) {
        self.details = details
        self.moment = nil
        self.timestamp = nil
    }
}

extension Badge {
    static var sample: Badge {
        let badge = Badge(details: .firstEntry)
        badge.timestamp = .now
        return badge
    }
}
