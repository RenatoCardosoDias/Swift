//
//  ContentView.swift
//  NavigationStack
//
//  Created by Renato on 15/02/23.
//

import SwiftUI

struct ContentView: View {

    var plataform: [Plataform] = [.init(name: "Xbox", imageName: "xbox.logo", color: .green),
                                  .init(name: "Playstation", imageName: "play.loto", color: .indigo),
                                  .init(name: "PC", imageName: "pc", color: .pink),
                                  .init(name: "Moblie", imageName: "iphone", color: .mint)]

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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Plataform{
    let name: String
    let imageName: String
    let color: Color
}
