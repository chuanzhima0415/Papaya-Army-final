//
//  RaceResultView.swift
//  Papaya Army
//
//  Created by 马传智 on 2025/4/27.
//

import SwiftUI

struct RaceResultView: View {
    var year: String
    var round: Int
    @State private var raceResults: [RaceResult]?
    var body: some View {
        NavigationStack {
            ZStack {
                if let raceResults {
                    List {
                        Section("Top 3") {
                            ForEach(0..<min(3, raceResults.count), id: \.self) {
                                number in
                                RaceResultRowItemView(
                                    position: number + 1,
                                    raceResult: raceResults[number]
                                )
                            }
                            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                Button {
                                    // do something
                                } label: {
                                    Label("Good Job!", systemImage: "hand.thumbsup")
                                }
                            }
                        }
                        Section("4-10") {
                            ForEach(3..<min(10, raceResults.count), id: \.self) {
                                number in
                                RaceResultRowItemView(
                                    position: number + 1,
                                    raceResult: raceResults[number]
                                )
                            }
                            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                Button {
                                    // do something
                                } label: {
                                    Label("Good Job!", systemImage: "hand.thumbsup")
                                }
                            }
                        }
                        Section("Others") {
                            ForEach(10..<raceResults.count, id: \.self) { number in
                                RaceResultRowItemView(
                                    position: number + 1,
                                    raceResult: raceResults[number]
                                )
                            }
                            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                Button {
                                    // do something
                                } label: {
                                    Label("Good Job!", systemImage: "hand.thumbsup")
                                }
                            }
                        }
                    }
                    .navigationTitle("Race")
                }

                LottieView(name: .loading, animationSpeed: 0.5, loopMode: .loop)
                    .opacity(raceResults == nil ? 1 : 0)
            }
        }
        .task {
            raceResults = await RaceResultManager.shared.retrieveCertainRaceResult(year: year, round: round)
        }
    }
}

#Preview {
    RaceResultView(year: "2025", round: 1)
}
