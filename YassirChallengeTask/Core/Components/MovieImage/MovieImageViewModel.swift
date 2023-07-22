//
//  MovieViewModel.swift
//  YassirChallengeTask
//
//  Created by Hager Elsayed on 21/07/2023.
//

import UIKit
import Combine


class MovieImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    private var cancellable = Set<AnyCancellable>()
    private let movie: MovieItem
    private var movieImageService: MovieImageServiceLoader
    
    init(
        movie: MovieItem,
        movieImageService: MovieImageServiceLoader = MovieImageService(movieItem: MovieItem.empty)
    ) {
        self.movie = movie
        self.movieImageService = MovieImageService(movieItem: movie)
        addSubscribers()
        self.isLoading = true
    }
    
    func addSubscribers() {
        movieImageService.imagePublisher
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] returnedImage in
                guard let self = self else { return }
                self.image = returnedImage
            }
            .store(in: &cancellable)
    }
}
