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
    @StateObject private var viewModel: DetailsViewModel
    // i handled the details with details endpoint as mentioned in the Docs but i prefer to pass the object since we already have it from the list
    init(
        namespace: Namespace.ID = Namespace().wrappedValue,
        detailsData: Binding<MovieItem> = .constant(MovieItem(model: DeveloperPreview.instance.movie)),
        isDetails: Binding<Bool> = .constant(true),
        viewModel: DetailsViewModel = DetailsViewModel() 
    ) {
        self._movie = detailsData
        self._isDetails = isDetails
        self.namespace = namespace
        _viewModel = StateObject(wrappedValue: viewModel)
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
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.top, 30)
                    
                    Text("Overview:")
                        .foregroundColor(Color.theme.primary)
                        .fontWeight(.regular)
                        .font(.headline)
                        .padding(.vertical,5)
                    
                    Text(movie.overview)
                        .foregroundColor(Color.theme.secondaryText)
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
        .background(Color.theme.background)
    }
}



struct MovieDetails_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MovieDetails()
            MovieDetails()
                .preferredColorScheme(.dark)
        }
        
    }
}
