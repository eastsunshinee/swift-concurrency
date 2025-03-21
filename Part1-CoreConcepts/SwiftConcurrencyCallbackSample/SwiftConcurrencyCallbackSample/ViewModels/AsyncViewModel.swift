//
//  AsyncViewModel.swift
//  SwiftConcurrencyCallbackSample
//
//  Created by 김동현 on 3/21/25.
//

import Foundation

@MainActor
final class AsyncViewModel: ObservableObject {
    @Published var log: [String] = []

    func runFlow() {
        log = []

        Task {
            do {
                let user = try await AsyncAPI.login(email: "user@example.com", password: "1234")
                log.append("✅ 로그인: \(user.name)")

                let profile = try await AsyncAPI.fetchProfile(userID: user.id)
                log.append("👤 프로필: \(profile.imageURL)")

                let imageResult = try await AsyncAPI.downloadImage(from: profile.imageURL)
                log.append(imageResult)

            } catch {
                log.append("❌ 오류 발생: \(error.localizedDescription)")
            }
        }
    }
}
