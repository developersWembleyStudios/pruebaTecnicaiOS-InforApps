//
//  ToolBar.swift
//  InforApps
//
//  Created by Ruben Picado Garcia on 12/7/24.
//

import SwiftUI

struct CustomToolBarBackButtonView: View {
    @Environment(\.presentationMode) var presentationMode
    var title: String
    var actionBack : ()->Void
    var body: some View {
        ZStack {
            HStack {
                Button(action: {
                    actionBack()
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.backward")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 23, height: 23)
                        .padding(.leading, 20)
                        .foregroundStyle(.blue)
                }
                Color(.backgroundPrincipal).ignoresSafeArea(.all)
            }
            .background(Color("BackgroundPrincipal"))
            .frame(height: 70)
            HStack {
                Text(title)
                    .font(.custom("Inter-Medium", size: 16))
                    .foregroundColor(.blue)
            }
        }
    }
}

//#Preview {
//    CustomToolBarBackButtonView(title: "Volver al detalle")
//}
