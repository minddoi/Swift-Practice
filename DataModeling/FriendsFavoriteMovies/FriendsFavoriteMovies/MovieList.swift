//
//  MovieList.swift
//  FriendsFavoriteMovies
//
//  Created by JENNA on 4/12/26.
//

import SwiftUI
import SwiftData

struct MovieList: View {
    @Query private var movies: [Movie]
    @Environment(\.modelContext) private var context
    @State private var newMovie: Movie?
    
    // #Predicate : SwiftData가 DB 쿼리로 변환할 수 있도록 특별하게 처리되는 문법
    init(titleFilter: String = "") {
        let predicate = #Predicate<Movie> { movie in
            // 검색어 없으면 전체, 있으면 포함된 것만
            titleFilter.isEmpty || movie.title.localizedStandardContains(titleFilter)
        }
        
        // @Query는 내부에 _movies라는 숨겨진 변수로 동작하고, custom 설정할 때는 그걸 직접 초기화해야 한다
        _movies = Query(filter: predicate, sort: \Movie.title)
    }
    
    var body: some View {
        Group {
            if !movies.isEmpty {
                List {
                    ForEach(movies) { movie in
                        NavigationLink(movie.title) {
                            MovieDetail(movie: movie)
                        }
                    }
                    .onDelete(perform: deleteMovies(indexes:))
                }
            } else {
                ContentUnavailableView("Add Movies", systemImage: "film.stack")
            }
        }
        .navigationTitle("Movies")
        .toolbar {
            ToolbarItem {
                Button("Add movie", systemImage: "plus", action: addMovie)
            }
            ToolbarItem (placement: .topBarTrailing){
                EditButton()
            }
        }
        .sheet(item: $newMovie) { movie in
            NavigationStack {
                MovieDetail(movie: movie, isNew: true)
            }
            .interactiveDismissDisabled()
        }
    }
    
    private func addMovie() {
//        context.insert(Movie(title: "new movie", releaseDate: .now))
        let newMovie = Movie(title: "new movie", releaseDate: .now)
        context.insert(newMovie)
        self.newMovie = newMovie
    }
    
    private func deleteMovies(indexes: IndexSet) {
        for index in indexes {
            context.delete(movies[index])
        }
    }
}

#Preview {
    NavigationStack {
        MovieList()
            .modelContainer(SampleData.shared.modelContainer)
    }
}

#Preview("Filtered") {
    NavigationStack {
        MovieList(titleFilter: "악")
            .modelContainer(SampleData.shared.modelContainer)
    }
}

#Preview("Empty List") {
    MovieList()
        .modelContainer(for: Movie.self, inMemory: true)
}
