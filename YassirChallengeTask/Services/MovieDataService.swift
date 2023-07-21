//
//  MovieDataService.swift
//  YassirChallengeTask
//
//  Created by Hager Elsayed on 21/07/2023.
//

import Foundation
import Combine

class MovieDataService {
    
    @Published var movies: [Movie] = []
    var movieSubscription: AnyCancellable?
    init() {
        getMovies()
    }
    
    private func getMovies() {
        guard let url = URL(string: APIConfiguration.trendingMovies) else { return }
        movieSubscription = NetworkManager.get(url: url)
            .decode(type: MovieResponse.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] (returnedMovies) in
                self?.movies = returnedMovies.results ?? []
                self?.movieSubscription?.cancel()
            })
    }
}
