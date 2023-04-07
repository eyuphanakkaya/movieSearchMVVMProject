//
//  ContentView.swift
//  movieSearchMVVMProject
//
//  Created by Eyüphan Akkaya on 31.03.2023.
//

import SwiftUI

struct ContentView: View {
   @ObservedObject var movieListVİewModel : MovieListViewModel
    
    init() {
        self.movieListVİewModel = MovieListViewModel()
        self.movieListVİewModel.searchMovie(filmName: "titanic")
    }
    
    var body: some View {
        List(movieListVİewModel.movies,id: \.imdbId) { film in
            HStack {
                Image("film")
                    .resizable()
                    .frame(width: 100 ,height: 100)
                VStack (alignment: .leading) {
                    Text(film.title)
                        .font(.title2)
                        .foregroundColor(.blue)
                    Text(film.year)
                        .font(.title3)
                        .foregroundColor(.red)
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
