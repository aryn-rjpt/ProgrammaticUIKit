// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let trendingMoviesResponseModel = try? JSONDecoder().decode(TrendingMoviesResponseModel.self, from: jsonData)

import Foundation

// MARK: - TrendingMoviesResponseModel
nonisolated struct TrendingMoviesResponseModel: Codable {
    var page: Int?
    var results: [Movie]?
    var totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct Movie: Codable {
    var adult: Bool?
    var backdropPath: String?
    var id: Int?
    var title, originalTitle, overview, posterPath: String?
    var mediaType, originalLanguage: String?
    var genreIDS: [Int]?
    var popularity: Double?
    var releaseDate: String?
    var softcore, video: Bool?
    var voteAverage: Double?
    var voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case id, title
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case originalLanguage = "original_language"
        case genreIDS = "genre_ids"
        case popularity
        case releaseDate = "release_date"
        case softcore, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
