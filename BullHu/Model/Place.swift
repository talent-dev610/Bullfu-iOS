//
//  Place.swift
//  BullHu
//
//  Created by Good Developer on 2022/6/10.
//

import Foundation
import MapKit
import CoreLocation

struct Place: Identifiable, Hashable {
    let id = UUID()
    private var mapItem: MKMapItem
    
    init(mapItem: MKMapItem) {
        self.mapItem = mapItem
    }
    
    var name: String {
        mapItem.name ?? ""
    }
    
    var latitude: Double {
        mapItem.placemark.coordinate.latitude
    }
    
    var longitude: Double {
        mapItem.placemark.coordinate.longitude
    }
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    func detail() -> String {
        "\(latitude),\(longitude)"
    }
}
