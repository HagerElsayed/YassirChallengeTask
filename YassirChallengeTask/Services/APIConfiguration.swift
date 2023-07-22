//
//  APIConfiguration.swift
//  YassirChallengeTask
//
//  Created by Hager Elsayed on 21/07/2023.
//

import Foundation
import YassirKeys

enum APIConfiguration {
    // MARK:- here we can add apiKey i set it with Arkana Keys to be more secure and i'll share the .env file over the email
    static let apiKey = YassirKeys.Keys.Global().movieApiKey
    static let baseURL = "https://api.themoviedb.org/3/"
    static let trendingMovies = baseURL + "discover/movie?api_key=\(apiKey)"
    static let posterBaseURL = "https://image.tmdb.org/t/p/"
    static let posterW500 = posterBaseURL + "w500"
    static func moviesById(id: String) -> String {
        let url = "\(baseURL)movie/\(id)?api_key=\(apiKey)"
        return url
    }
}

