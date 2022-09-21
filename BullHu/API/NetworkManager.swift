//
//  NetworkManager.swift
//  BullHu
//
//  Created by Good Developer on 2022/6/13.
//

import Foundation
import SwiftyJSON
import Alamofire

final class NetworkManager {
    static let shared = NetworkManager()
    
    // MARK: - request
    func processRequest(_ request: String,
                        method: HTTPMethod,
                        params: [String: Any]? = nil,
                        completion: @escaping (_ success: Bool, _ message: String, _ data: JSON) -> ()) {
        
        var headers = HTTPHeaders()
        let jwt = AppData.shared.getJWT()
        headers.add(HTTPHeader(name: "Authorization", value: "Bearer \(jwt)"))
        
        AF.request(baseURL + request, method: method, parameters: params, encoding: JSONEncoding.default, headers: headers ).responseData { (result) in
            if let _ = result.error {
                print(result.error.debugDescription)
                completion(false, result.error.debugDescription, JSON.null)
            } else {
                if let value = result.value {
                    let json = JSON(value)
//                    print("JSON VALUE:", json)
                    
                    let resultSuccess = json["success"].boolValue
                    let message    = json["message"].stringValue
                    let result     = json["data"]
                    
                    if resultSuccess {
                        completion(resultSuccess, message, result)
                    } else {
                        completion(resultSuccess, message, JSON.null)
                    }
                }
            }
        }
    }
    
    func multipartDataUpload(_ multipartFormData: @escaping (MultipartFormData) -> Void,
                             request: String,
//                                 headers: [String: String] = [:],
                             completion: @escaping (_ status: Bool, _ message: String, _ data: JSON) -> ()) {
        
        var headers = HTTPHeaders()
        let jwt = AppData.shared.getJWT()
        headers.add(HTTPHeader(name: "Authorization", value: "Bearer \(jwt)"))
        
        AF.upload(multipartFormData: multipartFormData, to: baseURL + request, headers: headers).responseData { (result) in
            print("multiform result", result)
            if let error = result.error {
                print(error.localizedDescription)
                completion(false, error.localizedDescription, JSON.null)
            } else {
                if let value = result.value {
                    let json = JSON(value)
                    
                    let resultSuccess = json["success"].boolValue
                    let message       = json["message"].stringValue
                    let result        = json["data"]
                    
                    if resultSuccess {
                        completion(resultSuccess, message, result)
                    } else {
                        completion(resultSuccess, message, JSON.null)
                    }
                }
            }
        }
    }
}

