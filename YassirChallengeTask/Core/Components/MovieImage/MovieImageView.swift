//
//  MovieImageView.swift
//  YassirChallengeTask
//
//  Created by Hager Elsayed on 21/07/2023.
//

import SwiftUI

struct MovieImageView: View {
    @StateObject var movieImageViewModel: MovieImageViewModel
    
    init(movie: MovieItem) {
        _movieImageViewModel = StateObject(wrappedValue: MovieImageViewModel(movie: movie))
    }
    var body: some View {
        ZStack {
            if let image = movieImageViewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(20, corners: [.topLeft, .bottomRight])
                    .padding(.bottom, 12)
            } else if movieImageViewModel.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(Color.theme.secondaryText)
            }
        }
    }
}

struct MovieImageView_Previews: PreviewProvider {
    static var previews: some View {
        MovieImageView(movie: developerPreview.movieItem ?? MovieItem(model: developerPreview.movie))
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
