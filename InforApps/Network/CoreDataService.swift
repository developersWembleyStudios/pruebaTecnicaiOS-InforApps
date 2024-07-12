//
//  CoreData>Service.swift
//  InforApps
//
//  Created by Ruben Picado Garcia on 11/7/24.
//

import Foundation
import CoreData

class CoreDataService {
    static let shared = CoreDataService()
    
    private init() {}
    
    var container: NSPersistentContainer = {
        let nsContainer = NSPersistentContainer(name: "InforApps")
        nsContainer.loadPersistentStores { description, error in
            if let errorLoadData = error {
                print("Error load Data")
            }
        }
        return nsContainer
    }()
    
    var context: NSManagedObjectContext {
        return container.viewContext
    }
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Error Save Context: \(error)")
            }
        }
    }
    
    //Save User
    func saveUserElements(_ userElements: [UserElement]) {
        userElements.forEach { userElement in
            let userEntity = UserEntity(context: context)
            userEntity.id = Int16(userElement.id)
            userEntity.name = userElement.name
            userEntity.username = userElement.username
            userEntity.email = userElement.email
            userEntity.phone = userElement.phone
            userEntity.website = userElement.website

            let addressEntity = AddressEntity(context: context)
            addressEntity.street = userElement.address.street
            addressEntity.suite = userElement.address.suite
            addressEntity.city = userElement.address.city
            addressEntity.zipcode = userElement.address.zipcode

            let geoEntity = GeoEntity(context: context)
            geoEntity.lat = userElement.address.geo.lat
            geoEntity.lng = userElement.address.geo.lng

            addressEntity.geo = geoEntity
            userEntity.address = addressEntity

            let companyEntity = CompanyEntity(context: context)
            companyEntity.name = userElement.company.name
            companyEntity.catchPhrase = userElement.company.catchPhrase
            companyEntity.bs = userElement.company.bs

            userEntity.company = companyEntity
        }
        do {
            try context.save()
        } catch {
            print("Error saveUserElements()")
            print("Failed to save data: \(error)")
        }
    }
    
    //Save Post
    func savePostElements(_ postElements: [PostElement]) {
        postElements.forEach { postElement in
            let postEntity = PostEntity(context: context)
            postEntity.id = Int16(postElement.id)
            postEntity.userId = Int16(postElement.userId)
            postEntity.title = postElement.title
            postEntity.body = postElement.body
        }
        do {
            try context.save()
        } catch {
            print("Error savePostElements()")
            print("Failed to save data: \(error)")
        }
    }
    
    //Save Comment
    func saveCommentElements(_ commentElements: [CommentElement]) {
        commentElements.forEach { commentElement in
            let userEntity = CommentEntity(context: context)
            userEntity.postId = Int16(commentElement.postId)
            userEntity.id = Int16(commentElement.id)
            userEntity.name = commentElement.name
            userEntity.email = commentElement.email
            userEntity.body = commentElement.body
        }
        do {
            try context.save()
        } catch {
            print("Error saveCommentElements()")
            print("Failed to save data: \(error)")
        }
    }
    
    
    func fetchDataCommentByPost(postId: Int) -> [CommentEntity]? {
        let fetchRequest: NSFetchRequest<CommentEntity> = CommentEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "postId == %d", postId)
        do {
            let commentEntities = try context.fetch(fetchRequest)
            return commentEntities
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return nil
        }
    }
    
    func fetchUserByUserId(userId: Int) -> UserEntity? {
        let fetchRequest: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", userId)
        do {
            let userEntities = try context.fetch(fetchRequest)
            return userEntities.first
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return nil
        }
    }
}
