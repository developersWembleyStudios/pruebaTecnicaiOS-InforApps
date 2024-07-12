//
//  AddressEntity+CoreDataProperties.swift
//  InforApps
//
//  Created by Ruben Picado Garcia on 11/7/24.
//
//

import Foundation
import CoreData


extension AddressEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AddressEntity> {
        return NSFetchRequest<AddressEntity>(entityName: "AddressEntity")
    }

    @NSManaged public var street: String?
    @NSManaged public var suite: String?
    @NSManaged public var city: String?
    @NSManaged public var zipcode: String?
    @NSManaged public var geo: GeoEntity?

}

extension AddressEntity : Identifiable {

}
