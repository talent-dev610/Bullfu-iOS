//
//  Transaction.swift
//  BullHu
//
//  Created by Good Developer on 2022/7/20.
//

import Foundation

struct Transaction: Codable, Identifiable, Hashable {
    
    let id: String
    let consignorId: String
    let driverId: String
    let reference: String
    let amount: String
    let paidAt: String
    
    static let `default` = Self(id: "", consignorId: "", driverId: "", reference: "ABC123456", amount: "200", paidAt: "")
    
    enum CodingKeys: String, CodingKey {
        case id
        case consignorId = "consignor_id"
        case driverId = "driver_id"
        case reference
        case amount
        case paidAt
    }
    
}
