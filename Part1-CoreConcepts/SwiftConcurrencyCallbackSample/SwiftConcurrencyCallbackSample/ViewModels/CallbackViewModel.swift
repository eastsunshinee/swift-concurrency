//
//  CallbackViewModel.swift
//  SwiftConcurrencyCallbackSample
//
//  Created by 김동현 on 3/21/25.
//

import Foundation

final class CallbackViewModel: ObservableObject {
    @Published var log: [String] = []

    func runFlow() {
        log = []

        LegacyAPI.login(email: "user@example.com", password: "1234") { result in
            switch result {
            case .success(let user):
                self.log.append("✅ 로그인: \(user.name)")

                LegacyAPI.fetchProfile(userID: user.id) { profileResult in
                    switch profileResult {
                    case .success(let profile):
                        self.log.append("👤 프로필: \(profile.imageURL)")

                        LegacyAPI.downloadImage(from: profile.imageURL) { imageResult in
                            switch imageResult {
                            case .success(let message):
                                self.log.append(message)
                            case .failure(let error):
                                self.log.append("❌ 이미지 오류: \(error)")
                            }
                        }

                    case .failure(let error):
                        self.log.append("❌ 프로필 오류: \(error)")
                    }
                }

            case .failure(let error):
                self.log.append("❌ 로그인 오류: \(error)")
            }
        }
    }
}
