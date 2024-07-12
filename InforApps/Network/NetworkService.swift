//
//  NetworkService.swift
//  InforApps
//
//  Created by Ruben Picado Garcia on 11/7/24.
//

import Foundation
import SwiftUI


class NetworkService {
    
    static let shared = NetworkService()
    
    func fetchDataUser(completion: @escaping (Result<[UserElement], Error>) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            print("Error transform User URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetchDataUser(): \(error)")
                return
            }
            guard let data = data else {
                print("No data returned")
                return
            }
            do {
                let users = try JSONDecoder().decode([UserElement].self, from: data)
                completion(.success(users))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func fetchDataPost(completion: @escaping (Result<[PostElement], Error>) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            print("Error transform Post URL")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetchDataPost(): \(error)")
                return
            }
            guard let data = data else {
                print("Error linea 99 de fetchData()")
                print("No data returned")
                return
            }
            do {
                let users = try JSONDecoder().decode([PostElement].self, from: data)
                completion(.success(users))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

    func fetchDataComment(completion: @escaping (Result<[CommentElement], Error>) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/comments") else {
            print("Error transform Comment URL")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetchDataComment(): \(error)")
                return
            }
            guard let data = data else {
                print("Error linea 99 de fetchData()")
                print("No data returned")
                return
            }
            do {
                let users = try JSONDecoder().decode([CommentElement].self, from: data)
                completion(.success(users))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
