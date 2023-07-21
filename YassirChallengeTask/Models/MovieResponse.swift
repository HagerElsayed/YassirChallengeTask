//
//  MovieResponse.swift
//  YassirChallengeTask
//
//  Created by Hager Elsayed on 20/07/2023.
//

import Foundation

struct MovieResponse: Codable {
    let page: Int?
    let results: [Movie]?
    let totalPages: Int?
    let totalResults: Int?
    
    init(
        page: Int?,
        results: [Movie]?,
        totalPages: Int?,
        totalResults: Int?
    ) {
        self.page = page
        self.results = results
        self.totalPages = totalPages
        self.totalResults = totalResults
    }
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
