//
//  ContentView.swift
//  CustomFonts
//
//  Created by Renato on 11/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Arya Stark")
            .font(.custom(.regular, size: 24))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
