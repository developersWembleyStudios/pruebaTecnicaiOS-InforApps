//
//  SplashScreen.swift
//  InforApps
//
//  Created by Ruben Picado Garcia on 11/7/24.
//

import SwiftUI

struct SplashScreen: View {
    @EnvironmentObject var viewModel: SplashViewModel
    
    var body: some View {
        VStack {
            if viewModel.isDataPostLoaded {
                HomeView()
            } else {
                Image(.inforApps)
                    .resizable()
                    .scaledToFit()
                    .padding()
                Text(NSLocalizedString("Charge_Data", comment: ""))
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
