//
//  ContentView.swift
//  SinglePlayerTitcTacToe
//
//  Created by Renato on 20/02/23.
//
// If AI can, win, theh win
//If AI can't win, then block
//If AI can't block, then thake middel square'
//If AI can't take middle square, take random available square




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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
