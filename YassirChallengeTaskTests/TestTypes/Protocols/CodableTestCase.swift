//
//  CodableTestCase.swift
//  YassirChallengeTaskTests
//
//  Created by Hager Elsayed on 22/07/2023.
//

import Foundation
import XCTest

protocol CodableTestCase: AnyObject {
    associatedtype T: Codable
    var dictionary: NSDictionary! { get set }
    var sut: T! { get set }
}
extension CodableTestCase {
    func givenSUTFromJSON(
        fileName: String = "\(T.self)",
        file: StaticString = #file,
        line: UInt = #line
    ) throws {
        let decoder = JSONDecoder()
        let data = try Data.fromJSON(fileName: fileName, file: file, line: line)
        dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary
        sut = try decoder.decode(T.self, from: data)
    }
}
