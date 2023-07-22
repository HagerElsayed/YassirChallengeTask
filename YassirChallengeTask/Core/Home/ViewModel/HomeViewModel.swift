//
//  HomeViewModel.swift
//  YassirChallengeTask
//
//  Created by Hager Elsayed on 21/07/2023.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var movies: [MovieItem] = []
    let movieDataService: MovieDataServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(movieDataService: MovieDataServiceProtocol = MovieDataService()) {
        self.movieDataService = movieDataService
        addSubscribers()
    }
    
    func addSubscribers() {
        movieDataService.moviesPublisher
            .sink { [weak self] (returnedMovies) in
                guard let self = self else { return }
                self.movies = returnedMovies.map { MovieItem(model: $0) }
            }
            .store(in: &cancellables)
    }
}
