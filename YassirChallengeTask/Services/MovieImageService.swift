//
//  MovieImageService.swift
//  YassirChallengeTask
//
//  Created by Hager Elsayed on 21/07/2023.
//

import UIKit
import Combine

protocol MovieImageServiceLoader: AnyObject {
    var image: UIImage { get set }
    var imagePublisher: AnyPublisher<UIImage?, Never> { get }
    func getMoviesImages()
}

class MovieImageService: MovieImageServiceLoader {
    @Published var image: UIImage = UIImage()
    private let movieItem: MovieItem
    private let fileManager = LocalFileManager()
    private let folderName = "movie_images"
    private let imageName: String
    private var imageSubscription: AnyCancellable?
    
    var imagePublisher: AnyPublisher<UIImage?, Never> {
        $image.map { $0 }.eraseToAnyPublisher()
    }
    
    init(movieItem: MovieItem) {
        self.movieItem = movieItem
        self.imageName = "\(movieItem.id)"
        getMoviesImages()
    }
    
    func getMoviesImages() {
        if let savedImage = fileManager.getImage(imageName: imageName, folderName: folderName) {
            image = savedImage
        } else {
            downloadMovieImage()
        }
    }
    
    private func downloadMovieImage() {
        guard let url = URL(string: movieItem.posterPath) else { return }
        
        imageSubscription = NetworkManager.get(url: url)
            .tryMap({(data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
                guard let self = self, let downloadedImage = returnedImage else { return }
                self.image = downloadedImage
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(
                    image: downloadedImage,
                    imageName: self.imageName,
                    folderName: self.folderName
                )
            })
        
    }
}
