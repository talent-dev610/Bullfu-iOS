//
//  PayAPI.swift
//  BullHu
//
//  Created by Good Developer on 2022/7/20.
//

import Foundation
import SwiftyJSON

extension NetworkManager {
    
    func initializePay(email: String, amount: Int, completion: @escaping (Bool, String, String) -> Void) {
        let params = [
            "email": email,
            "amount": amount
        ] as [String : Any]
        
        processRequest("/api/pay/initialize-payment", method: .post, params: params) { success, message, data in
            if success {
                let authUrl = data["authorization_url"].stringValue
                let reference = data["reference"].stringValue
                completion(true, authUrl, reference)
            } else {
                completion(false, message, "")
            }
        }
    }
    
    func verifyPay(reference: String, deliveryId: String, completion: @escaping (Bool, String) -> Void) {
        
        let params = [
            "reference": reference,
            "delivery_id": deliveryId
        ]
        
        processRequest("/api/pay/verify", method: .post, params: params) { success, message, data in
            completion(success, message)
        }
    }
    
    func allTransactions(completion: @escaping (Bool, [Transaction]) -> Void) {
        processRequest("/api/pay/all-transaction", method: .get) { success, message, data in
            if success {
                let transactions = try! JSONDecoder().decode([Transaction].self, from: JSON(data).rawData())
                completion(true, transactions)
            } else {
                completion(false, [])
            }
        }
    }
    
    // get all transaction using URLSession as an example
    func getAllTransaction(completion: @escaping (Bool, [Transaction]) -> Void) {
        guard let url = URL(string: baseURL + "/api/pay/all-transaction") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, res, err in
            if let data = data {
                let transactions = try! JSONDecoder().decode([Transaction].self, from: data)
                completion(true, transactions)
            } else {
                print("Failed to fetch data: ", err?.localizedDescription)
            }
        }.resume()
    }
    
}
