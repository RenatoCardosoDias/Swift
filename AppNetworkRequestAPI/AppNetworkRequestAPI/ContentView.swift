//
//  ContentView.swift
//  AppNetworkRequestAPI
//
//  Created by Renato on 08/03/23.
//

import SwiftUI

struct ContentView: View {
    //vamos definir o Estado com o tipo opcional, pois pode conter ou nao dados
    @State private var quoteData: QuoteData?

    var body: some View {
        VStack{
            
        }
    } //end var body

    //Garantir que a resposta pode ser visualizada na view principal
    private func loadData() {
        //garantir que a url é valida
        //https://api.adviceslip.com/advice

        guard let url = URL(string: "https://api.adviceslip.com/advice") else { return }
    }
}

//definindo a estrutura que representa a resposta obtida ao fazer uma solicitação da resposta obtida à API de citação

struct QuoteData: Decodable { //se quisermos analisar uma resposta que recebemos ao fazer uma solicitação, precisamos garantir que o swift entenda que nossos dados podem ser decodificados,
    var slip_id: String
    var advice: String

} //end struct QuoteData

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
