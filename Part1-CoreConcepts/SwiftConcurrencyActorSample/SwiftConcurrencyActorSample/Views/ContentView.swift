//
//  ContentView.swift
//  SwiftConcurrencyActorSample
//
//  Created by 김동현 on 3/23/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = VoteViewModel()

    var body: some View {
        VStack(spacing: 20) {
            Text("총 투표 수: \(viewModel.voteCount)")
                .font(.largeTitle)

            Button("📩 1표 투표하기") {
                viewModel.castSingleVote()
            }

            Button("🔥 1000명 동시 투표 시뮬레이션") {
                viewModel.castMassVoting(times: 1000)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
