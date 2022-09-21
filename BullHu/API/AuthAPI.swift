//
//  AuthAPI.swift
//  BullHu
//
//  Created by Good Developer on 2022/7/19.
//

import SwiftyJSON
import Foundation


extension NetworkManager {
    
    func signin(email: String,
               password: String,
               completion: @escaping (Bool, User?) -> Void) {
        
        let params = [
            "email": email,
            "password": password
        ]
        
        processRequest("/api/signin", method: .post, params: params) { success, message, data in
            if success {
                let token = data["token"].stringValue
                AppData.shared.setJWT(token)
                
                let user = try! JSONDecoder().decode(User.self, from: JSON(data["user"]).rawData())
                UserData.shared.setUser(user)
                
                completion(success, user)
            } else {
                completion(success, nil)
            }
        }
    }
    
    func signup(name: String, email: String, password: String,
                country: String, phone: String, category: String, completion: @escaping (Bool, User?) -> Void) {
        
        let params = [
            "name": name,
            "email": email,
            "password": password,
            "country": country,
            "phone": phone,
            "category": category
        ]
        
        processRequest("/api/signup", method: .post, params: params) { success, message, data in
            if success {
                let token = data["token"].stringValue
                AppData.shared.setJWT(token)
                
                let user = try! JSONDecoder().decode(User.self, from: JSON(data["user"]).rawData())
                UserData.shared.setUser(user)
                completion(success, user)
            } else {
                completion(success, nil)
            }
        }
    }
    
    
    
    func changePassword(oldPwd: String,
                        newPwd: String,
                        completion: @escaping (Bool, String) -> Void) {
        
        let params = [
            "current_password": oldPwd,
            "new_password": newPwd
        ]
        
        processRequest("/api/profile/change-password", method: .post, params: params) { success, message, data in
            completion(success, message)
        }
    }
    
    func updateProfile(name: String, country: String, phone: String,
                       completion: @escaping (Bool, User?) -> Void) {
        
        let params = [
            "name": name,
            "country_code": country,
            "phone": phone
        ]
        
        processRequest("/api/profile/update", method: .post, params: params) { success, message, data in
            if success {
                let user = try! JSONDecoder().decode(User.self, from: JSON(data["user"]).rawData())
                UserData.shared.setUser(user)
                completion(success, user)
            } else {
                completion(false, nil)
            }
        }
    }
    
    func forgotPassword(email: String, completion: @escaping (Bool, String) -> Void) {
        
        let params = [
            "email": email
        ]
        
        processRequest("/api/forgot-password", method: .post, params: params) { success, message, data in
            if success {
                completion(success, "")
            } else {
                completion(false, message)
            }
        }
    }
    
    func confirmResetCode(email: String, code: String, completion: @escaping (Bool, String) -> Void) {
        
        let params = [
            "email": email,
            "reset_code": code
        ]
        
        processRequest("/api/check-confirm-code", method: .post, params: params) { success, message, data in
            if success {
                completion(success, "")
            } else {
                completion(false, message)
            }
        }
    }
    
    func resetPassword(email: String, password: String, completion: @escaping (Bool, User?) -> Void) {
        
        let params = [
            "email": email,
            "password": password
        ]
        
        processRequest("/api/reset-password", method: .post, params: params) { success, message, data in
            if success {
                let token = data["token"].stringValue
                AppData.shared.setJWT(token)
                
                let user = try! JSONDecoder().decode(User.self, from: JSON(data["user"]).rawData())
                UserData.shared.setUser(user)
                completion(success, user)
            } else {
                completion(false, nil)
            }
        }
    }
    
}

