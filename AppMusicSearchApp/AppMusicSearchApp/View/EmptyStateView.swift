//
//  EmptyStateView.swift
//  AppMusicSearchApp
//
//  Created by Renato on 03/03/23.
//

import SwiftUI

struct EmptyStateView: View {

    var body: some View{
        VStack{
            Spacer()
            Image(systemName: "music.note")
                .font(.system(size: 85))
                .padding(.bottom)
            Text("Stating searching for music...")
                .font(.title)
            Spacer()
        } //end VStack
        .padding()
        .foregroundColor(Color(.systemIndigo))
    } //end var body
} //end struct EmptyStateView

struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView()
    }
}
