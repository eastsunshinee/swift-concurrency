//
//  ContinuationExample.swift
//  SwiftConcurrencyCoreConceptSample
//
//  Created by 김동현 on 3/22/25.
//

import Foundation

final class ContinuationExample {

    // 기존 Completion 기반 API
    func legacyFetch(completion: @escaping (Result<String, Error>) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            if Bool.random() {
                completion(.success("🎯 성공적인 응답"))
            } else {
                completion(.failure(URLError(.badServerResponse)))
            }
        }
    }

    // Swift Concurrency로 감싼 async 함수
    func fetchWithContinuation() async throws -> String {
        try await withCheckedThrowingContinuation { continuation in
            legacyFetch { result in
                switch result {
                case .success(let value):
                    continuation.resume(returning: value)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
