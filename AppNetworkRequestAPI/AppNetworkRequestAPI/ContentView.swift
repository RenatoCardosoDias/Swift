//
//  ContentView.swift
//  AppNetworkRequestAPI
//
//  Created by Renato on 08/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

//definindo a estrutura que representa a resposta obtida ao fazer uma solicitação da resposta obtida à API de citação

struct QuoteData {
    var slip_id: String
    var advice: String

} //end struct QuoteData

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
