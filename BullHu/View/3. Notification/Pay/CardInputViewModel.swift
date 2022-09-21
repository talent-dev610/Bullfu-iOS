//
//  CardInputViewModel.swift
//  BullHu
//
//  Created by Good Developer on 2022/7/9.
//

import SwiftUI
import Paystack

final class CardInputViewModel: ObservableObject {
    @Published var cardNumber: String = ""
    @Published var cardExpiary: String = ""
    @Published var cardCvv: String = ""
    
    @Published var isLoading = false
    @Published var errorAlert: AlertItem?
    @Published var isSucceeded = false
    
    func checkValid() {
        if cardNumber.count < 19 {
            errorAlert = AlertItem(message: "Card number is not correct. Please check it agagin")
            return
        }
        if cardCvv.count != 3 {
            errorAlert = AlertItem(message: "CVV is not correct.")
            return
        }
        
        runPay()
    }
    
    func runPay() {
        Paystack.setDefaultPublicKey(paystackPublicKey)
    }
}
