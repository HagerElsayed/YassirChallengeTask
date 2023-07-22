//
//  MovieTest.swift
//  YassirChallengeTaskTests
//
//  Created by Hager Elsayed on 22/07/2023.
//

@testable import YassirChallengeTask
import XCTest

class MovieTest: XCTestCase, CodableTestCase {
    // MARK: - Instance Properties
    var dictionary: NSDictionary!
    var sut: Movie!
    
    // MARK: - Test LifeCyle
    override func setUp() {
        super.setUp()
        try! givenSUTFromJSON()
    }
    
    override func tearDown() {
        dictionary = nil
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Type Tests
    func test_conformsTo_Codable() {
        XCTAssertTrue((sut as Any) is Codable)
    }
    
    func test_conformsTo_Equatable() {
        XCTAssertEqual(sut, sut)
    }
    
    // MARK: - codable - Test
    func test_codable_sets_id() throws {
        try XCTAssertEqualToAny(actual: sut.id, expected: dictionary["id"])
    }
    
    func test_codable_sets_title() throws {
        try XCTAssertEqualToAny(actual: sut.title, expected: dictionary["title"])
    }
    
    func test_codable_sets_originalTitle() throws {
        try XCTAssertEqualToAny(actual: sut.originalTitle, expected: dictionary["original_title"])
    }
    
    func test_codable_sets_posterPath() throws {
        try XCTAssertEqualToAny(actual: sut.posterPath, expected: dictionary["poster_path"])
    }
    func test_codable_sets_voteAverage() throws {
        try XCTAssertEqualToAny(actual: sut.voteAverage, expected: dictionary["vote_average"])
    }
    
    func test_codable_sets_voteCount() throws {
        try XCTAssertEqualToAny(actual: sut.voteCount, expected: dictionary["vote_count"])
    }
}
