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
    var games: [Game] = [.init(name: "Minicraft", rating: "99"),
                         .init(name: "God of War", rating: "98"),
                         .init(name: "Fortnine", rating: "92"),
                         .init(name: "Madden 2023", rating: "88")
    ]

//    @State private var path: [Game] = []

    @State private var path = NavigationPath()

    var body: some View {
//        NavigationStack (path: $path )
        NavigationStack {
            List{
                Section("Plataform") {
                    ForEach(plataforms, id: \.name) { plataform in
                        NavigationLink(value: plataform){
                            Label(plataform.name, systemImage: plataform.imageName)
                                .foregroundColor(plataform.color)
                        }
                    } //end ForEach
                } //end Section
                Section("Games") {
                    ForEach(games, id: \.name) { game in
                        NavigationLink(value: game) {
                            Text(game.name)
                        } //end NavigationLlink
                    } //end ForEach
//                    Button("Add Games") {
//                        path.append(games.first!)
//                    }
                } //end Section Game
            } //end List
            .navigationTitle("Gaming")
            .navigationDestination(for: Plataform.self) { plataform in
                ZStack {
                    plataform.color.ignoresSafeArea()
                    VStack{
                        Label(plataform.name, systemImage: plataform.imageName)
                            .font(.largeTitle).bold()
                        List {
                            ForEach(games, id: \.name) { game in
                                NavigationLink(value: game) {
                                    Text(game.name)
                                } //end NavigationLlink
                            } //end ForEach
                        } //end List
                    } //end VStack
                } //end ZStack
            } //end .navigationDestination
            .navigationDestination(for: Game.self) { game in
                VStack(spacing: 20){
                    Text("\(game.name) - \(game.rating)")
                        .font(.largeTitle.bold())

                    Button("Recommend game") {
                        path.append(games.randomElement()!)
                    }
                    Button("Go to another plataform") {
                        path.append(plataforms.randomElement()!)
                    }
                    Button("Go Home"){
                        path.removeLast(0)
                        path.removeAll(path.count) //remove todos os cliques que deu e vai direto para o root
                    }
                } //end Vstack
            } //end .navigationDestination
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

struct Game: Hashable {
    let name: String
    let rating: String
}
