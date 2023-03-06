//
//  SongListViewModel.swift
//  AppMusicSearchApp
//
//  Created by Renato on 06/03/23.
//

import SwiftUI
import Combine

//agora nos temos o nosso SongViewModel nos vamos adicionar a viewModel para representar todos esses resultados da chamada da api

class SongListViewModel: ObservableObject{
    @Published var searchTerm: String = ""
    @Published public private(set) var songs: [SongViewModel] = [] //estamos usando public private(set) porque a view vai ser capaz de ler essa lista mas nao poderá ser capaz de alterar esse conteúdo

    //vamos ter um dataModelObject que nós vamos usar para carregar dos dados da api
    private let dataModel: DataModel = DataModel()
    private var disposables = Set<AnyCancellable>()

    init() {
        $searchTerm
            .sink(receiveValue: loadSongs(searchTerm: ))
            .store(in: &disposables)
    }
    //quando inicializarmos o nosso SongViewModel vamos fazer com que a @Published var searchTerm fique escutando as alterações

    //adicionando o metodo que vai chamar as musicas(songs)em qualquer momento que a barra de procura(searchTerm) mudar
    private func loadSongs(searchTerm: String) {
        songs.removeAll()
        dataModel.loadSongs(searchTerm: searchTerm) { songs in
            songs.forEach{ self.appendSong(song: $0)} //estamos passando o objeto musica usando o $0
        } //end dataModel
    } //end private func loadSong

    private func appendSong(song: Song) {
        let songViewModel = SongViewModel(song: song)
        DispatchQueue.main.async {
            self.songs.append(songViewModel)
        }
    }

} //end class SongListViewModel


class SongViewModel: Identifiable, ObservableObject {
    let id: Int
    let trackName: String
    let artistName: String
    @Published var atwork: Image?
    //Quando a SongViewModel é inicializada nos vamos fazer isso na SongModel e nos vamos atribuir nossas propriedades baseadas nos dados do Model
    init(song: Song) {
        self.id = song.id
        self.trackName = song.trackName
        self.artistName = song.artistName
//agora temos o nosso SongViewModel
    } //end init
}
