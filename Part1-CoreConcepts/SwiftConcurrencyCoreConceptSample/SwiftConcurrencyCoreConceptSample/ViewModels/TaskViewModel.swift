//
//  TaskViewModel.swift
//  SwiftConcurrencyCoreConceptSample
//
//  Created by 김동현 on 3/22/25.
//

import Foundation

@MainActor
final class TaskViewModel: ObservableObject {

    func runStructuredTask() {
        print("✅ [Task] 시작")

        Task {
            let result = await simulatedWork("홍길동")

            await MainActor.run {
                print("✅ [Task] 완료: \(result) | 스레드: \(Thread.isMainThread ? "Main" : "Background")")
            }
        }
    }

    func runDetachedTask() {
        print("⚠️ [Detached Task] 시작")

        Task.detached {
            let result = await self.simulatedWork("이순신")

            await MainActor.run {
                print("⚠️ [Detached Task] 완료: \(result) | 스레드: \(Thread.isMainThread ? "Main" : "Background")")
            }
        }
    }

    private func simulatedWork(_ name: String) async -> String {
        try? await Task.sleep(nanoseconds: 500_000_000)
        return name
    }
}
