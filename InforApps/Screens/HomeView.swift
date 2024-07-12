//
//  ContentView.swift
//  InforApps
//
//  Created by Ruben Picado Garcia on 11/7/24.
//

import SwiftUI
import CoreData

struct HomeView: View {
    @StateObject private var viewModel = ViewModel()
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: PostEntity.entity(), sortDescriptors: [])
    private var posts: FetchedResults<PostEntity>
    
    @State private var showDetailWithId: Bool = false
    @State private var postIdForDetail: Int = 0
    
    var body: some View {
        NavigationView {
            Form {
                ForEach(posts, id: \.self) { post in
                    NavigationLink(destination: DetailView(postId: Int(post.id), userId: Int(post.userId), post: post)) {
                        VStack(alignment: .leading) {
                            Text(post.title ?? "Unknown")
                                .font(.headline)
                            Text(post.body ?? "No Email")
                                .font(.subheadline)
                                .lineLimit(1)
                        }
                    }
                }
            }
            .navigationTitle("Publicaciones")
        }
    }
}
