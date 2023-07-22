//
//  XCTestHelper.swift
//  YassirChallengeTaskTests
//
//  Created by Hager Elsayed on 22/07/2023.
//

import XCTest

/// Helper function to asserting the equality between two values, file and line provide information  about the file and line number where the assertion is made when a test fails.
public func XCTAssertEqualToAny<T: Equatable>(
    actual: @autoclosure () throws -> T,
    expected: @autoclosure () throws -> Any?,
    file: StaticString = #file,
    line: UInt = #line
) throws {
    let actual = try actual()
    let expected = try XCTUnwrap(expected() as? T)
    XCTAssertEqual(actual, expected, file: file, line: line)
}
