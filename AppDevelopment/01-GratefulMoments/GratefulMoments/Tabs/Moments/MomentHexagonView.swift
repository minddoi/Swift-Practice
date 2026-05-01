//
//  MomentHexagonView.swift
//  GratefulMoments
//
//  Created by JENNA on 4/20/26.
//

import SwiftUI

struct MomentHexagonView: View {
    var moment: Moment
    @State var layout: HexagonLayout = .standard
    @Environment(\.locale) private var locale
    
    var body: some View {
        Hexagon(layout: layout, moment: moment) {
            hexagonContent()
        }
    }
    
    private func hexagonContent() -> some View {
        ZStack (alignment: .bottom) {
            if showImage {
                Color.clear
                
                // contentStack()의 프레임에만 배경
                contentStack()
                    .frame(maxWidth: .infinity)
                    .padding(.top, 8)
                    .background(.ultraThinMaterial)
            } else {
                Color.ember
                contentStack()
                    .frame(height: layout.size * 0.80)
            }
            
            Text(moment.timestamp.formatted(
                .dateTime.locale(locale)
                .month(.abbreviated).day()
            ))
            .font(.footnote)
            .padding(.bottom, layout.size * 0.08)
            .frame(maxWidth: layout.size / 3)
            .frame(maxHeight: layout.timestampHeight)
        }
        .foregroundStyle(.white)
    }
    
    private func contentStack() -> some View {
        VStack(alignment: .leading) {
            Text(moment.title)
                .font(layout.titleFont)
            
            if !moment.note.isEmpty, !showImage {
                Text(moment.note)
                    .font(layout.bodyFont)
            }
        }
        .frame(maxWidth: layout.size * 0.80)
        .frame(maxHeight: layout.size * (showImage ? 0.15 : 0.50))
        .padding(.bottom, layout.size * layout.textBottomPadding)
        
        // TODO: 이건 무슨 역할 뭘 고정한다는거야
        .fixedSize(horizontal: false, vertical: true)
    }
    
    private var showImage: Bool {
        moment.image != nil
    }
}

#Preview {
    MomentHexagonView(moment: Moment.imageSample)
    MomentHexagonView(moment: Moment.imageSample, layout: .large)
    MomentHexagonView(moment: Moment.sample) // 이미지 없는 sample
    MomentHexagonView(moment: Moment.sample, layout: .large)
}

#Preview("Spanish language") {
    MomentHexagonView(moment: Moment.imageSample)
        .environment(\.locale, Locale(identifier: "es"))
}

#Preview("English language, region Great Britian") {
    MomentHexagonView(moment: Moment.imageSample)
        .environment(\.locale, Locale(identifier: "en_GB"))
}
