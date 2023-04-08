//
//  ContentView.swift
//  movieSearchMVVMProject
//
//  Created by Eyüphan Akkaya on 31.03.2023.
//

import SwiftUI

struct ContentView: View {
   @ObservedObject var movieListVİewModel : MovieListViewModel
    @State var sourcePanel = ""
    init() {
        self.movieListVİewModel = MovieListViewModel()
      
    }
    
    var body: some View {
        NavigationView{
            VStack{
                TextField("Film Ara", text: $sourcePanel, onEditingChanged: { _ in}, onCommit: {  self.movieListVİewModel.searchMovie(filmName: sourcePanel
                    .trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? sourcePanel)})
                        .padding()
                        .textFieldStyle(.roundedBorder)
                
                List(movieListVİewModel.movies,id: \.imdbId) { film in
                    
                    NavigationLink(destination: DetailView(imdbId: film.imdbId), label: {
                        HStack {
                            CustomImage(url: film.poster)
                                .frame(width: 100 ,height: 130)
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

                    )
                    

                    
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
