//
//  AsyncStreamExample.swift
//  SwiftConcurrencyCoreConceptSample
//
//  Created by 김동현 on 3/22/25.
//

import Foundation

final class AsyncStreamExample {
    var continuation: AsyncStream<Int>.Continuation?

    lazy var stream: AsyncStream<Int> = {
        AsyncStream<Int> { continuation in
            self.continuation = continuation

            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                let value = Int.random(in: 1...100)
                continuation.yield(value)
            }
        }
    }()
}
