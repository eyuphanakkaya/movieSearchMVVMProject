//
//  MovieDetail.swift
//  movieSearchMVVMProject
//
//  Created by Eyüphan Akkaya on 8.04.2023.
//

import Foundation

struct MovieDetail : Codable {
    let title:String
    let year:String
    let runTime:String
    let genre:String
    let director:String
    let writer:String
    let actors:String
    let plot:String
    let poster:String
    let metascor:String
    let imdbRating:String
    let imdbId:String
    
    private enum CodingKeys :String,CodingKey {
        case title = "Title"
        case year = "Year"
        case runTime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case poster = "Poster"
        case metascor = "Metascore"
        case imdbRating = "imdbRating"
        case imdbId = "imdbID"
    }
}
