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
                            LabelTitle(title: NSLocalizedString("Detail_Post_Title", comment: ""))

                            LabelH1(headline: NSLocalizedString("Detail_Post_Title_Post", comment: ""), subheadline: post.title ?? "No_Data")
                            LabelH1(headline: NSLocalizedString("Content_Post_Headline", comment: ""), subheadline: post.body ?? NSLocalizedString("No_Data", comment: ""))
                            
                            LabelTitle(title: NSLocalizedString("Detail_User_Title", comment: ""))
                            
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
                            .padding(.bottom, 30)
                            
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
                            .fullScreenCover(isPresented: $showWebView, onDismiss: { showWebView = false}
                            ) {
                                MapView(coordinate: CLLocationCoordinate2D(latitude: Double(user.address!.geo!.lat!)!, longitude: Double(user.address!.geo!.lng!)!), user: user)
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
    
    func openWebsite(urlString: String) {
        print("Intentando abrir la direccion: \(urlString)")
        if let url = URL(string: urlString) {
            webViewURL = url
            showWebView = true
        } else {
            print("Invalid URL")
        }
    }
}

//#Preview {
//    DetailView()
//}
