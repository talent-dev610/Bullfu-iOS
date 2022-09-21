//
//  RegisterViewModel.swift
//  BullHu
//
//  Created by Good Developer on 2022/6/7.
//

import SwiftUI

final class RegisterViewModel: ObservableObject {
    
    @Published var phoneNumberField: PhoneNumberView?
    
    @Published var fullName: String = ""
    @Published var email: String = ""
    @Published var phoneNum: String = ""
    @Published var countryCode = ""
    @Published var phone = ""
    
    @Published var password: String = ""
    @Published var isSecured = true
    @Published var userTypeIndex: Int = 0
    
    @Published var isConfirmationPresented = false
    @Published var isPresentedCamera = false
    @Published var isPresentedImagePicker = false
    @Published var inputUIImage: UIImage?
    @Published var profileImage: Image?
    
    @Published var isLoading = false
    @Published var isImageUploading = false
    @Published var errorAlert: AlertItem?
    @Published var isSucceeded = false
    
    func loadImage() {
        guard let inputUIImage = inputUIImage else { return }
        profileImage = Image(uiImage: inputUIImage)
    }
    
    func checkValid() {
        
        phoneNumberField?.getNumber()
        
        if fullName.trim().isEmpty {
            errorAlert = AlertItem(message: "Enter your full name.")
            return
        }
        if email.trim().isEmpty {
            errorAlert = AlertItem(message: "Enter your email address.")
            return
        }
        
        if !Utils.shared.isValidEmail(email.trim()) {
            errorAlert = AlertItem(message: "Email format is invalid.")
            return
        }
        
        if countryCode.isEmpty || phone.isEmpty {
            errorAlert = AlertItem(message: "Enter your phone number.")
            return
        }
        if password.trim().isEmpty {
            errorAlert = AlertItem(message: "Enter your password.")
            return
        }
        
        if profileImage == nil { // no upload profile image
            errorAlert = AlertItem(message: "Add your profile image.")
            return
        }
        
        runSignup()
    }
    
    private func runSignup() {

        isLoading = true
        
        NetworkManager.shared.signup(name: fullName, email: email, password: password, country: countryCode, phone: phone, category: "\(userTypeIndex)") { success, user in
            DispatchQueue.main.async { [self] in
                isLoading = false
                if success {
                    uploadAvatar()
                    AppData.shared.setRegister(true)
                    UserData.shared.setPassword(password)
                } else {
                    isSucceeded = false
                    errorAlert = AlertItem(message: "Server error. Try later")
                }
            }
        }
    }
    
    private func uploadAvatar() {
        isLoading = true
        guard let image = inputUIImage else { return }
        NetworkManager.shared.uploadAvatar(image.jpegData(compressionQuality: 0.2)!) { success, user in
            DispatchQueue.main.async { [self] in
                isLoading = false
                if success {
                    isSucceeded = true
                } else {
                    isSucceeded = false
                    errorAlert = AlertItem(message: "Server error. Try later")
                }
            }
        }
    }
}
