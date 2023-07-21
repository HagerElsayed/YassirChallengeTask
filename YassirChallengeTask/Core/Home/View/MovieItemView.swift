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
            HStack {
                Image(movie.posterPath)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(20, corners: [.topLeft, .bottomRight])
                    .padding(.bottom, 20)
//                    .matchedGeometryEffect(id: lamp.id, in: namespace)

            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text(movie.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.theme.primary)
                
                Text(movie.voteCount)
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
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
