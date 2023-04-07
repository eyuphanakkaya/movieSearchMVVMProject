//
//  DownLoaderClient.swift
//  movieSearchMVVMProject
//
//  Created by Eyüphan Akkaya on 31.03.2023.
//

import Foundation


class DownLoaderClient {
    func downloadMovies(search : String,complation : @escaping(Result<[Movie]?,DownLoadError>)-> Void ) {//true ve false değerler döndürüyoruz.
        
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=565d3370") else {
            return complation(.failure(.yanlisUrl))
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data ,error == nil else {
                return complation(.failure(.veriGelmedi))
            }
            guard let movieResult = try? JSONDecoder().decode(IncomingData.self, from: data) else {
                return complation(.failure(.veriIslenmedi))
            } 
            
            complation(.success(movieResult.movies))
        }.resume()
        
    }
}

enum DownLoadError:Error {
    case yanlisUrl
    case veriGelmedi
    case veriIslenmedi
}
 
