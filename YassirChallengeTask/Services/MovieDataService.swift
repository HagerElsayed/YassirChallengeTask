//
//  MovieDataService.swift
//  YassirChallengeTask
//
//  Created by Hager Elsayed on 21/07/2023.
//

import Foundation
import Combine

protocol MovieDataServiceProtocol: AnyObject {
    var movies: [Movie] { get set }
    var moviesPublisher: AnyPublisher<[Movie], Never> { get }
    func getMovies()
}

class MovieDataService: MovieDataServiceProtocol {
    private var movieSubscription: AnyCancellable?
    @Published var movies: [Movie] = []
    var moviesPublisher: AnyPublisher<[Movie], Never> { $movies.eraseToAnyPublisher() }

    init() {
        getMovies()
    }
    
    func getMovies() {
        guard let url = URL(string: APIConfiguration.trendingMovies) else { return }
        movieSubscription = NetworkManager.get(url: url)
            .decode(type: MovieResponse.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] (returnedMovies) in
                self?.movies = returnedMovies.results ?? []
                self?.movieSubscription?.cancel()
            })
    }
}
