//
//  AppData.swift
//  BullHu
//
//  Created by Good Developer on 2022/6/7.
//

import Foundation

final class AppData {
    static let shared = AppData()
    let defaults = UserDefaults.standard
    
    func setRegister(_ value: Bool) {
        defaults.set(value, forKey: "Registered")
        defaults.synchronize()
    }
    func isRegistered() -> Bool {
        return defaults.bool(forKey: "Registered")
    }
    
    func setJWT(_ value: String) {
        defaults.set(value, forKey: "UserJWT")
        defaults.synchronize()
    }
    func getJWT() -> String {
        return defaults.string(forKey: "UserJWT") ?? ""
    }
    
}
