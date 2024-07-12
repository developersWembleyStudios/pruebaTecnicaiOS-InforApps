//
//  CompanyEntity+CoreDataProperties.swift
//  InforApps
//
//  Created by Ruben Picado Garcia on 11/7/24.
//
//

import Foundation
import CoreData


extension CompanyEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CompanyEntity> {
        return NSFetchRequest<CompanyEntity>(entityName: "CompanyEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var catchPhrase: String?
    @NSManaged public var bs: String?

}

extension CompanyEntity : Identifiable {

}
