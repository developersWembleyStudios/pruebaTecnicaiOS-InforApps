//
//  HomeViewModel.swift
//  InforApps
//
//  Created by Ruben Picado Garcia on 12/7/24.
//

import Foundation
import CoreData


class SplashViewModel: ObservableObject {
    //HomeViewModel
    @Published var isDataPostLoaded = false
    @Published var isDataUserLoaded = false
    @Published var isDataCommentLoaded = false
    
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
                case .failure(let error):
                    print("Failed to fetch comments: \(error)")
                }
            }
        }
}
