//
//  ImageDownLoaderClient.swift
//  movieSearchMVVMProject
//
//  Created by Eyüphan Akkaya on 7.04.2023.
//

import Foundation

class ImageDownLoader : ObservableObject {
     
    @Published var downloadImage : Data?
    
    func downloadImage(url : String) {
        
        guard let imageUrl = URL(string: url) else {
            return
        }
        
        
        
        URLSession.shared.dataTask(with: imageUrl) { (data,response,error ) in
            guard let data = data , error == nil else {
                return
            }
            DispatchQueue.main.async {
                self.$downloadImage = data

            }
        }.resume()
    }
}



enum DownloadError:Error{
    case yanlisUrl
    case veriGelmedi
    case veriIslenmedi
}
