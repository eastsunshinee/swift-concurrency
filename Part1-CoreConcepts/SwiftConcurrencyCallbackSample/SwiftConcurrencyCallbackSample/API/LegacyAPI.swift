//
//  LegacyAPI.swift
//  SwiftConcurrencyCallbackSample
//
//  Created by 김동현 on 3/21/25.
//

import Foundation

enum MockError: Error {
    case failed
}

struct LegacyAPI {
    static func login(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(.success(User(id: 1, name: "Donghyun")))
        }
    }

    static func fetchProfile(userID: Int, completion: @escaping (Result<Profile, Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(.success(Profile(imageURL: "https://example.com/image.png")))
        }
    }

    static func downloadImage(from url: String, completion: @escaping (Result<String, Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(.success("📸 \(url) 이미지 다운로드 완료"))
        }
    }
}
