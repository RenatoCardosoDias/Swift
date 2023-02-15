//
//  DefiningACustomSceneDelegate.swift
//  AppsDelegates
//
//  Created by Renato on 09/02/23.
//

import UIKit

class DefiningACustomSceneDelegate: NSObject, UIApplicationDelegate {
    private func application(_ app: UIApplication, didFinishLauchingWithOptions lauchingOptions: [UIApplication.LaunchOptionsKey : Any]? = nil ) -> Bool {
        print("App has lunched")
        return true
    }
    func application(_ app: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let config = UISceneConfiguration(name: "Custom Delegate", sessionRole: connectingSceneSession.role)
        if connectingSceneSession.role == .windowApplication {
            config.delegateClass = DefiningACustomSceneDelegate.self
        }
        return config
    }
}
