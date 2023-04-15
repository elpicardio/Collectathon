//
//  Entity+CoreDataProperties.swift
//  Collectathon
//
//  Created by Christine Kay on 15/04/2023.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var format: String?
    @NSManaged public var id: UUID?
    @NSManaged public var idImport: UUID?
    @NSManaged public var name: String?
    @NSManaged public var posterData: Data?
    @NSManaged public var posterPath: String?
    @NSManaged public var type: String?
    @NSManaged public var backdropData: Data?

}

extension Entity : Identifiable {

}
