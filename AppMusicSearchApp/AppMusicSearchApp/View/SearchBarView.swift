//
//  SearchBarView.swift
//  AppMusicSearchApp
//
//  Created by Renato on 03/03/23.
//

import SwiftUI

struct SearchBarView: UIViewRepresentable {
    typealias UIViewType = UISearchBar

    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Type a song, or album name..."
        return searchBar
    } //end func makeUIView

    func updateUIView(_ uiView: UISearchBar, context: Context) {

    } //end func updateUIView

    func makeCoordinator() -> SearchBarCoodinator {
        return SearchBarCoodinator()
    } //end func makeCoordinator

    class SearchBarCoodinator: NSObject, UISearchBarDelegate {

    }
} //end struct SearchBar

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
