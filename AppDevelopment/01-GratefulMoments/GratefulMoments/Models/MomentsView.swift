//
//  MomentsView.swift
//  GratefulMoments
//
//  Created by JENNA on 4/20/26.
//

import SwiftUI
import SwiftData

struct MomentsView: View {
    @State private var showCreateMoment = false
    @Query(sort: \Moment.timestamp)
    private var moments: [Moment]
    
    static let offsetAmount: CGFloat = 70.0
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 8, pinnedViews: .sectionHeaders) {
                    Section {
                        pathItems
                            .frame(maxWidth: .infinity)
                    } header: {
                        streakHeader
                    }
                }
                
            }
            .overlay {
                if moments.isEmpty {
                    ContentUnavailableView {
                        Label("No moments yet!", systemImage: "exclamationmark.circle.fill")
                    } description: {
                        Text("Post a note or photo to start filling this space with gratitude")
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        showCreateMoment = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    // isPresented는 바인딩해서 받아오는 showCreateMoment가 버튼을 누르면서 true가 될 때 MomentsView()를 실행
                    .sheet(isPresented: $showCreateMoment) {
                        MomentEntryView()
                    }
                }
            }
            // scrollview가 기본적으로 어느 위치를 기준으로 보여줄 지 설정
            // 원래는 위에서부터 보여주는데 이렇게 해서 스크롤 기본 위치를 아래로 잡기!!!!
            .defaultScrollAnchor(.bottom, for: .initialOffset)
            .defaultScrollAnchor(.bottom, for: .sizeChanges)
            
            // 화면보다 내용이 작으면 -> 위쪽 정렬
            .defaultScrollAnchor(.top, for: .alignment)
            .navigationTitle("Grateful Moments")
        }
        .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
    }
    
    private var pathItems: some View {
        ForEach(moments.enumerated(), id: \.0) { index, moment in
            NavigationLink {
                MomentDetailView(moment: moment)
            } label: {
                // TODO: last는 무슨 역할?
                if moment == moments.last {
                    MomentHexagonView(moment: moment, layout: .large)
                } else {
                    MomentHexagonView(moment: moment)
                    // 지그재그 패턴으로 배치되도록 (왜 이런 모양으로 나오는지 이해필요)
                        .offset(x: sin(Double(index) * .pi / 2) * Self.offsetAmount)
                }
            }
            // 스크롤 할 때 트렌지션 효과
            .scrollTransition { content, phase in
                content
                    .opacity(phase.isIdentity ? 1 : 0)
                    .scaleEffect(phase.isIdentity ? 1 : 0.8)
            }
        }
    }
    
    // TODO: 이 부분 이해 필요
    @ViewBuilder private var streakHeader : some View {
        let streak = StreakCalculator().calculateStreak(for: moments)
        if streak > 0 {
            HStack {
                Text(verbatim: "\(streak)")
                Text(Image(systemName: "flame.fill"))
                    .foregroundStyle(.ember)
                Spacer()
            }
            .font(.subheadline)
            .padding()
        }
    }
}

#Preview {
    MomentsView()
        .sampleDataContainer()
}

// 왜 이 뷰에서는 플러스 버튼 누르면 에러?????? 같은 sheet를 그리고 있는거 아닌가?
#Preview("No moments") {
    MomentsView()
        .modelContainer(for: [Moment.self])
}
