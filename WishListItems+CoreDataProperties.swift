//
//  WishListItems+CoreDataProperties.swift
//  
//
//  Created by killvak on 3/12/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension WishListItems {

    @NSManaged var image: NSData?
    @NSManaged var store: String?
    @NSManaged var title: String?

}
