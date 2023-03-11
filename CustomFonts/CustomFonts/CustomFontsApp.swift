//
//  CustomFontsApp.swift
//  CustomFonts
//
//  Created by Renato on 11/03/23.
//

import SwiftUI

@main
struct CustomFontsApp: App {

    init () {
        printFonts()
    }
    func printFonts() {
        let fontFamilyNames = UIFont.familyNames

        for familyName in fontFamilyNames {
            print("-------")
            print("Font Family name -> [\(familyName)")
            let names = UIFont.fontNames(forFamilyName: familyName)
            print("Font names ==> [\(names)]")
        }
    } //end func printFonts

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
