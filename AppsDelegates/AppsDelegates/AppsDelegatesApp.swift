//
//  AppsDelegatesApp.swift
//  AppsDelegates
//
//  Created by Renato on 09/02/23.
//

import SwiftUI

@main
struct AppsDelegatesApp: App {
    @UIApplicationDelegateAdaptor(DefiningACustomSceneDelegate.self) var appDelegate
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
        }
    }
}
