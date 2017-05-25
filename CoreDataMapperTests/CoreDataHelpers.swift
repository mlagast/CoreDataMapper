//
//  CoreDataHelpers.swift
//  CoreDataMapper
//
//  Created by  Matthieu Lagast on 25/05/2017.
//  Copyright © 2017 mlagast. All rights reserved.
//

import CoreData

func setUpInMemoryManagedObjectContext(with bundle:Bundle) -> NSManagedObjectContext? {
    guard let managedObjectModel = NSManagedObjectModel.mergedModel(from: [bundle]) else {
        return nil
    }
    
    let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
    do {
        try persistentStoreCoordinator.addPersistentStore(ofType: NSInMemoryStoreType, configurationName: nil, at: nil, options: nil)
    } catch {
        print("Adding in-memory persistent store failed")
    }
    
    let managedObjectContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.privateQueueConcurrencyType)
    managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
    
    return managedObjectContext
}

func fetchEntities(forName name:String, managedObjectContext:NSManagedObjectContext) -> [Any]? {
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: name)
    
    do {
        let managedObjects = try managedObjectContext.fetch(fetchRequest)
        return managedObjects
    } catch {
        fatalError("Failed to fetch employees: \(error)")
    }

    return nil
}
