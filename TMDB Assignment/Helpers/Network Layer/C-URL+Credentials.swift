//
//  C-URL+Credentials.swift
//  TMDB Assignment
//
//  Created by Ahmad on 15/04/2023.
//

import Foundation

let APIKey = "4097e33b9ea2e7d22ecf77c460518080"
let BaseUrl = "https://api.themoviedb.org"

var apiURL : String {
    return "\(BaseUrl)/3"
}

struct API {
    static let movies = "\(apiURL)/movie/popular?api_key=\(APIKey)"
    static let search = "\(apiURL)/search/movie?api_key=\(APIKey)"    
}

let posterURL = "https://image.tmdb.org/t/p/w92/"
