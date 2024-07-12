//
//  DetailView.swift
//  InforApps
//
//  Created by Ruben Picado Garcia on 11/7/24.
//

import SwiftUI

struct DetailView: View {
    @StateObject private var viewModel = DetailViewModel()
    
    var postId: Int
    var userId: Int
    var post: PostEntity

    var body: some View {
            if viewModel.commentByIdCharge && viewModel.userByIdCharge {
                if viewModel.commentsById != nil && viewModel.userById != nil {
                    let user = viewModel.userById!
                    ScrollView {
                        VStack {
                            LabelTitle(title: NSLocalizedString("Detail_Post_Title", comment: ""))

                            LabelH1(headline: NSLocalizedString("Detail_Post_Title_Post", comment: ""), subheadline: post.title ?? "No_Data")
                            LabelH1(headline: NSLocalizedString("Content_Post_Headline", comment: ""), subheadline: post.body ?? NSLocalizedString("No_Data", comment: ""))
                            
                            LabelTitle(title: NSLocalizedString("Detail_User_Title", comment: ""))
                            
                            LabelH1(headline: NSLocalizedString("Detail_User_Title_Name", comment: ""), subheadline: user.name ?? NSLocalizedString("No_Data", comment: ""))
                            LabelH1(headline: NSLocalizedString("Detail_User_Title_Email", comment: ""), subheadline: user.email ?? NSLocalizedString("No_Data", comment: ""))
                            LabelH1(headline: NSLocalizedString("Detail_User_Title_Company", comment: ""), subheadline: user.company?.name ?? NSLocalizedString("No_Data", comment: ""))
                            ButtonMapViewWebsite(latitude: Double(user.address?.geo?.lat ?? "0.000") ?? 0.00, longitude: Double(user.address?.geo?.lng ?? "0.0000") ?? 0.00, website: user.website ?? "https://www.apple.com/es/")
                            
                            LabelTitle(title: NSLocalizedString("Detail_Comments_Title", comment: ""))
                            VStack {
                                Form {
                                    ForEach(viewModel.commentsById!, id: \.self) {comment in
                                        VStack(alignment: .leading) {
                                            Text(comment.name ?? NSLocalizedString("No_Data", comment: ""))
                                                .font(.headline)
                                            Text(comment.email ?? NSLocalizedString("No_Data", comment: ""))
                                                .font(.subheadline)
                                                .lineLimit(1)
                                        }
                                    }
                                }
                            }
                            .frame(height: 500)
                        }.offset(y: -50)
                    }
                } else {
                    Text(NSLocalizedString("Recover_Data", comment: ""))
                }
            } else {
                Image(.inforApps)
                    .resizable()
                    .scaledToFit()
                    .padding()
                Text(NSLocalizedString("Charge_Data", comment: ""))
                    .onAppear {
                        viewModel.searchCommentByPostId(postId: postId)
                        viewModel.searchUserById(userId: userId)
                    }
            }
    }
}

//#Preview {
//    DetailView()
//}
