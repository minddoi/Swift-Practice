## 스위프트 스터디  
### Data Modeling

### 📝 공부내용

- SwiftUI는 **상태가 바뀌면 UI가 자동으로 업데이트되는 구조**
- `@Observable`을 사용하면 상태 변경이 UI에 자동 반영됨
- `.environment()`를 통해 데이터를 여러 View에서 공유 가능 → View 간 결합도 감소
- `onChange`는 상태 변화 시 UI 반응을 처리하는 트리거
- `Task`와 `await`를 사용해 UI를 멈추지 않고 비동기 처리 가능  
  → `Task.sleep`으로 딜레이 구현
- UI에 영향을 주는 상태 변경은 `@MainActor`에서 실행해야 함
- `zip`으로 두 배열을 동시에 순회하고, `sorted`로 정렬 가능
- 사용자 순서와 정답(알파벳 순)을 비교하여 결과를 판단하는 구조
- 상태값(`flipped`)으로 카드 UI 변화 제어

---

### Ch3-4 과제 캡쳐본

<div style="display: flex; justify-content: center;">
  <img src="https://github.com/user-attachments/assets/32ad1b6b-cc22-4b48-9bf9-a767b0a5e4f2" width="250" />
</div>
