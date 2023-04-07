//
//  Movie.swift
//  movieSearchMVVMProject
//
//  Created by Eyüphan Akkaya on 31.03.2023.
//

import Foundation

struct Movie : Codable {
    let title:String
    let year:String
    let imdbId:String
    let type:String
    let poster:String
    
    private enum CodingKeys: String,CodingKey {//burada proplarımızın bazen metot olabileceği için internetten çektiğimiz verileri enum yapısıyla karşılığını giriyoruz
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
    
}
struct IncomingData : Codable {
    let movies: [Movie]
    
    private enum CodingKeys : String,CodingKey {
        case movies = "Search"
    }
}
