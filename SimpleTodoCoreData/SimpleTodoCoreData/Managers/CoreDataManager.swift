//
//  CoreDataManager.swift
//  SimpleTodoCoreData
//
//  Created by Renato on 10/02/23.
//


///Será responsável por gerenciar as configurações de nosso nucleo de pilha de dados

import Foundation
import CoreData

class CoreDataManager {

    let persistentContainer: NSPersistentContainer
    static let shared: CoreDataManager = CoreDataManager()

    private init() { //criamos como privado para não termos várias instâncias do gerenciador do nucleo de dados (core data manager)
        persistentContainer = NSPersistentContainer(name: "SimpleTodoModel")
        persistentContainer.loadPersistentStores { description , error  in
            if let error = error {
                fatalError("Unable to inicialize Core Data \(error)")
            }
        }
    }

} //end class CoreDataManager
