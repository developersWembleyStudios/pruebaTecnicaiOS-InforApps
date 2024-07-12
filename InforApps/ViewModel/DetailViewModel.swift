//
//  DetailViewModel.swift
//  InforApps
//
//  Created by Ruben Picado Garcia on 12/7/24.
//

import Foundation


import Foundation
import CoreData
import SwiftUI


class DetailViewModel: ObservableObject {
    
    @Published var commentByIdCharge = false
    @Published var userByIdCharge = false
    
    @Published var commentsById: [CommentEntity]?
    @Published var userById: UserEntity?
    
    func searchCommentByPostId(postId: Int) {
        let commentsById = CoreDataService.shared.fetchDataCommentByPost(postId: postId)
        if let commentsId = commentsById {
            self.commentByIdCharge = true
            self.commentsById = commentsId
        }
    }
    
    func searchUserById(userId: Int) {
        let userById = CoreDataService.shared.fetchUserByUserId(userId: userId)
        if let user = userById {
            self.userByIdCharge = true
            self.userById = user
        }
    }
    
    func openAppleMaps(latitude: Double, longitude: Double) {
        if let appleMapsURL = URL(string: "http://maps.apple.com/maps?daddr=\(latitude),\(longitude)"),
           UIApplication.shared.canOpenURL(appleMapsURL) {
            UIApplication.shared.open(appleMapsURL, options: [:], completionHandler: nil)
        } else {
            // Manejar el caso en el que ni Google Maps ni Apple Maps estén disponibles
            print("Ni Google Maps ni Apple Maps están disponibles.")
        }
    }
    
    func openWebsite(website: String) {
        if let websiteUrl = URL(string: website),
           UIApplication.shared.canOpenURL(websiteUrl) {
            UIApplication.shared.open(websiteUrl, options: [:], completionHandler: nil)
        } else {
            // Manejar el caso en el que ni Google Maps ni Apple Maps estén disponibles
            print("No se puede abrir el sitio web")
        }
    }
}
