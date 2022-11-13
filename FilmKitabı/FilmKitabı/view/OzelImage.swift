//
//  OzelImage.swift
//  FilmKitabı
//
//  Created by BERKAN NALBANT on 19.08.2022.
//

import SwiftUI

struct OzelImage: View {
    
    let url : String
    @ObservedObject var imageDownloderClient = ImageDownloderClient()
    
    init (url : String){
        self.url = url
        self.imageDownloderClient.gorselIndir(url: self.url)
    }
    var body: some View {
        if let data = self.imageDownloderClient.indirilenGorsel{
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }else{
            return Image("")
                .resizable()
        }
    }
}

struct OzelImage_Previews: PreviewProvider {
    static var previews: some View {
        OzelImage(url: "")
    }
}
