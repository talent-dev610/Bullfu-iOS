//
//  AcceptDeliveryViewModel.swift
//  BullHu
//
//  Created by Good Developer on 2022/7/22.
//

import SwiftUI

final class AcceptDeliveryViewModel: ObservableObject {
    
    @Published var price: String = ""
    
    @Published var isLoading = false
    @Published var errorAlert: AlertItem?
    @Published var isSucceeded = false
    
    func runAccept(deliverId: String) {
        isLoading = true
        NetworkManager.shared.acceptDelivery(deliveryId: deliverId, price: price) { success, message in
            DispatchQueue.main.async { [self] in
                isLoading = false
                if success {
                    isSucceeded = true
                } else {
                    errorAlert = AlertItem(message: message)
                }
            }
        }
    }
}
