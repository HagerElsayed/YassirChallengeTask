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
    private let movieDataService = MovieDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        movieDataService.$movies
            .sink { [weak self] (returnedMovies) in
                self?.movies = returnedMovies.map{MovieItem(model: $0)}
            }
            .store(in: &cancellables)
    }
    
}
