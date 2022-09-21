//
//  HomeSearchViewModel.swift
//  BullHu
//
//  Created by Good Developer on 2022/6/10.
//

import Foundation
import MapKit

@MainActor
final class HomeSearchViewModel: ObservableObject {
    
    @Published var places = [Place]()
    
    func search(text: String, region: MKCoordinateRegion) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = text
        searchRequest.region = region
        
        let search = MKLocalSearch(request: searchRequest)
        
        search.start { response, err in
            guard let response = response else {
                print("ERROR: \(err?.localizedDescription ?? "Unknown error)")")
                return
            }
            
            self.places = response.mapItems.map(Place.init)
        }
    }
}
