//
//  Item+CoreDataProperties.swift
//  CoreDataSUI
//
//  Created by Erik Kuipers on 05/04/20.
//  Copyright © 2020  ECKO Design. All rights reserved.
//
//

import Foundation
import CoreData


extension Item {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }
    
    @NSManaged public var name: String
    @NSManaged public var itemdescription: String
    @NSManaged public var order: Int32
    @NSManaged public var selected: Bool
    @NSManaged public var attribute: Attribute
    
}
