//
//  Delivery.swift
//  BullHu
//
//  Created by Good Developer on 2022/7/20.
//

import Foundation
import SwiftyJSON

struct Delivery: Codable, Identifiable, Hashable {
    let id: String
    var pickupLocationName: String
    var dropOffLocationName: String
    var emptyReturnLocationName: String
    var containerSize: String
    var containerWeight: String
    var pickupTime: String
    var tdoReady: Bool
    
    var consignor: User
    var driver: User
    
    var acceptStatus: String
    var deliveryPrice: String
    var createdAt: String
    
    static let `default` = Self(id: "", pickupLocationName: "55.559078, 13.071873", dropOffLocationName: "55.559078, 13.071873", emptyReturnLocationName: "55.559078, 13.071873", containerSize: "14*16", containerWeight: "10", pickupTime: "1653380943092", tdoReady: false, consignor: User.default, driver: User.default, acceptStatus: "", deliveryPrice: "30", createdAt: "")
    
    init(id: String, pickupLocationName: String, dropOffLocationName: String, emptyReturnLocationName: String, containerSize: String, containerWeight: String, pickupTime: String, tdoReady: Bool, consignor: User, driver: User, acceptStatus: String, deliveryPrice: String, createdAt: String) {
        self.id = id
        self.pickupLocationName = pickupLocationName
        self.dropOffLocationName = dropOffLocationName
        self.emptyReturnLocationName = emptyReturnLocationName
        self.containerSize = containerSize
        self.containerWeight = containerWeight
        self.pickupTime = pickupTime
        self.tdoReady = tdoReady
        self.consignor = consignor
        self.driver = driver
        self.acceptStatus = acceptStatus
        self.deliveryPrice = deliveryPrice
        self.createdAt = createdAt
    }
    
    init(data: JSON) {
        self.id = data["id"].stringValue
        self.pickupLocationName = data["pick_up_location"].stringValue
        self.dropOffLocationName = data["drop_off_location"].stringValue
        self.emptyReturnLocationName = data["empty_return_location"].stringValue
        self.containerSize = data["container_size"].stringValue
        self.containerWeight = data["container_weight"].stringValue
        self.pickupTime = data["pick_up_time"].stringValue
        self.tdoReady = data["tdo_ready"].boolValue
        self.acceptStatus = data["accept_status"].stringValue
        self.deliveryPrice = data["delivery_price"].stringValue
        self.createdAt = data["createdAt"].stringValue
        
        let conId = data["consignor_id"]["_id"].stringValue
        let conName = data["consignor_id"]["name"].stringValue
        let conPhoto = data["consignor_id"]["photo"].stringValue
        self.consignor = User(id: conId, name: conName, email: "", phone: "", phoneCountryCode: "", photo: conPhoto, type: "", createdAt: "")
        let driverId = data["driver_id"]["_id"].stringValue
        let driverName = data["driver_id"]["name"].stringValue
        let driverPhoto = data["driver_id"]["photo"].stringValue
        self.driver = User(id: driverId, name: driverName, email: "", phone: "", phoneCountryCode: "", photo: driverPhoto, type: "", createdAt: "")
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case pickupLocationName = "pick_up_location"
        case dropOffLocationName = "drop_off_location"
        case emptyReturnLocationName = "empty_return_location"
        case containerSize = "container_size"
        case containerWeight = "container_weight"
        case pickupTime = "pick_up_time"
        case tdoReady = "tdo_ready"
        case consignor = "consignor_id"
        case driver = "driver_id"
        case acceptStatus = "accept_status"
        case deliveryPrice = "delivery_price"
        case createdAt
    }
}
