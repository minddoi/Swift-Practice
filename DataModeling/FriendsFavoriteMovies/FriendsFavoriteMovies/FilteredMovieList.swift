//
//  FilteredMovieList.swift
//  FriendsFavoriteMovies
//
//  Created by JENNA on 4/16/26.
//

import SwiftUI
import SwiftData

struct FilteredMovieList: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationSplitView {
            MovieList(titleFilter: searchText)
                .searchable(text: $searchText)
        } detail: {
            Text("Select a movie")
                .navigationTitle("Movie")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    FilteredMovieList()
        .modelContainer(SampleData.shared.modelContainer)
}
