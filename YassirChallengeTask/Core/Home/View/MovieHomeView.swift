//
//  MovieHomeView.swift
//  YassirChallengeTask
//
//  Created by Hager Elsayed on 20/07/2023.
//

import SwiftUI

struct MovieHomeView: View {
    @EnvironmentObject private var viewModel: HomeViewModel
    @Binding var movie: MovieItem
    @Binding var isDetails: Bool
    
    let namespace: Namespace.ID
    init(
        namespace: Namespace.ID = Namespace().wrappedValue,
        detailsData: Binding<MovieItem> = .constant(MovieItem(model: DeveloperPreview.instance.movie)),
        isDetails: Binding<Bool> = .constant(false)
        
    ) {
        self.namespace = namespace
        self._movie = detailsData
        self._isDetails = isDetails
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                allMoviesList
            }
        }
        .ignoresSafeArea()
        .padding(16)
        .background(Color.theme.background)
        
    }
}

extension MovieHomeView {
    private var allMoviesList: some View {
        LazyVGrid(
            columns: [
                GridItem(.adaptive(minimum: 150), spacing: 20)
            ],
            spacing: 30
        ) {
            ForEach(viewModel.movies) { movie in
                MovieItemView(movie: movie, namespace: namespace)
                    .matchedGeometryEffect(id: movie.id, in: namespace)
                    .onTapGesture {
                        // Mark: - go to Details screen
                        withAnimation(.spring()) {
                            self.movie = movie
                            self.isDetails.toggle()
                        }
                    }
            }
        }
        .padding(16)
    }
}
struct MovieHomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MovieHomeView()
                .environmentObject(developerPreview.homeViewModel)
            MovieHomeView()
                .environmentObject(developerPreview.homeViewModel)
                .preferredColorScheme(.dark)
        }
        
    }
    
}
