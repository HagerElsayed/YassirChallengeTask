//
//  MovieResponseTests.swift
//  YassirChallengeTaskTests
//
//  Created by Hager Elsayed on 22/07/2023.
//

@testable import YassirChallengeTask
import XCTest

class MovieResponseTests: XCTestCase, CodableTestCase {
    // MARK: - Instance Properties
    var dictionary: NSDictionary!
    var sut: MovieResponse!
    var movie: Movie {
        .init(id: 12, title: "Movie")
    }
    // MARK: - Test LifeCyle
    override func setUp() {
        super.setUp()
        // i handled SUT here by setting MovieResponse instead of handle it with the JSON like MovieTest, i did it to present the both way
        sut = MovieResponse(results: [movie])
    }
    
    override func tearDown() {
        dictionary = nil
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Type Tests
    func test_conformsTo_Decodable() {
        XCTAssertTrue((sut as Any) is Decodable)
    }
    
    func test_conformsTo_Equatable() {
        XCTAssertEqual(sut, sut)
    }
    
    // MARK: - Decodable - Test
    func test_decodable_sets_results() throws {
        try XCTAssertEqualToAny(actual: sut.results, expected: [movie])
    }
    
    func testCodingKeys() {
        XCTAssertEqual(MovieResponse.CodingKeys.results.rawValue, "results")
    }
    
}
