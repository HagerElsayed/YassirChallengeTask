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
    @Published var isLoading: Bool = false
    private let movieDataService: MovieDataServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(movieDataService: MovieDataServiceProtocol = MovieDataService()) {
        self.movieDataService = movieDataService
        addSubscribers()
        self.isLoading = true
    }
    
    func addSubscribers() {
        movieDataService.moviesPublisher
            .handleEvents(receiveSubscription: { [weak self] _ in
                self?.isLoading = true
            })
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] returnedMovies in
                guard let self = self else { return }
                self.movies = returnedMovies.map { MovieItem(model: $0) }
                self.isLoading = false

            }
            .store(in: &cancellables)
    }
}
