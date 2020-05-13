//
//  Attribute+CoreDataProperties.swift
//  CoreDataSUI
//
//  Created by Erik Kuipers on 05/04/20.
//  Copyright © 2020  ECKO Design. All rights reserved.
//
//

import Foundation
import CoreData


extension Attribute {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Attribute> {
        return NSFetchRequest<Attribute>(entityName: "Attribute")
    }
    
    @NSManaged public var name: String
    @NSManaged public var order: Int32
    @NSManaged public var itemdescription: String
    @NSManaged public var item: Item
    
}
