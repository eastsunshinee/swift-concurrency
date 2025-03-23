//
//  VoteViewModel.swift
//  SwiftConcurrencyActorSample
//
//  Created by 김동현 on 3/23/25.
//

import Foundation

@MainActor
final class VoteViewModel: ObservableObject {
    @Published var voteCount: Int = 0
    private let counter = VoteCounterActor()

    func castSingleVote() {
        Task {
            await counter.vote()
            voteCount = await counter.currentCount()
        }
    }

    func castMassVoting(times: Int) {
        Task {
            await withTaskGroup(of: Void.self) { group in
                for _ in 1...times {
                    group.addTask {
                        await self.counter.vote()
                    }
                }
            }
            voteCount = await counter.currentCount()
        }
    }
}
