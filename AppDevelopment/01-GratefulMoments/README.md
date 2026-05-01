## 스위프트 스터디  
### App Development

### Ch1-1 과제 캡쳐본

<div style="display: flex; flex-direction: column; align-items: center; gap: 12px;">
  <img src="https://github.com/user-attachments/assets/6b463e01-7522-454e-8fd2-ae3e45a0db66" width="250" />
  <img src="https://github.com/user-attachments/assets/7d080227-b037-4ac8-b1d5-89e88e2c959c" width="255" />
</div>

---

### Ch1-2 과제 캡쳐본

<div style="display: flex; flex-direction: column; align-items: center; gap: 12px;">
  <img src="https://github.com/user-attachments/assets/23021507-4be5-400f-bbbf-27b45d0f3a26" width="250" />
  <img src="https://github.com/user-attachments/assets/bca87006-94ac-4c9e-a482-be1b1f8e9dc5" width="255" />
  <img src="https://github.com/user-attachments/assets/d534cac6-035e-44f8-b526-47a92e0bace7" width="250" />
  <img src="https://github.com/user-attachments/assets/9afa73ef-258d-4fb9-bcc6-6f71830bd4bf" width="250" />
</div>

---

### Ch2 과제 캡쳐본

<div style="display: flex; flex-direction: column; align-items: center; gap: 12px;">
  <img src="https://github.com/user-attachments/assets/56adf12a-5227-4001-a61e-0aadf6841147" width="250" />
  <img src="https://github.com/user-attachments/assets/d97a6fcd-9cd8-41cd-8400-8f81ea106228" width="250" />
  <img src="https://github.com/user-attachments/assets/9dcdaeea-79ce-4958-8ceb-9f055711a435" width="250" />
</div>

---

### Ch3-1 과제 캡쳐본

---

### Ch3-2 과제 캡쳐본

---

#### 🔹 SwiftUI 상태 기반 구조
- 상태가 바뀌면 UI가 자동으로 업데이트됨  
- 흐름: `사용자 입력 → 상태 변경 → UI 반응`

#### 🔹 Environment & 데이터 공유
- `.environment()`로 데이터를 여러 View에서 공유  
- View 간 의존성을 줄이고 구조 단순화

#### 🔹 비동기 처리
- `Task`, `await`로 UI를 멈추지 않고 작업 처리  
- UI 상태 변경은 `@MainActor`에서 실행

#### 🔹 커스텀 View (@ViewBuilder)
- 여러 View를 하나의 컴포넌트에 전달 가능  
- 재사용 가능한 UI 구조 설계

#### 🔹 데이터 처리 핵심
- `zip` → 두 배열 동시 처리  
- `sorted` → 정렬  
- `FetchDescriptor` → SwiftData 조회 조건

#### 🔹 상태 기반 UI 제어
- 상태값으로 UI 변화 (ex. 카드 뒤집기)
- `onChange`로 상태 변화에 따른 UI 반응 처리

#### 🔹 핵심 설계 개념
- 로직은 Model, 표현은 View  
- 의존성은 한 곳(DataContainer)에서 관리
