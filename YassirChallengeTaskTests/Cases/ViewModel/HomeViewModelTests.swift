//
//  HomeViewModelTest.swift
//  YassirChallengeTaskTests
//
//  Created by Hager Elsayed on 22/07/2023.
//

import XCTest
import Combine
@testable import YassirChallengeTask

class HomeViewModelTests: XCTestCase {
    var viewModel: HomeViewModel!
    var mockMovieDataService: MockMovieDataService!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        
        mockMovieDataService = MockMovieDataService()
        viewModel = HomeViewModel(movieDataService: mockMovieDataService)
        cancellables = Set<AnyCancellable>()
    }
    
    override func tearDown() {
        viewModel = nil
        mockMovieDataService = nil
        cancellables = nil
        
        super.tearDown()
    }
    func test_movies_is_empty_when_initialized() {
        XCTAssertEqual(viewModel.movies.count, 0)
    }
    
    func test_movies_is_not_empty_after_addSubscribers() {
        mockMovieDataService.getMoviesCalled = false
        mockMovieDataService.getMovies()
        viewModel.addSubscribers()
        XCTAssertTrue(mockMovieDataService.getMoviesCalled)
        XCTAssertEqual(viewModel.movies.count, 1)
    }
}
