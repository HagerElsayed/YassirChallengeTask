//
//  MovieImageViewModelTests.swift
//  YassirChallengeTaskTests
//
//  Created by Hager Elsayed on 22/07/2023.
//

import XCTest
import Combine
@testable import YassirChallengeTask

class MovieImageViewModelTests: XCTestCase {
    var viewModel: MovieImageViewModel!
    var mockMovieImageService: MockMovieImageServiceLoader!
    var cancellables: Set<AnyCancellable>!
    var movieItem: MovieItem {
        .init(model: .init(id: 12, title: "Movie"))
    }
    override func setUp() {
        super.setUp()
        
        mockMovieImageService = MockMovieImageServiceLoader()
        viewModel = MovieImageViewModel(movie: movieItem, movieImageService: mockMovieImageService)
        cancellables = Set<AnyCancellable>()
    }
    
    override func tearDown() {
        viewModel = nil
        mockMovieImageService = nil
        cancellables = nil
        
        super.tearDown()
    }
    func test_movies_is_empty_when_initialized() {
        XCTAssertEqual(viewModel.image, UIImage() )
    }
    
    func test_get_image_is_called_after_addSubscribers() {
        // When
        mockMovieImageService.getMoviesImages()
        viewModel.addSubscribers()
        // Then
        XCTAssertTrue(mockMovieImageService.getMoviesImagesCalled)
    }
}
