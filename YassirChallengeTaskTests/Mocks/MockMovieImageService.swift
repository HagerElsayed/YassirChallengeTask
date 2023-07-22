//
//  MockMovieImageService.swift
//  YassirChallengeTaskTests
//
//  Created by Hager Elsayed on 22/07/2023.
//

@testable import YassirChallengeTask
import XCTest
import Combine

final class MockMovieImageServiceLoader: MovieImageServiceLoader {
    var image: UIImage = UIImage()
    
    private let imageSubject = PassthroughSubject<UIImage?, Never>()
    var imagePublisher: AnyPublisher<UIImage?, Never> {
        return imageSubject.eraseToAnyPublisher()
    }
    var getMoviesImagesCalled = false
    
    
    func getMoviesImages() {
        getMoviesImagesCalled = true
        DispatchQueue.global().async {
            let mockedImageData = Data()
            if let mockedImage = UIImage(data: mockedImageData) {
                self.imageSubject.send(mockedImage)
            } else {
                self.imageSubject.send(nil)
            }
        }
        
    }
}
