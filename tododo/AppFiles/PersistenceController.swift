//
//  PersistanceController.swift
//  tododo
//
//  Created by Sandesh Naik on 23/05/26.
//

import CoreData

protocol PersistenceControllerProtocol {
    
}

struct PersistenceController {
    /// Singleton instance
    static let shared = PersistenceController()
    let container = NSPersistentContainer(name: "tododo")
    
    // Initialiser
    private init() {
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                print("Failed to load Persistance store")
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
}

struct MockPersistenceController {
    /// Singleton instance
    static let shared = MockPersistenceController()
    let container = NSPersistentContainer(name: "tododo")
    
    // Initialiser
    private init() {
        container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                print("Failed to load Persistance store")
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
}

extension PersistenceController {
    // Helper function to save the context manually
    func save() {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
