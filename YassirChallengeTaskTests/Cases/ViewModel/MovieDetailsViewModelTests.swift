//
//  MovieDetailsViewModelTests.swift
//  YassirChallengeTaskTests
//
//  Created by Hager Elsayed on 23/07/2023.
//

import XCTest
import Combine
@testable import YassirChallengeTask

class MovieDetailsViewModelTests: XCTestCase {
    var viewModel: DetailsViewModel!
    var mockMovieDetailsService: MockMovieDetailsService!
    var cancellables: Set<AnyCancellable>!
    var movieItem: MovieItem {
        .init(model: .init(id: 12, title: "Movie"))
    }
    override func setUp() {
        super.setUp()
        
        mockMovieDetailsService = MockMovieDetailsService()
        viewModel = DetailsViewModel(movieDetailsService: mockMovieDetailsService, id: 0)
        cancellables = Set<AnyCancellable>()
    }
    
    override func tearDown() {
        viewModel = nil
        mockMovieDetailsService = nil
        cancellables = nil
        
        super.tearDown()
    }
    func test_movie_is_empty_when_initialized() {
        XCTAssertEqual(viewModel.movie, MovieItem.empty)
    }
    
    func test_movies_is_not_empty_after_addSubscribers() {
        mockMovieDetailsService.getMovieCalled = false
        mockMovieDetailsService.getMovie(id: 12)
        viewModel.addSubscribers(id: 12)
        XCTAssertTrue(mockMovieDetailsService.getMovieCalled)
        XCTAssertEqual(viewModel.movie, movieItem)
    }
}
