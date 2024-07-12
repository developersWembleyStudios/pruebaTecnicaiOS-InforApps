//
//  InforAppsApp.swift
//  InforApps
//
//  Created by Ruben Picado Garcia on 11/7/24.
//

import SwiftUI
import CoreData


@main
struct InforAppsApp: App {
    let persistenceController = CoreDataService.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                SplashScreen()
                    .environment(\.managedObjectContext, persistenceController.context)
                    .environmentObject(SplashViewModel())
            }
        }
    }
}
