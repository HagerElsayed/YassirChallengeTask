//
//  PreviewProvider.swift
//  YassirChallengeTask
//
//  Created by Hager Elsayed on 21/07/2023.
//

import SwiftUI

extension PreviewProvider {
    static var developerPreview: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    static let instance = DeveloperPreview()
    
    private init() {
        initializeMovieItem()
    }
    let homeViewModel = HomeViewModel()
    let movie = Movie(
        id: 1,
        adult: false,
        originalTitle: "Movie",
        title: "Movie",
        overview: "Movie OverView",
        popularity: 84,
        posterPath: "\(APIConfiguration.posterW500)gPbM0MK8CP8A174rmUwGsADNYKD.jpg",
        voteAverage: 7.3,
        voteCount: 100
    )
   
    var movieItem: MovieItem?
    func initializeMovieItem() {
        movieItem = MovieItem(model: movie)
    }
    @Namespace var namespace
    
}
