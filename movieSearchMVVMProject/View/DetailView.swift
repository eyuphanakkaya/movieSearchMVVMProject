//
//  DetailView.swift
//  movieSearchMVVMProject
//
//  Created by Eyüphan Akkaya on 8.04.2023.
//

import SwiftUI

struct DetailView: View {
    let imdbId:String
    @ObservedObject var detailViewModel = DetailViewModel()
    
    
    var body: some View {
        
            VStack {
                HStack {
                    CustomImage(url: detailViewModel.filmdetail?.poster ?? " " )
                        .frame(width: UIScreen.main.bounds.width * 0.6,height: UIScreen.main.bounds.height * 0.3)
                   
                }
                Text(detailViewModel.filmdetail?.title ?? "Başlık")
                    .font(.title)
                    .bold()
                    .foregroundColor(.red)
                    .padding()
                
                Text("Film Detail : \(detailViewModel.filmdetail?.plot ?? "Film Detayı")")
                    .font(.title2)
                    .foregroundColor(.accentColor)
                    .padding()
                
                Text("Director : \(detailViewModel.filmdetail?.director ?? "Yönetmen")")
                    .font(.title2)
                
                Text("Actors : \(detailViewModel.filmdetail?.actors ?? "Oyuncular")")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .padding()
                Text("Writer : \(detailViewModel.filmdetail?.writer ?? "Yazarlar")")
                    .font(.title2)
                    .foregroundColor(.blue)
                    .padding()
            }.onAppear(perform: {
                self.detailViewModel.movieDetail(imdbId: imdbId)
                
            })
            
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imdbId: "")
    }
}
