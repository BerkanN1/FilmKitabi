//
//  DetayView.swift
//  FilmKitabı
//
//  Created by BERKAN NALBANT on 19.08.2022.
//

import SwiftUI

struct DetayView: View {
    let imdbId : String
    
    @ObservedObject var filmDetayViewModel = FilmDetayViewModel()
    var body: some View {
        VStack{
            OzelImage(url: filmDetayViewModel.filmDetayi?.poster ?? "")
            
            Text(filmDetayViewModel.filmDetayi?.plot ?? "")
        }.onAppear {
            self.filmDetayViewModel.filmDetayıAl(imdbId: imdbId)
        }
    }
}

struct DetayView_Previews: PreviewProvider {
    static var previews: some View {
        DetayView(imdbId: "")
    }
}
