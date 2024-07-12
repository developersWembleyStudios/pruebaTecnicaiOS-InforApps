//
//  DetailView.swift
//  InforApps
//
//  Created by Ruben Picado Garcia on 11/7/24.
//

import SwiftUI
import MapKit

struct DetailView: View {
    @StateObject private var viewModel = DetailViewModel()
    
    @State private var showWebView = false
    @State private var webViewURL: URL?
    
    var postId: Int
    var userId: Int
    var post: PostEntity
    
    var body: some View {
        if viewModel.commentByIdCharge && viewModel.userByIdCharge {
            if viewModel.commentsById != nil && viewModel.userById != nil {
                let user = viewModel.userById!
                ScrollView {
                    VStack {
                        LabelHeader(title: NSLocalizedString("Detail_Post_Title", comment: ""), color: .green)
                        
                        LabelH1(headline: NSLocalizedString("Detail_Post_Title_Post", comment: ""), subheadline: post.title ?? "No_Data")
                        LabelH1(headline: NSLocalizedString("Content_Post_Headline", comment: ""), subheadline: post.body ?? NSLocalizedString("No_Data", comment: ""))
                        
                        LabelHeader(title: NSLocalizedString("Detail_User_Title", comment: ""), color: .blue)
                        
                        LabelH1(headline: NSLocalizedString("Detail_User_Title_Name", comment: ""), subheadline: user.name ?? NSLocalizedString("No_Data", comment: ""))
                        LabelH1(headline: NSLocalizedString("Detail_User_Title_Email", comment: ""), subheadline: user.email ?? NSLocalizedString("No_Data", comment: ""))
                        LabelH1(headline: NSLocalizedString("Detail_User_Title_Company", comment: ""), subheadline: user.company?.name ?? NSLocalizedString("No_Data", comment: ""))
                        HStack {
                            Spacer()
                            Button(action: {
                                showWebView = true
                            }) {
                                HStack(spacing: 0) {
                                    Spacer().frame(width: 30)
                                    Text("Address_User")
                                        .tint(.black)
                                    Image(systemName: "mappin.and.ellipse.circle.fill")
                                        .padding(.top, 14)
                                        .padding(.bottom, 14)
                                        .padding(.leading, 20)
                                    Spacer()
                                }
                            }
                            .frame(width: 180, height: 20)
                            .buttonStyle(.bordered)
                            .tint(.blue)
                            Spacer()
                        }
                        .padding(.top, 30)
                    }.offset(y: -50)
                        .fullScreenCover(isPresented: $showWebView, onDismiss: { showWebView = false}
                        ) {
                            MapView(coordinate: CLLocationCoordinate2D(latitude: Double(user.address!.geo!.lat!)!, longitude: Double(user.address!.geo!.lng!)!), user: user)
                        }
                    LabelHeader(title: NSLocalizedString("Detail_Comments_Title", comment: ""), color: .yellow)
                    VStack {
                        ForEach(viewModel.commentsById!, id: \.self) {comment in
                            VStack(alignment: .leading) {
                                Divider()
                                Text(comment.name ?? NSLocalizedString("No_Data", comment: ""))
                                    .font(.custom("Inter-Bold", size: 19))
                                Spacer().frame(height: 5)
                                Text(comment.email ?? NSLocalizedString("No_Data", comment: ""))
                                    .font(.custom("Inter-Medium", size: 16))
                                    .lineLimit(1)
                            }.padding(.leading, 30)
                                .padding(.trailing, 30)
                        }
                    }
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
