//
//  ContentView.swift
//  FriendsFavoriteMovies
//
//  Created by JENNA on 4/12/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Friends", systemImage: "person.and.person") {
                FriendList()
            }
            Tab("Movies", systemImage: "film.stack") {
                MovieList()
            }
        }
    }
}

#Preview {
    ContentView()
        //이 View가 사용할 DB를 SampleData의 DB로 지정하는 것
        .modelContainer(SampleData.shared.modelContainer)
}
