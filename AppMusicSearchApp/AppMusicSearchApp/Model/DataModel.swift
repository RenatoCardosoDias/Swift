//
//  DataModel.swift
//  AppMusicSearchApp
//
//  Created by Renato on 03/03/23.
//

import Foundation
//https://itunes.apple.com/search?term=coldplay&entity=song

class DataModel {
    private var dataTask: URLSessionDataTask?

    

    private func buildUrl (forTerm searchTerm: String) -> URL? {
        //garantir que o campo nao esteja vazaio
        guard !searchTerm.isEmpty else { return nil}
         //criando a lista de consultas de items, basicamente é cada parametro que nos passamos pela url
        let queryItems = [
            URLQueryItem(name: "term", value: searchTerm),
            URLQueryItem(name: "entity", value: "song")
        ] // isso é apenaso tipo de entidades que nos queremos receber no resultado da requisição

        //criando os componentes do objeto da url
        var components = URLComponents(string: "https://itunes.apple.com/search") //é onde nós vamos adicionar nossar urls
        //adicionando a queryItems para a variável components
        components?.queryItems = queryItems
        //Retornamos a url que que recebemos deste objeto de componentes
        return components?.url
    } //private func buildUrl

//adicions o metor que atualemente construiu or criou essa url e enviou as reque


} //end class DataModel

struct SongResponse: Decodable {
    let songs: [Song]

    enum Codkinkeys: String, CodingKey{
        case songs = "results"
    }
} //end struct SongResponse

struct Song: Decodable {
    let id: Int
    let trackName: String
    let artistName: String
    let artWorkURL: String

    enum CodingKeys: String, CodingKey {
        case id = "trackId"
        case trackName
        case artistName
        case artWorkURL = "artworkUrl60"
    }
} //ens Struct Song
