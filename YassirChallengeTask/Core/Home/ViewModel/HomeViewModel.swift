//
//  HomeViewModel.swift
//  YassirChallengeTask
//
//  Created by Hager Elsayed on 21/07/2023.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    private let movieDataService = MovieDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        movieDataService.$movies
            .sink { [weak self] (returnedMovies) in
                self?.movies = returnedMovies
            }
            .store(in: &cancellables)
    }
    
}
