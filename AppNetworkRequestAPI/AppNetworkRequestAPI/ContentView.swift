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
        //vamos adicionar a url em uma sessão de dataTask, entao vamos pegar os dados da url que naos apenas criamos
        URLSession.shared.dataTask(with: url) { data, response, error in
            //vamos tentar desembrulhar estes dados, se formos capazes de desembrulha os dados
            guard let data = data else { return }
            //vamos decodificar isso ou analisar isso para criar um objeto de dados de cotação, a resposta é um formato json, temos que usar um json decodificador json para decodificar os dados para usar com as chaves das propriedades
            if let decodeData = try? JSONDecoder().decode(QuoteData.self, from: data) {
                //se for capaz de desembrulhar os dados que nos pegamos da requisição entao podemos atribuir nosso estado de dados de cotação variavel para ser igual a este dado decodificado desde o estado da cotação da variável vai modificar a UI do nosso aplicativo nos precisamos atribuir isso no tópcio principal(main thread) para alcancar isso nos podemos usar dispatch.queue
                DispatchQueue.main.async {
                    self.quoteData = decodeData
                    //o json decoder vai automaticamente usar essas propriedades como chaves de acesso a esses valores no dicionário do json que nos recebemos da nossa requisição de rede, somos capazes de alcançar isso pois a nossa struct (QuoteData) é do tipo Decodable
                } //end DispatchQueue
            } //end if let decodeData
        } //end URLSession
        .resume()
    } //end private func loadData()
} //end struct ContentView

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
