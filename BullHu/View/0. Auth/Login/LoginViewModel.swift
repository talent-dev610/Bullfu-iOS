//
//  LoginViewModel.swift
//  BullHu
//
//  Created by Good Developer on 2022/6/5.
//

import SwiftUI

final class LoginViewModel: ObservableObject {
    
    @Published var isPresented = false
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isSecured = true
    
    @Published var isLoading = false
    @Published var errorAlert: AlertItem?
    @Published var isSucceeded = false
    
    func checkValid() {
        if email.isEmpty {
            errorAlert = AlertItem(message: "Please enter your email address.")
        } else if password.isEmpty {
            errorAlert = AlertItem(message: "Please enter password.")
        } else {
            runLogin()
        }
    }
    
    func runLogin() {
        isLoading = true
        
        NetworkManager.shared.signin(email: email, password: password) { success, user in
            DispatchQueue.main.async { [self] in
                isLoading = false
                if success {
                    isSucceeded = true
                    isPresented = true
                    AppData.shared.setRegister(true)
                    UserData.shared.setPassword(password)
                } else {
                    errorAlert = AlertItem(message: "Email or password is wrong. Please try again.")
                }
            }
        }
    }
}
