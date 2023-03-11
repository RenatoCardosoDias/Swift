//
//  ContentView.swift
//  JsonMap
//
//  Created by Renato on 10/03/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var locations: [Location] = []
    @State private var coodinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 19.43, longitude: -99.13 ), span: MKCoordinateSpan(latitudeDelta: 50, longitudeDelta: 50) )

    var body: some View {
        Map(coordinateRegion: $coodinateRegion, annotationItems: locations) { location in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
                VStack{
                    Text(location.name)
                        .font(.caption2)
                        .bold()
                    Image(systemName: "star.fill")
                        .font(.title2)
                        .foregroundColor(.red)
                        .shadow(radius: 1)
                }
            } //end MapAnnotation
        } //end Map
        .onAppear(perform: readFile)
    } //end var body

    //função para ler o arquivo JSON
    private func readFile(){
        //obter a url(caminho) que vai mapear nosso json file
        if let url = Bundle.main.url(forResource: "locations", withExtension: "json"),
        let data = try? Data(contentsOf: url){
            //se for capaz de localizar o arquivo, vamos tentar ler o conteudo
            let decoder = JSONDecoder()
            if let jsonData = try? decoder.decode(JSONData.self, from: data) {
                //se for capaz de decodificar nosso arquivo json, vamos imprimir no console
//                print(jsonData.locations)
                self.locations = jsonData.locations
            }
        }
    } //end private func readFile
} //end struct ContentView

struct JSONData: Decodable{
    let locations: [Location]

} //end struct JSONData

struct Location: Decodable, Identifiable {
    let id: Int
    let name: String
    let latitude: Double
    let longitude: Double
} //end struct Location

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
