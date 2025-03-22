//
//  TaskGroupViewModel.swift
//  SwiftConcurrencyCoreConceptSample
//
//  Created by 김동현 on 3/22/25.
//

import Foundation

@MainActor
final class TaskGroupViewModel: ObservableObject {
    @Published var users: [User] = []

    func fetchUsersConcurrently(ids: [Int]) {
        Task {
            do {
                let result = try await fetchAll(ids: ids)
                self.users = result
            } catch {
                print("🚫 에러 발생: \(error)")
            }
        }
    }

    private func fetchAll(ids: [Int]) async throws -> [User] {
        try await withThrowingTaskGroup(of: User.self) { group in
            for id in ids {
                group.addTask {
                    try await self.fetchUser(id: id)
                }
            }

            var result: [User] = []

            for try await user in group {
                result.append(user)
            }

            return result
        }
    }

    private func fetchUser(id: Int) async throws -> User {
        try await Task.sleep(nanoseconds: UInt64.random(in: 300_000_000...700_000_000))
        return User(id: id, name: "사용자 \(id)")
    }
}
