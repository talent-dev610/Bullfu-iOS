//
//  ChangePwdViewModel.swift
//  BullHu
//
//  Created by Good Developer on 2022/6/16.
//

import SwiftUI

final class ChangePwdViewModel: ObservableObject {
    
    @Published var password: String = ""
    @Published var newPassword: String = ""
    @Published var confirmPwd: String = ""
    @Published var isSecured = true
    @Published var isNewSecured = true
    @Published var isConfirmSecured = true
    
    @Published var isLoading = false
    @Published var errorAlert: AlertItem?
    @Published var isSucceeded = false
    
    func checkValid() {
        if password.isEmpty || newPassword.isEmpty || confirmPwd.isEmpty {
            errorAlert = AlertItem(message: "Please enter passwords")
            return
        }
        if newPassword != confirmPwd {
            errorAlert = AlertItem(message: "Password doesn't match. Please check it again.")
            return
        }
        
        runUpdate()
    }
    
    func runUpdate() {
        isLoading = true
        NetworkManager.shared.changePassword(oldPwd: password, newPwd: newPassword) { success, message in
            self.isSucceeded = success
            self.isLoading = false
            if success {
                UserData.shared.setPassword(self.newPassword)
                self.errorAlert = AlertItem(message: "Password is changed successfully.")
                self.password = ""
                self.newPassword = ""
                self.confirmPwd = ""
            } else {
                self.errorAlert = AlertItem(message: message)
            }
        }
    }
}
