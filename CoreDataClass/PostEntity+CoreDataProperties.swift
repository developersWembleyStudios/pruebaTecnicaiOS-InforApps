//
//  PostEntity+CoreDataProperties.swift
//  InforApps
//
//  Created by Ruben Picado Garcia on 11/7/24.
//
//

import Foundation
import CoreData


extension PostEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PostEntity> {
        return NSFetchRequest<PostEntity>(entityName: "PostEntity")
    }

    @NSManaged public var userId: Int16
    @NSManaged public var id: Int16
    @NSManaged public var title: String?
    @NSManaged public var body: String?

}

extension PostEntity : Identifiable {

}
