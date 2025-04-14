//
//  MapView.swift
//  ChallengeConexa_MatiasMorales
//
//  Created by Matias Nicolas Morales on 11/04/2025.
//

import SwiftUI
import GoogleMaps
import CoreLocation

struct MapView: UIViewRepresentable {
    @ObservedObject private var locationManager = LocationManager()

    func makeUIView(context: Context) -> GMSMapView {
        let initialCamera = GMSCameraPosition.camera(withLatitude: 0, longitude: 0, zoom: 1)
        let mapView = GMSMapView(frame: .zero, camera: initialCamera)

        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        context.coordinator.mapView = mapView
        return mapView
    }

    func updateUIView(_ mapView: GMSMapView, context: Context) {
        guard let location = locationManager.userLocation else {
                print("Ubicación no disponible aún")
                return
            }
        print("Ubicación: \(location)")
        let camera = GMSCameraPosition.camera(withLatitude: location.latitude,
                                              longitude: location.longitude,
                                              zoom: 15)
        mapView.animate(to: camera)

        mapView.clear()
        let marker = GMSMarker()
        marker.position = location
        marker.map = mapView
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator {
        var mapView: GMSMapView?
    }
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    
    @Published var userLocation: CLLocationCoordinate2D?

    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            DispatchQueue.main.async {
                self.userLocation = location.coordinate
            }
        }
    }
}
