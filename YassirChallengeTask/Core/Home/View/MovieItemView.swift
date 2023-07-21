//
//  MovieItemView.swift
//  YassirChallengeTask
//
//  Created by Hager Elsayed on 20/07/2023.
//

import SwiftUI

struct MovieItemView: View {
    var movie: MovieItem
    let namespace: Namespace.ID
    var body: some View {
        VStack(alignment: .leading) {
            MovieImageView(movie: movie)
            VStack(alignment: .leading, spacing: 10) {
                Text(movie.title)
                    .font(.headline)                    .fontWeight(.bold)
                    .foregroundColor(Color.theme.primary)
                
                Text(movie.voteCount)
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.secondaryText)
            }
        }
    }
}

struct MovieItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            MovieItemView(
                movie: developerPreview.movieItem ?? MovieItem(model: developerPreview.movie),
                namespace: developerPreview.namespace
            )
            .previewLayout(.sizeThatFits)
            
            MovieItemView(
                movie: developerPreview.movieItem ?? MovieItem(model: developerPreview.movie),
                namespace: developerPreview.namespace
            )
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
        }
    }
}
