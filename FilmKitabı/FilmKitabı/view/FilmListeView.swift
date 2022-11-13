//
//  ContentView.swift
//  FilmKitabı
//
//  Created by BERKAN NALBANT on 12.08.2022.
//

import SwiftUI

struct FilmListeView: View {
    
   @ObservedObject var filmListeViewModel : FilmListeViewModel
    @State var aranacakFilm = ""
    init(){
        self.filmListeViewModel = FilmListeViewModel()
       
    }
    var body: some View {
        NavigationView{
            VStack{
            TextField("Aranacak Film", text: $aranacakFilm, onEditingChanged: {_ in}, onCommit: {
                self.filmListeViewModel.filmAramasıYap(filmIsmi: aranacakFilm.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? aranacakFilm)
                    
            })
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
                    
            
        List(filmListeViewModel.filmler, id : \.imdbId){ film in
            NavigationLink {
                DetayView(imdbId: film.imdbId)
            } label: {
                HStack{
                    OzelImage(url: film.poster)
                        .frame(width: 100, height: 150)
                    
                    VStack(alignment : .leading){
                        
                        Text(film.title)
                            .font(.title3)
                            .foregroundColor(.blue)
                        
                        Text(film.year)
                            .foregroundColor(.orange)
                        
                    }
                }
            }

        }.navigationTitle("Filmler")
        }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FilmListeView()
    }
}
