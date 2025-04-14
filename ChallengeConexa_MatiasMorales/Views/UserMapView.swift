//
//  UserMapView.swift
//  ChallengeConexa_MatiasMorales
//
//  Created by Matias Nicolas Morales on 11/04/2025.
//

import SwiftUI
import GoogleMaps

struct UserMapView: UIViewRepresentable {
    let user: User

    func makeUIView(context: Context) -> GMSMapView {
        let camera = GMSCameraPosition.camera(
            withLatitude: user.address.geo.lat,
            longitude: user.address.geo.lng,
            zoom: 12
        )
        let mapView = GMSMapView(frame: .zero, camera: camera)

        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: user.address.geo.lat, longitude: user.address.geo.lng)
        marker.title = user.name
        marker.snippet = user.address.city
        marker.map = mapView

        return mapView
    }

    func updateUIView(_ uiView: GMSMapView, context: Context) {}
}
