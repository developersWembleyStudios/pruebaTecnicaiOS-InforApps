//
//  Buttons.swift
//  InforApps
//
//  Created by Ruben Picado Garcia on 12/7/24.
//

import SwiftUI

struct ButtonMapViewWebsite: View {
    @StateObject private var viewModel = DetailViewModel()
    
    var latitude: Double
    var longitude: Double
    
    var website: String
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                viewModel.openAppleMaps(latitude: latitude, longitude: longitude)
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
            Button(action: {
                viewModel.openWebsite(website: website)
            }) {
                HStack(spacing: 0) {
                    Spacer().frame(width: 30)
                    Text("User_Website")
                        .tint(.black)
                    Image(systemName: "apps.iphone")
                        .padding(.top, 14)
                        .padding(.bottom, 14)
                        .padding(.leading, 20)
                    Spacer()
                }
            }
            .frame(width: 180, height: 20)
            .buttonStyle(.bordered)
            .tint(.green)
            Spacer()
        }
        .padding(.top, 30)
        .padding(.bottom, 30)
    }
}

//#Preview {
//    ButtonMapViewWebsite(latitude: -8.00, longitude: 15.000, website: "https://www.apple.com/es/")
//}
