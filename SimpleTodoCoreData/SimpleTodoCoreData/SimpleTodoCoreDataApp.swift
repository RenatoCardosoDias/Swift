//
//  SimpleTodoCoreDataApp.swift
//  SimpleTodoCoreData
//
//  Created by Renato on 10/02/23.
//

import SwiftUI
import CoreData
@main
struct SimpleTodoCoreDataApp: App {

    let persistentContainer = CoreDataManager.shared.persistentContainer

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistentContainer.viewContext)
        }
    }
}
