//
//  File.swift
//  BullHu
//
//  Created by Good Developer on 2022/6/3.
//

import SwiftUI

struct User: Hashable, Codable, Identifiable, Equatable {
    let id: String
    var name: String
    var email: String
    var phone: String
    var phoneCountryCode: String
    var photo: String
    var type: String // category - 0: consignor, 1: driver
    var createdAt: String
    
    static let `default` = Self(id: "", name: "Peterson Mallik", email: "bullhu@gmail.com", phone: "", phoneCountryCode: "", photo: "", type: "", createdAt: "")
    
    init(id: String, name: String, email: String, phone: String, phoneCountryCode: String, photo: String, type: String, createdAt: String) {
        self.id = id
        self.name = name
        self.email = email
        self.phone = phone
        self.phoneCountryCode = phoneCountryCode
        self.photo = photo
        self.type = type
        self.createdAt = createdAt
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case email
        case phone
        case phoneCountryCode = "phone_country_code"
        case photo
        case type = "category"
        case createdAt
    }
}

class UserData {
    static let shared = UserData()
    let defaults = UserDefaults.standard
    
    func setUser(_ user: User) {
        let encoder = JSONEncoder()
        if let encodedUser = try? encoder.encode(user) {
            defaults.set(encodedUser, forKey: "PrimanyAccountUser")
            defaults.synchronize()
        }
    }
    func getUser() -> User {
        if let saved = defaults.object(forKey: "PrimanyAccountUser") as? Data {
            let decoder = JSONDecoder()
            if let me = try? decoder.decode(User.self, from: saved) {
                return me
            }
        }
        return User(id: "", name: "", email: "", phone: "", phoneCountryCode: "", photo: "", type: "", createdAt: "")
    }
    func setPassword(_ value: String) {
        defaults.set(value, forKey: "UserPassword")
        defaults.synchronize()
    }
    func getPassword() -> String {
        return defaults.string(forKey: "UserPassword") ?? ""
    }
}
