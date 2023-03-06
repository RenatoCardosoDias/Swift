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

    //adicions o metor que atualemente construiu ou criou essa url e enviou as requisições e adicionar um completion block quando qualquer  requisição for sucesso ou falha, vamos fornecer a lista(array) de musicas, e esse metodo não irá retornar valor
    func loadSongs(searchTerm: String, complition: @escaping([Song]) -> Void) {
        //primeiro vamos cancelar a tarefa que estiver sendo executada, quando este metodo é chamado
        dataTask?.cancel()
        //vamos criar uma tentativa de criar a url base neste searchTerm
        guard let url = buildUrl(forTerm: searchTerm) else {
            //se nao for capaz de construir isso chamamos o complition block com uma lista(array) em branco e a retornamos
            complition([])
            return
        } //end guard let url

        //se for capaz de construir a lista nos a criamos um novo dataTask e recupramos os dados
        dataTask = URLSession.shared.dataTask(with: url) { data, _, _ in
            //primeiro vamos checar se nos somos capazes de receber estes dados
            guard let data = data else {
                //se nao for capaz de receber os dados da api, chamamos o complition com uma lista(array) em branco e retornmaos
                complition([])
                return
            } //end guard let data
            //se for capaz vamos tentar fazer a decodifcação da resposta no formato json e vamos chamar o completion handler com a lista de musicas
            if let songResponse = try?  JSONDecoder().decode( SongResponse.self, from: data) {
                //se formos capaz de decodificar vamos chamar o complition
                complition(songResponse.songs)
            } //end if let songResponse
        } //end dataTask
        dataTask?.resume()
    } //end func loadSons

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
