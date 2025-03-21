//
//  ContentView.swift
//  SwiftConcurrencyCallbackSample
//
//  Created by 김동현 on 3/21/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var callbackVM = CallbackViewModel()
    @StateObject private var asyncVM = AsyncViewModel()

    var body: some View {
        VStack(spacing: 24) {
            Text("🔁 Completion Handler 방식")
                .font(.headline)
            Button("Run Callback Hell") {
                callbackVM.runFlow()
            }
            ForEach(callbackVM.log, id: \.self) { line in
                Text(line)
            }

            Divider().padding(.vertical)

            Text("🧵 Async/Await 방식")
                .font(.headline)
            Button("Run Async Flow") {
                asyncVM.runFlow()
            }
            ForEach(asyncVM.log, id: \.self) { line in
                Text(line)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
