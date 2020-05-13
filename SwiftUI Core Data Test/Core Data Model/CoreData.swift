//
//  CoreData.swift
//  CoreDataSUI
//
//  Created by Erik Kuipers on 05/04/20
//  Copyright © 2020  ECKO Design. All rights reserved.
//

import CoreData

class CoreData: NSObject {
    
    static let stack = CoreData()   // Singleton
    
    // MARK: - Core Data stack
    
    private lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "SwiftUI_Core_Data_Test")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let nserror = error as NSError? {
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        })
        return container
    }()
    
    public var context: NSManagedObjectContext {
        
        get {
            return self.persistentContainer.viewContext
        }
    }
    
    // MARK: - Core Data Saving support
    
    public func save() {
        
        if self.context.hasChanges {
            do {
                try self.context.save()
                print("In CoreData.stack.save()")
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // MARK: - Database setup
    
    public class func initialDbSetup() -> Void {
        
        if Item.count() == 0 {
            for i in 0...1 {
                let item = Item.createItem(name: "Desk \(i)", order: i, itemdescription: "")
                for j in 0...1 {
                    _ = Attribute.createAttributeFor(item: item, name: "Item \(i).\(j)", order: j, itemdescription: "")
                }
            }
        }
    }
    
    // MARK: - Managed Object Helpers
    
    class func executeBlockAndCommit(_ block: @escaping () -> Void) {
        
        block()
        CoreData.stack.save()
    }
    
}
