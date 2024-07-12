//
//  MapViewModel.swift
//  InforApps
//
//  Created by Ruben Picado Garcia on 12/7/24.
//

import Foundation


class MapViewModel: ObservableObject {
    
    @Published var showWebView = false
    @Published var webViewURL: URL?
    
    
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
