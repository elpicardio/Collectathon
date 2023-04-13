//
//  Entity+CoreDataProperties.swift
//  Collectathon
//
//  Created by Chris Kay on 25/06/2022.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var format: String?
    @NSManaged public var type: String?
    
    var wrappedMediaType: String{
        type ?? "Unknown"
    }

}

extension Entity : Identifiable {

}
