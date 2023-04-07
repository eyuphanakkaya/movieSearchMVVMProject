//
//  MovieViewModel.swift
//  movieSearchMVVMProject
//
//  Created by Eyüphan Akkaya on 7.04.2023.
//

import Foundation
import SwiftUI

class MovieListViewModel : ObservableObject  {
    
   @Published  var movies = [MovieViewModel]()//yayınlanabilir olmuş oldu
    
    let downLoaderClient = DownLoaderClient()

    func searchMovie (filmName:String) {
        downLoaderClient.downloadMovies(search: filmName) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let filmArray):
                if let filmArray = filmArray{
                    DispatchQueue.main.async {
                        self.movies = filmArray.map(MovieViewModel.init)
                    }
                }
            }
           
        }
        
    }
    
}
struct MovieViewModel{
    let film : Movie
    
    var title:String {
        film.title
    }
    var year:String {
        film.year
    }
    var imdbId:String {
        film.imdbId
    }
    var poster:String {
        film.poster
    }
}
