//
//  MockMovieDetailsService.swift
//  YassirChallengeTaskTests
//
//  Created by Hager Elsayed on 23/07/2023.
//

@testable import YassirChallengeTask
import XCTest
import Combine

final class MockMovieDetailsService: MovieDetailsServiceProtocol {
    var movie: Movie = Movie()
    var moviePublisher: AnyPublisher<Movie, Never> {
        Just(movie)
            .setFailureType(to: Never.self)
            .eraseToAnyPublisher()
    }
    var getMovieCalled = false
    
    func getMovie(id: Int) {
        getMovieCalled = true
        movie = Movie(id: id, title: "Test Movie")
    }
}
