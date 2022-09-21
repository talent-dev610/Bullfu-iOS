//
//  UploadMedia.swift
//  BullHu
//
//  Created by Good Developer on 2022/7/20.
//

import Foundation
import SwiftyJSON

extension NetworkManager {
    func uploadAvatar(_ imgData: Data,
                      completion: @escaping (Bool, User?) -> ()) {
        
        multipartDataUpload({ (multiData) in
            multiData.append(imgData, withName: "image", fileName: "image.png", mimeType: "image/png")
        }, request: "/api/profile/upload-avatar") { (success, message, data) in
            if success {
                let user = try! JSONDecoder().decode(User.self, from: JSON(data["user"]).rawData())
                UserData.shared.setUser(user)
                completion(success, user)
            } else {
                completion(false, nil)
            }
        }
    }
}
