//
//  FilmViewModel.swift
//  FilmKitabı
//
//  Created by BERKAN NALBANT on 14.08.2022.
//

import Foundation

class FilmListeViewModel:ObservableObject {
    
    @Published var filmler = [FilmViewModel]()
    
    let dowloederClient = DownloaderClient()
    
    func filmAramasıYap (filmIsmi : String){
        
        dowloederClient.filmleriIndir(search: filmIsmi) { sonuc in
            switch sonuc{
            case .failure(let hata):
                print(hata)
            case .success(let filmDizisi):
                if let filmDizisi = filmDizisi{
                    DispatchQueue.main.async {
                        self.filmler = filmDizisi.map(FilmViewModel.init)
                    }
                }
                
            }
        }
        
    }
    
    
}


struct FilmViewModel {
    
    let film : Film
    
    var title : String{
        film.title
    }
    
    var year : String{
        film.year
    }
    
    var poster : String{
        film.poster
    }
    
    var imdbId : String{
        film.imdbID
    }
    
}
