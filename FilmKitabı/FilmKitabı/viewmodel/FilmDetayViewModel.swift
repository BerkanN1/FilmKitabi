//
//  FilmDetayViewModel.swift
//  FilmKitabı
//
//  Created by BERKAN NALBANT on 19.08.2022.
//

import Foundation
import SwiftUI

class FilmDetayViewModel : ObservableObject{
    
    @Published var filmDetayi : FilmDetaylariViewModel?
    
    let dowloaderClient = DownloaderClient()
    
    func filmDetayıAl(imdbId:String){
        dowloaderClient.filmDetayIndir(imdbId: imdbId) { sonuc in
            switch sonuc{
            case.failure(let hata):
                print(hata)
            case.success(let filmDetay):
                self.filmDetayi = FilmDetaylariViewModel(detay: filmDetay)
            }
        }
    }
}

struct FilmDetaylariViewModel{
    
    let detay : FilmDetay
    
    var title : String{
        detay.title
    }
    
    var poster : String{
        detay.poster
    }
    var year :String{
        detay.year
    }
    
    var imdbId: String{
        detay.imdbId
    }
    var director : String{
        detay.director
    }
    var writer  :String{
        detay.writer
    }
    var awards: String{detay.awards
        
    }
    var plot : String{
        detay.plot
    }
}

