//
//  Persistance.swift
//  CoreDataExample
//
//  Created by Maurício de Moura on 13/06/23.
//

import Foundation
import CoreData

struct PersistanceController{
    static let shared = PersistanceController()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false){
        container = NSPersistentContainer(name: "DataModel")
        
        if inMemory{
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.loadPersistentStores { NSPersistentStoreDescription, err in
            if let err = err{
                fatalError(err.localizedDescription)
            }
        }
    }
    
    func save() throws{
        let context = container.viewContext
        if context.hasChanges{
            try context.save()
        }
    }
    
    func delete(_ object: NSManagedObject) throws {
        let context = container.viewContext
        context.delete(object)
        try save()
    }
}
