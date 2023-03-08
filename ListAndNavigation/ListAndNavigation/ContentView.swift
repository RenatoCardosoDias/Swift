//
//  ContentView.swift
//  ListAndNavigation
//
//  Created by Renato on 08/03/23.
// mostrando como podemos usar uma lista em swiftUI, como podemos usar com NavigationLink para navegar entre uma view e outra em seu app

//NavigationLink  - uma visualização que controla uma apresentação de navegação

import SwiftUI

struct ContentView: View {

    private let emojiList: [EmojiItem] = [
        EmojiItem(
            emoji: "👾",
            name: "Alien Monster",
            description: "A friendly-looking, tentacled space creature with two eyes."),
        EmojiItem(
            emoji: "🥑",
            name: "Avocado",
            description: "A pear-shaped avocado, sliced in half to show its yellow-green flesh and "
            + "large brown pit."),
        EmojiItem(
            emoji: "🍟",
            name: "French Fries",
            description: "Thin-cut, golden-brown French fries, served in a red carton, as at "
            + "McDonald’s."),
        EmojiItem(
            emoji: "🍕",
            name: "Pizza",
            description: "A slice of pepperoni pizza, topped with black olives on Google. WhatsApp "
            + "adds green pepper, Samsung white onion."),
        EmojiItem(
            emoji: "🧩",
            name: "Puzzle Piece",
            description: "Puzzle Piece was approved as part of Unicode 11.0 in 2018 under the name "
            + "“Jigsaw Puzzle Piece” and added to Emoji 11.0 in 2018."),
        EmojiItem(
            emoji: "🚀",
            name: "Rocket",
            description: "A rocket being propelled into space."),
        EmojiItem(
            emoji: "🗽",
            name: "Statue of Liberty",
            description: "The Statue of Liberty, often used as a depiction of New York City."),
        EmojiItem(
            emoji: "🧸",
            name: "Teddy Bear",
            description: "A classic teddy bear, as snuggled by a child when going to sleep."),
        EmojiItem(
            emoji: "🦄",
            name: "Unicorn",
            description: "The face of a unicorn, a mythical creature in the form of a white horse with "
            + "a single, long horn on its forehead."),
        EmojiItem(
            emoji: "👩🏽‍💻",
            name: "Woman Technologist",
            description: "A woman behind a computer screen, working in the field of technology."),
        EmojiItem(
            emoji: "🗺",
            name: "World Map",
            description: "A rectangular map of the world. Generally depicted as a paper map creased at "
            + "its folds, Earth’s surface shown in green on blue ocean."),
    ]


    //2ª implementar o navigationLink para cada linha da lista, quando tocar sobre isso vai nos mostrar um detalhe

    var body: some View {
        NavigationView{
            List(emojiList) { emojiItem in
                NavigationLink(destination: DetailsView(emojiItem: emojiItem)) {
                    HStack {
                        EmojiCircleView(emojiItem: emojiItem)
                        Text(emojiItem.name)
                            .font(.headline)
                    } //end HStack
                    .padding(7)
                } //end NavigationLink
            } //end List
            .navigationTitle("Emoji")
        } //end NavigationView
    } //end var body
} //end struct Content View

struct DetailsView: View {
    let emojiItem: EmojiItem

    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                EmojiCircleView(emojiItem: emojiItem)
                    .padding(.trailing, 5)

                Text(emojiItem.name)
                    .font(.largeTitle)
                    .bold()
                Spacer()
            } //end HStack
            Text(emojiItem.description)
                .padding(.top)
            Spacer()
        } //end VStack
        .padding()
        .navigationTitle(Text(emojiItem.name))
        .navigationBarTitleDisplayMode(.inline)
    } //end var boyd
} //end struct DetailView

struct EmojiCircleView: View {
    let emojiItem: EmojiItem

    var body: some View {
        ZStack {
            Text(emojiItem.emoji)
                .shadow(radius: 3)
                .font(.largeTitle)
                .frame(width: 65, height: 65)
                .overlay(
                    Circle().stroke(Color.purple, lineWidth: 3)
                ) //end .overlay
        } //end ZStack
    } //end var body
} //end struct EmojiCicleView

struct EmojiItem: Identifiable {
    let id = UUID()
    let emoji: String
    let name : String
    let description: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
