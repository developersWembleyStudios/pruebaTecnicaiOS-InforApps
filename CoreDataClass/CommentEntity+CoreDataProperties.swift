//
//  CommentEntity+CoreDataProperties.swift
//  InforApps
//
//  Created by Ruben Picado Garcia on 11/7/24.
//
//

import Foundation
import CoreData


extension CommentEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CommentEntity> {
        return NSFetchRequest<CommentEntity>(entityName: "CommentEntity")
    }

    @NSManaged public var postId: Int16
    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var body: String?

}

extension CommentEntity : Identifiable {

}
