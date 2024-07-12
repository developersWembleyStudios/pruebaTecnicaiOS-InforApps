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
    
    @Environment(\.presentationMode) var presentationMode
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
        ZStack{
            CustomToolBarBackButtonView(title: NSLocalizedString("Title_Custom_Toolbar", comment: ""))  {
                presentationMode.wrappedValue.dismiss()
            }
        }
        VStack{
            Map(coordinateRegion: $cameraPosition, annotationItems: [Location(coordinate: coordinate)]) { location in
                MapMarker(coordinate: location.coordinate, tint: .red)
            }
            HStack{
                Button(action: {
                    viewModel.openWebsite(urlString: "https://www.\(user.website ?? "apple.com/es/")")
                }) {
                    ActAssignedButtonActionFinalization(text: NSLocalizedString("User_Website", comment: ""))
                        .padding(.leading, 30)
                        .padding(.trailing, 30)
                }
            }.background(.white)
                .frame(height: 100)
        }.sheet(isPresented: $viewModel.showWebView) {
            if let url = viewModel.webViewURL {
                WebView(url: url)
            }
        }
    }
}
