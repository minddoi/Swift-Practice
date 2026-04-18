//
//  ContentView.swift
//  Birthdays
//
//  Created by JENNA on 4/11/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query(sort: \Friend.birthday) private var friends: [Friend]
    @Environment(\.modelContext) private var context
    
    @State private var newName = ""
    @State private var newDate = Date.now
    
    var body: some View {
        NavigationStack {
            List(friends) { friend in
                HStack {
                    if friend.isBirthdayToday {
                        Image(systemName: "birthday.cake")
                    }
                    
                    Text(friend.name)
                        .bold(friend.isBirthdayToday)
                        .foregroundStyle(friend.isBirthdayToday ? .cyan : .primary)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                }
            }
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 20) {
                    Text("New Birthday")
                        .font(.headline)
                    DatePicker(selection: $newDate, in: Date.distantPast...Date.now, displayedComponents: .date) {
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }
                    Button("Save") {
                        let newFriend = Friend(name: newName, birthday: newDate)
                        context.insert(newFriend)
                        
                        //입력 후 빈 값으로 초기화
                        newName = ""
                        newDate = .now
                    }
                    .bold()
                    
                }
                .padding()
                .background(.bar)
            }
            //view를 그리기 전에 젤 먼저 확인? like 샘플데이터
            //simulator은 영구 저장 -> 실행할 때마다 데이터 누적
            .task {
                context.insert(Friend(name: "Jenna", birthday: .now))
                context.insert(Friend(name: "Sol", birthday: Date(timeIntervalSince1970: 0)))
            }
        }
    }
}

#Preview {
    ContentView()
    //preview에서 데이터가 저장되지 않도록 inMemory: true로 지정해서 초기화되도록
        .modelContainer(for: Friend.self, inMemory: true)
}
