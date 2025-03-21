# SwiftConcurrencyCallbackSample
Swift Concurrency 블로그 1편 내용을 학습하는 SwiftUI 샘플 프로젝트입니다.  
Completion Handler 기반 비동기 코드와 Async/Await 방식의 구조 차이를 체험할 수 있습니다.

## 📂 구성
- Models: User, Profile
- API: LegacyAPI (Completion Handler), AsyncAPI (Async/Await)
- ViewModels: 방식별 흐름 구현
- Views: 버튼을 눌러 각각 실행하고 로그 확인

## ✅ 실행
Xcode 14+, iOS 15+  
시뮬레이터에서 실행 후 두 버튼을 눌러 콘솔 및 화면 로그 비교
