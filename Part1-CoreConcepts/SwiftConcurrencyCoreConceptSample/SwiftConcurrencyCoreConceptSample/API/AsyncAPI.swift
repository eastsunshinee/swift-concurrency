//
//  AsyncAPI.swift
//  SwiftConcurrencyCoreConceptSample
//
//  Created by 김동현 on 3/22/25.
//

import Foundation

struct AsyncAPI {
    static func fetchNumber() async -> Int {
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        return Int.random(in: 1...100)
    }

    static func fetchUserName() async -> String {
        try? await Task.sleep(nanoseconds: 500_000_000)
        return ["Alice", "Bob", "Charlie", "Diana"].randomElement() ?? "Unknown"
    }
}
