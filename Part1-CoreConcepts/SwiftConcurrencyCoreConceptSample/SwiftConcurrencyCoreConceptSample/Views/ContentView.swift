//
//  ContentView.swift
//  SwiftConcurrencyCoreConceptSample
//
//  Created by 김동현 on 3/21/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var groupViewModel = TaskGroupViewModel()
    @StateObject private var taskViewModel = TaskViewModel()
    @State private var latestStreamValue: Int = 0
    private let streamExample = AsyncStreamExample()
    private let continuationExample = ContinuationExample()

    var body: some View {
        VStack(spacing: 16) {
            // 기존 버튼들
            Button("📡 이름 가져오기") {
                Task {
                    let name = await AsyncAPI.fetchUserName()
                    print("✅ 이름: \(name)")
                }
            }

            Button("🚀 Task 실행") {
                taskViewModel.runStructuredTask()
            }

            Button("🔌 Detached Task 실행") {
                taskViewModel.runDetachedTask()
            }

            Button("🧪 Continuation 테스트") {
                Task {
                    do {
                        let result = try await continuationExample.fetchWithContinuation()
                        print("✅ Continuation 결과: \(result)")
                    } catch {
                        print("🚫 에러 발생: \(error)")
                    }
                }
            }

            Button("📈 AsyncStream 구독 시작") {
                Task {
                    for await value in streamExample.stream {
                        latestStreamValue = value
                    }
                }
            }

            Text("📊 최신 수신 값: \(latestStreamValue)")
                .padding(.top, 8)

            Button("👥 유저 병렬 로딩") {
                groupViewModel.fetchUsersConcurrently(ids: [1, 2, 3, 4, 5])
            }

            List(groupViewModel.users) { user in
                Text("🧑‍💻 \(user.name)")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
