//
//  ContentView.swift
//  AppMusicSearchApp
//
//  Created by Renato on 03/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                SearchBarView()
                EmptyStateView()
            } //end VStack
            .navigationTitle("Music Search")
        } //end NaviagionView
    } //end var body
} //end struct




//struct EmptyStateView: View {
//
//    var body: some View{
//        VStack{
//            Spacer()
//            Image(systemName: "music.note")
//                .font(.system(size: 85))
//                .padding(.bottom)
//            Text("Stating searching for music...")
//                .font(.title)
//            Spacer()
//        } //end VStack
//        .padding()
//        .foregroundColor(Color(.systemIndigo))
//    } //end var body
//} //end struct EmptyStateView

//struct SearchBar: UIViewRepresentable {
//    typealias UIViewType = UISearchBar
//
//    func makeUIView(context: Context) -> UISearchBar {
//        let searchBar = UISearchBar(frame: .zero)
//        searchBar.delegate = context.coordinator
//        searchBar.searchBarStyle = .minimal
//        searchBar.placeholder = "Type a song, or album name..."
//        return searchBar
//    } //end func makeUIView
//
//    func updateUIView(_ uiView: UISearchBar, context: Context) {
//
//    } //end func updateUIView
//
//    func makeCoordinator() -> SearchBarCoodinator {
//        return SearchBarCoodinator()
//    } //end func makeCoordinator
//
//    class SearchBarCoodinator: NSObject, UISearchBarDelegate {
//
//    }
//} //end struct SearchBar

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
