//
//  Movie.swift
//  YassirChallengeTask
//
//  Created by Hager Elsayed on 20/07/2023.
//

import Foundation
/*
 {
       "adult": false,
       "backdrop_path": "/qWQSnedj0LCUjWNp9fLcMtfgadp.jpg",
       "genre_ids": [
         28,
         12,
         878
       ],
       "id": 667538,
       "original_language": "en",
       "original_title": "Transformers: Rise of the Beasts",
       "overview": "When a new threat capable of destroying the entire planet emerges, Optimus Prime and the Autobots must team up with a powerful faction known as the Maximals. With the fate of humanity hanging in the balance, humans Noah and Elena will do whatever it takes to help the Transformers as they engage in the ultimate battle to save Earth.",
       "popularity": 8466.323,
       "poster_path": "/gPbM0MK8CP8A174rmUwGsADNYKD.jpg",
       "release_date": "2023-06-06",
       "title": "Transformers: Rise of the Beasts",
       "video": false,
       "vote_average": 7.3,
       "vote_count": 1431
     }
 */


struct Movie: Identifiable, Codable {
    let id: Int?
    let adult: Bool?
    let originalTitle: String?
    let title: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let voteAverage: Float?
    let voteCount: Int?
    
    init(
        id: Int?,
        adult: Bool?,
        originalTitle: String?,
        title: String?,
        overview: String?,
        popularity: Double?,
        posterPath: String?,
        voteAverage: Float?,
        voteCount: Int?
    ) {
        self.id = id
        self.adult = adult
        self.originalTitle = originalTitle
        self.title = title
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case adult
        case title
        case overview
        case popularity
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
