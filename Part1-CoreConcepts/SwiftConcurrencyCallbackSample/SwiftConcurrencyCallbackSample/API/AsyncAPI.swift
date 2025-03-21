//
//  AsyncAPI.swift
//  SwiftConcurrencyCallbackSample
//
//  Created by 김동현 on 3/21/25.
//

import Foundation

struct AsyncAPI {
    static func login(email: String, password: String) async throws -> User {
        try await Task.sleep(nanoseconds: 1_000_000_000)
        return User(id: 1, name: "Donghyun")
    }

    static func fetchProfile(userID: Int) async throws -> Profile {
        try await Task.sleep(nanoseconds: 1_000_000_000)
        return Profile(imageURL: "https://example.com/image.png")
    }

    static func downloadImage(from url: String) async throws -> String {
        try await Task.sleep(nanoseconds: 1_000_000_000)
        return "📸 \(url) 이미지 다운로드 완료"
    }
}

