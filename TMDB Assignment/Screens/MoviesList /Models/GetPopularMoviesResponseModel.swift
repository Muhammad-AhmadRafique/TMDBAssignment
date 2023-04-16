//
//  GetPopularMoviesResponseModel.swift
//  TMDB Assignment
//
//  Created by Ahmad on 15/04/2023.
//

import Foundation


// MARK: - GetPopularMoviesResponseModel
struct GetPopularMoviesResponseModel: Codable {
    let page: Int?
    let results: [MovieModel]?
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct MovieModel: Codable {
    let backdropPath: String?
    let id: Int?
    let originalTitle, overview: String?
    let posterPath, releaseDate, title: String?
    var isFavorite: Bool?

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case isFavorite
    }
}
