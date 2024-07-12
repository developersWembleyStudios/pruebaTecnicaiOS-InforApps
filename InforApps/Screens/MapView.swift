//
//  MapView.swift
//  InforApps
//
//  Created by Ruben Picado Garcia on 12/7/24.
//

import SwiftUI
import MapKit

struct Location: Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    @StateObject private var viewModel = MapViewModel()
    
    var coordinate: CLLocationCoordinate2D
    var user: UserEntity
    
    @State private var cameraPosition: MKCoordinateRegion
    
    init(coordinate: CLLocationCoordinate2D, user: UserEntity) {
        self.coordinate = coordinate
        _cameraPosition = State(initialValue: MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        ))
        self.user = user
    }
    
    var body: some View {
        VStack{
            Map(coordinateRegion: $cameraPosition, annotationItems: [Location(coordinate: coordinate)]) { location in
                MapMarker(coordinate: location.coordinate, tint: .red)
            }
            HStack{
                Button(action: {
                    viewModel.openWebsite(urlString: "https://www.\(user.website ?? "apple.com/es/")")
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
            }.background(.white)
                .frame(height: 200)
        }.sheet(isPresented: $viewModel.showWebView) {
            if let url = viewModel.webViewURL {
                WebView(url: url)
            }
        }
    }
}


//#Preview {
//    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
//}
