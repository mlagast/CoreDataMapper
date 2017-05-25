//
//  NSManagedObjectExtensions.swift
//  CoreDataMapper
//
//  Created by  Matthieu Lagast on 25/05/2017.
//  Copyright © 2017 mlagast. All rights reserved.
//

import CoreData
import Foundation
import ObjectMapper

extension NSManagedObject {
    public class func entityInfos(withType classType: NSManagedObject.Type, context: MapContext?) -> (entityDesc: NSEntityDescription?, context: NSManagedObjectContext?) {
        guard let context = context as? CoreDataMapContext else {
            return (nil, nil)
        }
        
        guard let entityDesc = NSEntityDescription.entity(forEntityName: context.entityName, in: context.managedObjectContext) else {
            return (nil, context.managedObjectContext)
        }
        
        return (entityDesc, context.managedObjectContext)
    }
}
