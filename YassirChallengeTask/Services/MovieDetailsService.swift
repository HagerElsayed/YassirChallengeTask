//
//  MovieDetailsService.swift
//  YassirChallengeTask
//
//  Created by Hager Elsayed on 23/07/2023.
//

import Foundation
import Combine

protocol MovieDetailsServiceProtocol: AnyObject {
    var movie: Movie { get set }
    var moviePublisher: AnyPublisher<Movie, Never> { get }
    func getMovie(id: Int)
}

class MovieDetailsService: MovieDetailsServiceProtocol {
    private var movieSubscription: AnyCancellable?
    @Published var movie: Movie = Movie()
    var moviePublisher: AnyPublisher<Movie, Never> { $movie.eraseToAnyPublisher() }
    
    init(id: Int) {
        getMovie(id: id)
    }
    
    func getMovie(id: Int) {
        guard let url = URL(string: APIConfiguration.moviesById(id: String(id))) else { return }
        movieSubscription = NetworkManager.get(url: url)
            .decode(type: Movie.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] (returnedMovie) in
                guard let self = self else { return }
                self.movie = returnedMovie
                self.movieSubscription?.cancel()
            })
    }
}
