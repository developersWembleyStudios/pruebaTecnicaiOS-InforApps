//
//  ContentView.swift
//  InforApps
//
//  Created by Ruben Picado Garcia on 11/7/24.
//

import SwiftUI
import CoreData

struct HomeView: View {
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
                                .font(.custom("Inter-Bold", size: 19))
                            Spacer().frame(height: 5)
                            Text(post.body ?? NSLocalizedString("No_Data", comment: ""))
                                .font(.custom("Inter-Medium", size: 16))
                                .lineLimit(1)
                        }
                    }
                }
            }
            .navigationTitle(NSLocalizedString("Home_Title", comment: ""))
        }
    }
}
