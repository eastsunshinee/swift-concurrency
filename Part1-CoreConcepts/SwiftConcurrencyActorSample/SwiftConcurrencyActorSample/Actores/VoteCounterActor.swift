//
//  VoteCounterActor.swift
//  SwiftConcurrencyActorSample
//
//  Created by 김동현 on 3/23/25.
//

import Foundation

actor VoteCounterActor {
    private var count: Int = 0

    func vote() {
        count += 1
    }

    func currentCount() -> Int {
        return count
    }
}
