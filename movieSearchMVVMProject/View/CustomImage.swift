//
//  CustomImage.swift
//  movieSearchMVVMProject
//
//  Created by Eyüphan Akkaya on 8.04.2023.
//

import SwiftUI

struct CustomImage: View {
    let url:String
    @ObservedObject var imageDownLoaderClient = ImageDownLoader()
    init(url:String){
        self.url = url
        self.imageDownLoaderClient.downloadImage(url: self.url)
        
    }
    var body: some View {
        if let data = self.imageDownLoaderClient.downloadImage {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }else {
            return Image("placeHolder")
                .resizable()
        }
    }
}

struct CustomImage_Previews: PreviewProvider {
    static var previews: some View {
        CustomImage(url: "https://m.media-amazon.com/images/M/MV5BMDdmZGU3NDQtY2E5My00ZTliLWIzOTUtMTY4ZGI1YjdiNjk3XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_SX300.jpg")
    }
}
