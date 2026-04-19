## 스위프트 스터디  
### Data Modeling

### Ch4 과제 캡쳐본

<div style="display: flex; flex-direction: column; align-items: center; gap: 12px;">
  <img src="https://github.com/user-attachments/assets/0ad46468-a11c-4765-8120-61748b879e30" width="250" />
  <img src="https://github.com/user-attachments/assets/75bb123f-a91c-4550-9dd2-2d6aa441ab02" width="250" />
  <img src="https://github.com/user-attachments/assets/3bf41366-ebe7-4beb-a70a-9127ff0a1461" width="250" />
</div>

---

#### 🔹 SwiftUI 상태 기반 구조  
- SwiftUI는 상태가 바뀌면 UI가 자동으로 업데이트되는 구조  
- 흐름: 유저 행동 → 상태 변경 → UI 반응  

#### 🔹 @Observable + Environment  
- @Observable로 상태를 관리하면 프로퍼티 변경이 UI에 자동 반영됨  
- .environment()를 사용하면 데이터를 여러 View에서 공유 가능  
- View 간 의존성을 줄여 구조를 단순화할 수 있음  

#### 🔹 onChange  
- 특정 값이 바뀌었을 때 실행되는 트리거  
- 상태 변화에 따른 UI 반응 처리에 사용  

#### 🔹 비동기 처리 (Task, await)  
- Task {}로 비동기 코드 실행  
- await Task.sleep으로 UI를 멈추지 않고 딜레이 처리  
- UI에 영향을 주는 상태 변경은 @MainActor에서 실행  

#### 🔹 배열 처리 (zip, sorted)  
- zip → 두 배열을 동시에 순회  
- sorted → 특정 기준으로 정렬  

#### 🔹 핵심 로직 구조  
- 사용자 순서와 정답(알파벳 순) 배열을 비교하여 결과 판단  
- 상태값(flipped)을 통해 UI 변화 제어  
