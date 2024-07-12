//
//  ViewModel.swift
//  InforApps
//
//  Created by Ruben Picado Garcia on 11/7/24.
//

import Foundation
import CoreData

class ViewModel: ObservableObject {
    @Published var postIdSelected = 0
    
    @Published var isDataPostLoaded = false
    @Published var isDataUserLoaded = false
    @Published var isDataCommentLoaded = false
    @Published var commentByIdCharge = false
    @Published var userByIdCharge = false
    
    @Published var commentsById: [CommentEntity]?
    @Published var userById: UserEntity?

    func fetchAndSavePost() {
        NetworkService.shared.fetchDataPost { result in
            switch result {
            case .success(let posts):
                CoreDataService.shared.savePostElements(posts)
                DispatchQueue.main.async {
                    self.isDataPostLoaded = true
                }
            case .failure(let error):
                print("Failed to fetch posts: \(error)")
            }
        }
    }
    
    func fetchAndSaveUsers() {
        NetworkService.shared.fetchDataUser { result in
            switch result {
            case .success(let users):
                CoreDataService.shared.saveUserElements(users)
                DispatchQueue.main.async {
                    self.isDataUserLoaded = true
                }
            case .failure(let error):
                print("Failed to fetch users: \(error)")
            }
        }
    }
    
    func fetchAndSaveComment() {
        NetworkService.shared.fetchDataComment { result in
            switch result {
            case .success(let comments):
                CoreDataService.shared.saveCommentElements(comments)
                DispatchQueue.main.async {
                    self.isDataCommentLoaded = true
                }
            case .failure(let error):
                print("Failed to fetch comments: \(error)")
            }
        }
    }
    
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
}
