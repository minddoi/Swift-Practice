//
//  FriendDetail.swift
//  FriendsFavoriteMovies
//
//  Created by JENNA on 4/13/26.
//

import SwiftUI
import SwiftData

struct FriendDetail: View {
    //Binding은 값 하나 연결, @Bindable은 객체 전체를 바인딩 가능하게 만들어주는 것
    @Bindable var friend: Friend
    
    let isNew: Bool
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    init(friend: Friend, isNew: Bool = false) {
        self.friend = friend
        self.isNew = isNew
    }
    
    var body: some View {
        Form {
            TextField("Name", text: $friend.name)
                .autocorrectionDisabled() //자동완성 off
        }
        .navigationTitle(isNew ? "New Friend" : "Friend")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if isNew {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        dismiss() //지금 열려 있는 화면을 닫기
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel"){
                        context.delete(friend)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        FriendDetail(friend: SampleData.shared.friend)
    }
}

#Preview("New Friend") {
    NavigationStack {
        FriendDetail(friend: SampleData.shared.friend, isNew: true)
    }
}
