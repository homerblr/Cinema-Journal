//
//  TVShowsResponse.swift
//  Cinema Journal
//
//  Created by Homer on 10/22/20.
//

import Foundation


struct TVShowsResponse: Codable {
    let page, totalResults, totalPages: Int
    let results: [TVShowsResult]

    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}

struct TVShowsResult: Codable {
    let originalName: String
    let genreIDS: [Int]
    let name: String
    let popularity: Double
    let originCountry: [OriginCountry]
    let voteCount: Int
    let firstAirDate, backdropPath: String
    let originalLanguage: String
    let id: Int
    let voteAverage: Double
    let overview, posterPath: String

    enum CodingKeys: String, CodingKey {
        case originalName = "original_name"
        case genreIDS = "genre_ids"
        case name, popularity
        case originCountry = "origin_country"
        case voteCount = "vote_count"
        case firstAirDate = "first_air_date"
        case backdropPath = "backdrop_path"
        case originalLanguage = "original_language"
        case id
        case voteAverage = "vote_average"
        case overview
        case posterPath = "poster_path"
    }
}

enum OriginCountry: String, Codable {
    case us = "US"
}

