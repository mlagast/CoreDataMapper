//
//  User+CoreDataClass.swift
//  
//
//  Created by  Matthieu Lagast on 25/05/2017.
//
//

import Foundation
import CoreData
import ObjectMapper

@objc(User)
public class User: NSManagedObject, Mappable {

    required public init?(map: Map) {
        let (entityDesc, managedObjectContext) = NSManagedObject.entityInfos(withType: User.self, context: map.context)
        super.init(entity: entityDesc!, insertInto: managedObjectContext)
    }
    
    public func mapping(map: Map) {
        name <- map["name"]
    }
}
