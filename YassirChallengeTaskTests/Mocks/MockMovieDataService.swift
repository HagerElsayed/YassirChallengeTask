//
//  MockMovieDataService.swift
//  YassirChallengeTaskTests
//
//  Created by Hager Elsayed on 22/07/2023.
//

@testable import YassirChallengeTask
import XCTest
import Combine

class MockMovieDataService: MovieDataServiceProtocol {
    var movies: [Movie] = []
    var moviesPublisher: AnyPublisher<[Movie], Never> {
        Just(movies)
            .setFailureType(to: Never.self)
            .eraseToAnyPublisher()
    }
    var getMoviesCalled = false
    
    func getMovies() {
        getMoviesCalled = true
        movies = [Movie(id: 1, title: "Test Movie")]
    }
}
