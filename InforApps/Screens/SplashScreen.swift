//
//  SplashScreen.swift
//  InforApps
//
//  Created by Ruben Picado Garcia on 11/7/24.
//

import SwiftUI

struct SplashScreen: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            if viewModel.isDataPostLoaded {
                HomeView()
            } else {
                Image("InforAppsImage")
                    .resizable()
                    .scaledToFit()
                    .padding()
                Text("Cargando...")
                    .onAppear {
                        viewModel.fetchAndSavePost()
                    }
            }
        }
    }
}

//#Preview {
//    SplashScreen()
//}
