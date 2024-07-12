//
//  DetailView.swift
//  InforApps
//
//  Created by Ruben Picado Garcia on 11/7/24.
//

import SwiftUI

struct DetailView: View {
    @StateObject private var viewModel = ViewModel()
    
    var postId: Int
    var userId: Int
    var post: PostEntity

    var body: some View {
            if viewModel.commentByIdCharge && viewModel.userByIdCharge {
                if viewModel.commentsById != nil && viewModel.userById != nil {
                    let user = viewModel.userById!
                    ScrollView {
                        VStack {
                            LabelTitle(title: "Publicación")

                            LabelH1(headline: "Titulo", subheadline: post.title ?? "NO TITLE")
                            LabelH1(headline: "Contenido", subheadline: post.body ?? "NO BODY")
                            
                            LabelTitle(title: "Usuario")
                            
                            LabelH1(headline: "Nombre", subheadline: user.name ?? "No Name")
                            LabelH1(headline: "Email", subheadline: user.email ?? "No Email")
                            LabelH1(headline: "Compañia", subheadline: user.company?.name ?? "No Company Name")
                            
                            LabelTitle(title: "Comentarios")
                            VStack {
                                Form {
                                    ForEach(viewModel.commentsById!, id: \.self) {comment in
                                        VStack(alignment: .leading) {
                                            Text(comment.name ?? "No Name")
                                                .font(.headline)
                                            Text(comment.email ?? "No Email")
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
                    Text("Intentando recuperar los datos...")
                }
            } else {
                Image("InforAppsImage")
                    .resizable()
                    .scaledToFit()
                    .padding()
                Text("Cargando...")
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
