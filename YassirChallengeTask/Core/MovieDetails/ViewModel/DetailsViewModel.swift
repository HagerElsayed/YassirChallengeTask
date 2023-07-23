//
//  DetailsViewModel.swift
//  YassirChallengeTask
//
//  Created by Hager Elsayed on 23/07/2023.
//

import Foundation
import Combine

class DetailsViewModel: ObservableObject {
    @Published var movie: MovieItem = MovieItem.empty
    private let movieDetailsService: MovieDetailsServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(
        movieDetailsService: MovieDetailsServiceProtocol = MovieDetailsService(id: 0),
        id: Int = 0
    ) {
        self.movieDetailsService = movieDetailsService
        addSubscribers(id: id)
    }
    
    func addSubscribers(id: Int) {
        movieDetailsService.getMovie(id: id)
        movieDetailsService.moviePublisher
            .sink { [weak self] (returnedMovie) in
                guard let self = self else { return }
                self.movie =  MovieItem(model: returnedMovie)
            }
            .store(in: &cancellables)
    }
}

