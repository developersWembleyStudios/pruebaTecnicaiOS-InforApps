//
//  GeoEntity+CoreDataProperties.swift
//  InforApps
//
//  Created by Ruben Picado Garcia on 11/7/24.
//
//

import Foundation
import CoreData


extension GeoEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GeoEntity> {
        return NSFetchRequest<GeoEntity>(entityName: "GeoEntity")
    }

    @NSManaged public var lat: String?
    @NSManaged public var lng: String?

}

extension GeoEntity : Identifiable {

}
