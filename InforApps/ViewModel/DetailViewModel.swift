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
    
    //Function to search comments by postId
    func searchCommentByPostId(postId: Int) {
        let commentsById = CoreDataService.shared.fetchDataCommentByPost(postId: postId)
        if let commentsId = commentsById {
            self.commentByIdCharge = true
            self.commentsById = commentsId
        }
    }
    
    //Function to search user comment by userId
    func searchUserById(userId: Int) {
        let userById = CoreDataService.shared.fetchUserByUserId(userId: userId)
        if let user = userById {
            self.userByIdCharge = true
            self.userById = user
        }
    }
}
