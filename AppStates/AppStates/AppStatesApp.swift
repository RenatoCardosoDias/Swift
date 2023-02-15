//
//  AppStatesApp.swift
//  AppStates
//
//  Created by Renato on 09/02/23.
//

import SwiftUI

@main
struct AppStatesApp: App {
    @Environment(\.scenePhase) var scenePhase

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onChange(of: scenePhase) { phase in
                    if phase == .active {
                        print("The app is active")
                    } else if phase == .background{
                        print("The app is in the background")
                    }
                } //end .onChange
        } //end WindowGroup
    }
}
