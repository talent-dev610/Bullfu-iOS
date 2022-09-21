//
//  ForgotPwdViewModel.swift
//  BullHu
//
//  Created by Good Developer on 2022/6/15.
//

import SwiftUI

final class ForgotPwdViewModel: ObservableObject {
    @Published var email: String = ""
    
    @Published var codeView: PinCodeView?
    @Published var code: String = ""
    @Published var isCodeSent = false
    
    @Published var isLoading = false
    @Published var errorAlert: AlertItem?
    @Published var isSucceeded = false
    
    func checkValid() {
        if !Utils.shared.isValidEmail(email) {
            errorAlert = AlertItem(message: "Email format is not correct. Please check it again.")
        } else {
            runSendCode()
        }
    }
    
    func runSendCode() {
        isLoading = true
        NetworkManager.shared.forgotPassword(email: email) { success, message in
            DispatchQueue.main.async { [self] in
                isLoading = false
                if success {
                    isCodeSent = true
                } else {
                    errorAlert = AlertItem(message: message.isEmpty ? "Server Error" : message)
                }
            }
        }
    }
    
    func runVerifyCode() {
        isLoading = true
        codeView?.getCode()
        if code.isEmpty || code.count < 6 {
            errorAlert = AlertItem(message: "Please check code.")
        } else {
            NetworkManager.shared.confirmResetCode(email: email, code: code) { success, message in
                DispatchQueue.main.async { [self] in
                    isLoading = false
                    if success {
                        isSucceeded = true
                    } else {
                        errorAlert = AlertItem(message: message.isEmpty ? "Server Error. Please try again later." : message)
                    }
                }
            }
        }
    }
    
}
