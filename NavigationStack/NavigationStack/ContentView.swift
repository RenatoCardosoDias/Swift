//
//  ContentView.swift
//  NavigationStack
//
//  Created by Renato on 15/02/23.
//

import SwiftUI

struct ContentView: View {

    var plataforms: [Plataform] = [.init(name: "Xbox", imageName: "xbox.logo", color: .green),
                                  .init(name: "Playstation", imageName: "play.loto", color: .indigo),
                                  .init(name: "PC", imageName: "pc", color: .pink),
                                  .init(name: "Moblie", imageName: "iphone", color: .mint)]

    var body: some View {
        NavigationStack{
            List{
                Section("Plataform") {
                    ForEach(plataforms, id: \.name) { plataform in
                        NavigationLink(value: plataform){
                            Label(plataform.name, systemImage: plataform.imageName)
                                .foregroundColor(plataform.color)
                        }
                    } //end ForEach
                } //end Section
            } //end List
            .navigationTitle("Gaming")
        } //end NavigationStack
    } //end var body
} //end struct

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Plataform: Hashable{
    let name: String
    let imageName: String
    let color: Color
}
