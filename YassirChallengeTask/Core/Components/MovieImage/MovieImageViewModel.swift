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
    private let imageService: MovieImageService
    
    init(movie: MovieItem) {
        self.movie = movie
        self.imageService = MovieImageService(movieItem: movie)
        addSubscribers()
        self.isLoading = true
    }
    
    private func addSubscribers() {
        imageService.$image
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
            }
            .store(in: &cancellable)
    }
}
