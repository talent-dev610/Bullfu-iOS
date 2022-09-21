//
//  ResetPwdViewModel.swift
//  BullHu
//
//  Created by Good Developer on 2022/6/15.
//

import SwiftUI

final class ResetPwdViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPwd: String = ""
    @Published var isSecured = true
    @Published var isConfirmSecured = true
    
    @Published var isLoading = false
    @Published var errorAlert: AlertItem?
    @Published var isSucceeded = false
    
    func checkValid() {
        if password != confirmPwd {
            errorAlert = AlertItem(message: "Password doesn't match. Please confirm it again.")
            return
        }
        
        runResetPassword()
    }
    
    func runResetPassword() {
        isLoading = true
        NetworkManager.shared.resetPassword(email: email, password: password) { success, user in
            DispatchQueue.main.async { [self] in
                isLoading = false
                if success {
                    isSucceeded = true
                    AppData.shared.setRegister(true)
                    UserData.shared.setPassword("")
                } else {
                    errorAlert = AlertItem(message: "Email or password is wrong. Please try again.")
                }
            }
        }
    }
}

