//
//  Models.swift
//  InforApps
//
//  Created by Ruben Picado Garcia on 11/7/24.
//

import Foundation
import CoreData

///USER
struct UserElement: Codable {
    let id: Int
    let name, username, email: String
    let address: AddressElement
    let phone, website: String
    let company: CompanyElement
}

struct AddressElement: Codable {
    let street, suite, city, zipcode: String
    let geo: GeoElement
}

struct GeoElement: Codable {
    let lat, lng: String
}

struct CompanyElement: Codable {
    let name, catchPhrase, bs: String
}

///POST
struct PostElement: Codable {
    let userId, id: Int
    let title, body: String
}

//COMMENT
struct CommentElement: Codable {
    let postId, id: Int
    let name, email, body: String
}
