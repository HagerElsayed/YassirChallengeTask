//
//  MovieItem.swift
//  YassirChallengeTask
//
//  Created by Hager Elsayed on 21/07/2023.
//

import Foundation

struct MovieItem: Identifiable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String
    let voteCount: String
    let model: Movie

    init(model: Movie) {
        self.model = model
        self.id = model.id ?? 0
        self.title = model.title?.defaultIfEmpty ?? "".defaultIfEmpty
        self.overview = model.overview?.defaultIfEmpty ?? "".defaultIfEmpty
        self.posterPath = "\(APIConfiguration.posterW500)\(model.posterPath ?? "")" 
        self.voteCount = "\(model.voteCount ?? 0)".defaultIfEmpty
    }
}

extension MovieItem: Equatable {
    static func == (lhs: MovieItem, rhs: MovieItem) -> Bool {
        return lhs.id == rhs.id
    }
}
