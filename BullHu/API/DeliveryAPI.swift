//
//  DeliveryAPI.swift
//  BullHu
//
//  Created by Good Developer on 2022/7/20.
//

import Foundation
import SwiftyJSON

extension NetworkManager {
    
    // A consignor can create a new delivery request
    func requestDelivery(pickup: String, dropOff: String, emptyReturn: String,
                         size: String, weight: String,
                         pickupTime: String, tdoReady: Bool,
                         completion: @escaping(Bool, String) -> Void) {
        let params = [
            "pick_up_location": pickup,
            "drop_off_location": dropOff,
            "empty_return_location": emptyReturn,
            "container_size": size,
            "container_weight": weight,
            "pick_up_time": pickupTime,
            "tdo_ready": tdoReady
        ] as [String : Any]
        
        processRequest("/api/delivery/request", method: .post, params: params) { success, message, data in
            completion(success, message)
        }
    }
    
    // A driver will accept a delivery request with service price
    func acceptDelivery(deliveryId: String, price: String, completion: @escaping(Bool, String) -> Void) {
        let params = [
            "delivery_id": deliveryId,
            "price": price
        ]
        
        processRequest("/api/delivery/accept", method: .post, params: params) { success, message, data in
            completion(success, message)
        }
    }
    
    // get all delivery data for a consignor
    func allDeliveryForConsignor(completion: @escaping(Bool, [Delivery]) -> Void) {
        processRequest("/api/delivery/all-for-consignor", method: .get) { success, message, data in
            if success {
                let resultData = data.arrayValue
                var deliveries = [Delivery]()
                for item in resultData {
                    let deli = Delivery(data: item)
                    deliveries.append(deli)
                }
                completion(true, deliveries)
            } else {
                completion(false, [])
            }
        }
    }
    
    // get all delivery data for a driver
    func allDeliveryForDriver(completion: @escaping(Bool, [Delivery]) -> Void) {
        processRequest("/api/delivery/all-for-drivers", method: .get) { success, message, data in
            if success {
                let resultData = data.arrayValue
                var deliveries = [Delivery]()
                for item in resultData {
                    let deli = Delivery(data: item)
                    deliveries.append(deli)
                }
                completion(true, deliveries)
            } else {
                completion(false, [])
            }
        }
    }
    
}
