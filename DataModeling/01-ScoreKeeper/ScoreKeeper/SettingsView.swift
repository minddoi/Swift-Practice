//
//  SettingsView.swift
//  ScoreKeeper
//
//  Created by JENNA on 4/11/26.
//

import SwiftUI

struct SettingsView: View {
    @Binding var doesHighestScoreWin: Bool
    @Binding var startingPoints: Int
    @Binding var numberOfRounds: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Game Rules")
                .font(.headline)
            Divider()
            Picker("Win Condition", selection: $doesHighestScoreWin) {
                Text("Highest Score Wins")
                    .tag(true)
                Text("Lowest Score Wins")
                    .tag(false)
            }
            
            Picker("Starting points", selection: $startingPoints) {
                Text("0 starting points")
                    .tag(0)
                Text("10 starting points")
                    .tag(10)
                Text("20 starting points")
                    .tag(20)
            }
            
            Picker("Selecting Round", selection: $numberOfRounds) {
                Text("Select Round")
                    .tag(0)
                Text("Round 1")
                    .tag(1)
                Text("Round 2")
                    .tag(2)
                Text("Round 3")
                    .tag(3)
            }
        }
        .padding()
        .background(.thinMaterial, in: .rect(cornerRadius: 10.0))
    }
}

#Preview {
    @Previewable @State var doesHighestScoreWin = true
    @Previewable @State var startingPoints = 10
    @Previewable @State var numberOfRounds = 1
    SettingsView(doesHighestScoreWin: $doesHighestScoreWin, startingPoints: $startingPoints, numberOfRounds: $numberOfRounds)
}
