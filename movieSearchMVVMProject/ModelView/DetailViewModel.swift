//
//  DetailViewModel.swift
//  movieSearchMVVMProject
//
//  Created by Eyüphan Akkaya on 8.04.2023.
//

import Foundation
import SwiftUI

class DetailViewModel : ObservableObject {
    @Published var filmdetail : MovieDetailViewModel?
    let downLoaderClient = DownLoaderClient()
    
    func movieDetail (imdbId: String) {
        downLoaderClient.downloadDetail(imdbId: imdbId) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let filmDetail):
                DispatchQueue.main.async {
                    self.filmdetail = MovieDetailViewModel(detail: filmDetail )

                }
            }
        }
    }
    
    
}

struct MovieDetailViewModel {
    var detail : MovieDetail
    
    var title:String {
        detail.title
    }
    var year:String {
        detail.year
    }
    var runTime:String {
        detail.runTime
    }
    var genre:String {
        detail.genre
    }
    var director:String {
        detail.director
    }
    var writer:String {
        detail.writer
    }
    var actors:String {
        detail.actors
    }
    var plot:String {
        detail.actors
    }
    var poster:String {
        detail.poster
    }
    var metascore:String {
        detail.metascor
    }
    var imdbRating:String {
        detail.imdbRating
    }
    var imdbId:String {
        detail.imdbId
    }
}

