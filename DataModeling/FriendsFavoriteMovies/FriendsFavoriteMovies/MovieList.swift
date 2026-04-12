//
//  MovieList.swift
//  FriendsFavoriteMovies
//
//  Created by JENNA on 4/12/26.
//

import SwiftUI
import SwiftData

struct MovieList: View {
    @Query(sort: \Movie.title) private var movies: [Movie]
    @Environment(\.modelContext) private var context
    
    var body: some View {
        NavigationSplitView {
            List(movies) { movie in
                NavigationLink(movie.title) {
                    Text("Detail view for \(movie.title)")
                        .navigationTitle("Movie")
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
            .navigationTitle("Movies")
        } detail: {
            Text("Select a movie")
                .navigationTitle("Movie")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    MovieList()
        .modelContainer(SampleData.shared.modelContainer)
}
