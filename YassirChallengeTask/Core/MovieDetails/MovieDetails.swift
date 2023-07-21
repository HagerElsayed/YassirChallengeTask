//
//  MovieDetails.swift
//  YassirChallengeTask
//
//  Created by Hager Elsayed on 21/07/2023.
//

import SwiftUI

struct MovieDetails: View {
    @Binding var movie: MovieItem
    @Binding var isDetails: Bool
    let namespace: Namespace.ID
    init(
        namespace: Namespace.ID = Namespace().wrappedValue,
        detailsData: Binding<MovieItem> = .constant(MovieItem(model: DeveloperPreview.instance.movie)),
        isDetails: Binding<Bool> = .constant(true)
    ) {
        self._movie = detailsData
        self._isDetails = isDetails
        self.namespace = namespace
    }
    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    MovieImageView(movie: movie)
                        .matchedGeometryEffect(id: movie.id, in: namespace)
                    VStack {
                       BackButton(isDetails: $isDetails)
                        .padding(.top, 80)
                        Spacer()
                    }
                    
                }
                
                VStack(alignment: .leading) {
                    Text(movie.title)
                        .foregroundColor(Color.theme.primary)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 30)
                    
                    Text("OverView:")
                        .fontWeight(.regular)
                        .font(.title3)
                    
                    Text(movie.overview)
                        .foregroundColor(.gray)
                        .fontWeight(.light)
                        .padding(.bottom, 20)
       
                    
                }
                .padding(.horizontal, 30)
                .frame(width: UIScreen.main.bounds.width)
                .background(Color.theme.background)
                .cornerRadius(100, corners: [.topRight])
                .offset(y: -120)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}



struct MovieDetails_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetails()
    }
}
