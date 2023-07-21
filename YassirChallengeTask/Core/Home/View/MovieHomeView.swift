//
//  MovieHomeView.swift
//  YassirChallengeTask
//
//  Created by Hager Elsayed on 20/07/2023.
//

import SwiftUI

struct MovieHomeView: View {
    @EnvironmentObject private var viewModel: HomeViewModel
    let namespace: Namespace.ID
    init(
        namespace: Namespace.ID = Namespace().wrappedValue
    ) {
        self.namespace = namespace
    }
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                allMoviesList
            }
        }
        .ignoresSafeArea()
    }
}

extension MovieHomeView {
    private var allMoviesList: some View {
        LazyVGrid(
            columns: [
                GridItem(.adaptive(minimum: 150), spacing: 20)
            ],
            spacing: 25
        ) {
            ForEach(viewModel.movies) { movie in
                MovieItemView(movie: movie, namespace: namespace)
                    .matchedGeometryEffect(id: movie.id, in: namespace)
                    .onTapGesture {
                        // TODO: - go to Details screen
                        withAnimation(.spring()) {
                        }
                    }
            }
        }
        .padding()
    }
}
struct MovieHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MovieHomeView()
            .environmentObject(developerPreview.homeViewModel)
    }
    
}
