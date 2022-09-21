//
//  LocationManager.swift
//  BullHu
//
//  Created by Good Developer on 2022/6/10.
//

import Foundation
import CoreLocation
import MapKit

final class LocationManager: NSObject,ObservableObject {
    @Published var location: CLLocation?
    @Published var region = MKCoordinateRegion()
    
    private let locationManager = CLLocationManager()
    private var isSetRegion = false
    
    override init() {
        super.init()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        if !isSetRegion {
            DispatchQueue.main.async { [weak self] in
                self?.location = location
                self?.region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 5000, longitudinalMeters: 5000)
                self?.isSetRegion = true
            }
        }
    }
}
