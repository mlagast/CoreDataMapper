//
//  User+CoreDataProperties.swift
//  
//
//  Created by  Matthieu Lagast on 25/05/2017.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?

}
