//
//  HexagonAccessoryView.swift
//  GratefulMoments
//
//  Created by JENNA on 4/21/26.
//

import SwiftUI

struct HexagonAccessoryView: View {
    let moment: Moment
    let hexagonLayout: HexagonLayout
    
    var body: some View {
        NavigationLink {
            if badges.count == 1 {
                BadgeDetailView(badge: badges[0])
            } else {
                MomentDetailView(moment: moment)
            }
        } label: {
            badgeView
        }
    }
    
    private var badgeView: some View {
        Group {
            if badges.count > 1 {
                Text("+\(badges.count)")
                    .bold()
                    .minimumScaleFactor(0.3) // 글자 크기를 최대 30%까지 줄여서라도 화면에 맞추라는 뜻
                    .frame(width: size * 0.5, height: size * 0.5)
                    .padding(8)
                    .background {
                        Image("Blank")
                            .resizable()
                            .frame(width: size, height: size)
                            .shadow(radius: 2)
                    }
                    .foregroundStyle(.gray)
            } else if let badges = badges.first {
                Image(badges.details.image)
                    .resizable()
                    .frame(width: size, height: size)
                    .shadow(radius: 2)
            }
        }
        .offset(y: yOffset)
    }
    
    private var yOffset: CGFloat {
        let radius = hexagonLayout.size / 2
        // TODO: 계산 방법 이해하기
        // 30 degrees points to the top right corner of a hexagon
        let yOffsetFromHexagonCenter = sin(Angle.degrees(30).radians) * radius
        return radius - yOffsetFromHexagonCenter - (size / 2)
    }
    
    private var badges: [Badge] {
        moment.badges
    }
    
    // Hexagon이 커져도 비율 유지하면서 1/5 크기 만들기
    private var size: CGFloat {
        hexagonLayout.size / 5
    }
}
        
        

#Preview ("Single badges") {
    MomentHexagonView(moment: .sample, layout: .large)
        .sampleDataContainer()
}

#Preview("Multiple badges") {
    MomentHexagonView(moment: .imageSample, layout: .standard)
        .dynamicTypeSize(.large)
        .sampleDataContainer()
}
