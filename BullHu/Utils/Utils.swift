//
//  Utils.swift
//  BullHu
//
//  Created by Good Developer on 2022/6/15.
//

import Foundation
import MapKit

final class Utils {
    static let shared = Utils()
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    func timestampFrom(date: Date) -> Int64 {
        return Int64(date.timeIntervalSince1970) * 1000
    }
    func getDateFrom(_ value: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = dateFormatter.date(from:value)!
        dateFormatter.dateFormat = "MMM dd,yyyy HH:mm a"
        let strDate = dateFormatter.string(from: date)
        
        return strDate
    }
    func getDateFrom(timestamp: Int64) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp / 1000))

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "MMMM dd HH:mm a"
        
        let strDate = dateFormatter.string(from: date)
        
        return strDate
    }
    
    func getAddressFrom(coordinate: CLLocationCoordinate2D, completion: @escaping (_ address: String) -> Void) {
        var addressString : String = ""
        let ceo: CLGeocoder = CLGeocoder()
        let loc: CLLocation = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
    
        ceo.reverseGeocodeLocation(loc, completionHandler: {(placemarks, error) in
            if (error != nil) {
                print("reverse geodcode fail: \(error!.localizedDescription)")
            }
            
            if let marks = placemarks {
                let pm = marks as [CLPlacemark]

                if pm.count > 0 {
                    let pm = placemarks![0]
                    
                    if pm.subLocality != nil {
                        addressString = addressString + pm.subLocality! + ", "
                    }
                    if pm.thoroughfare != nil {
                        addressString = addressString + pm.thoroughfare! + ", "
                    }
                    if pm.locality != nil {
                        addressString = addressString + pm.locality! // + ", "
                    }
                    /*
                    if pm.country != nil {
                        addressString = addressString + pm.country! + ", "
                    }
                    if pm.postalCode != nil {
                        addressString = addressString + pm.postalCode! + " "
                    }*/
                    print("address ===", addressString)
                    completion(addressString)
                }
            } else {
                return
            }
        })
    }
}


