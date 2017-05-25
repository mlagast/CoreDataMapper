//
//  CoreDataMapContext.swift
//  CoreDataMapper
//
//  Created by  Matthieu Lagast on 25/05/2017.
//  Copyright © 2017 mlagast. All rights reserved.
//

import CoreData
import Foundation
import ObjectMapper

public class CoreDataMapContext: MapContext {
    var managedObjectContext:NSManagedObjectContext
    var entityName: String
    
    init(managedObjectContext:NSManagedObjectContext, entityName:String) {
        self.managedObjectContext = managedObjectContext
        self.entityName = entityName
    }
}
