//
//  ContentView.swift
//  ScoreKeeper
//
//  Created by JENNA on 4/10/26.
//

import SwiftUI

struct ContentView: View {
    @State private var scoreboard = Scoreboard()
    @State private var startingPoints = 0
    @State private var numberOfRound = 1
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Score Keeper")
                .font(.title)
                .bold()
                .padding(.bottom)
            
            SettingsView(doesHighestScoreWin: $scoreboard.doesHighestScoreWin, startingPoints: $startingPoints, numberOfRounds: $numberOfRound)
                .disabled(scoreboard.state != .setup)
            
            Grid {
                GridRow {
                    Text("Player")
                        .gridColumnAlignment(.leading)
                    Text("Score")
                        .opacity(scoreboard.state == .setup ? 0 : 1.0)
                }
                .font(.headline)
                
                ForEach($scoreboard.players) { $player in
                    GridRow {
                        HStack {
                            if scoreboard.winners.contains(player) {
                                Image(systemName: "crown.fill")
                                    .foregroundStyle(Color.yellow)
                            }
                            TextField("Name", text: $player.name)
                        }
                        Text("\(player.score)")
                        Stepper("\(player.score)", value: $player.score)
                            .labelsHidden()
                    }
                }
            }
            .padding(.vertical)
            
            Button("Add Player", systemImage: "plus") {
                scoreboard.players.append(Player(name: "", score: 0))
            }
            .opacity(scoreboard.state == .setup ? 1.0 : 0)
            Spacer()
            
            Text("Left Round: \(numberOfRound)")
            
            HStack {
                Spacer()
                
                switch scoreboard.state {
                case .setup:
                    Button("Start Game", systemImage: "play.fill") {
                        scoreboard.state = .playing
                        scoreboard.resetScores(to: startingPoints)
                    }
                    .disabled(numberOfRound == 0)
                    
                case.playing:
                    Button("End Game", systemImage: "stop.fill") {
                        scoreboard.state = .gameOver
                        numberOfRound -= 1
                    }
                    
                case.gameOver:
                    Button("Reset Game", systemImage: "arrow.counterclockwise") {
                        scoreboard.state = .setup
                    }
                }
                
                Spacer()
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            .tint(.blue)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
