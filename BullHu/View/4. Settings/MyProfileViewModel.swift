//
//  MyProfileViewModel.swift
//  BullHu
//
//  Created by Good Developer on 2022/6/8.
//

import SwiftUI

final class MyProfileViewModel: ObservableObject {
    
    @Published var user: User
    
    @Published var phoneNumberField: PhoneNumberView?
    
    @Published var name = ""
    @Published var countryCode = ""
    @Published var phone = ""
    
    @Published var isConfirmationPresented = false
    @Published var isPresentedCamera = false
    @Published var isPresentedImagePicker = false
    @Published var inputUIImage: UIImage?
    @Published var profileImage: Image?
    
    @Published var isLoading = false
    @Published var isImageUploading = false
    @Published var errorAlert: AlertItem?
    @Published var isSucceeded = false
    
    init() {
        user = UserData.shared.getUser()
    }
    
    func loadImage() {
        guard let inputUIImage = inputUIImage else { return }
        profileImage = Image(uiImage: inputUIImage)
        
        uploadAvatar()
    }
    
    private func uploadAvatar() {
        isImageUploading = true
        guard let image = inputUIImage else { return }
        NetworkManager.shared.uploadAvatar(image.jpegData(compressionQuality: 0.2)!) { success, uu in
            DispatchQueue.main.async { [self] in
                isImageUploading = false
                if success {
                    isSucceeded = true
                    user = uu!
                } else {
                    isSucceeded = false
                    errorAlert = AlertItem(message: "Server error. Try later")
                }
            }
        }
    }
    
    func checkValid() {
        phoneNumberField?.getNumber()
        
        if name.isEmpty {
            errorAlert = AlertItem(message: "Please enter your full name.")
            return
        }
        
        if countryCode.isEmpty || phone.isEmpty {
            errorAlert = AlertItem(message: "Please enter phone number")
            return 
        }
        
        runUpdate()
    }
    
    func runUpdate() {
        isLoading = true
        NetworkManager.shared.updateProfile(name: name, country: countryCode, phone: phone) { success, user in
            DispatchQueue.main.async { [self] in
                isLoading = false
                if success {
                    isSucceeded = true
                    errorAlert = AlertItem(message: "User data's changed successfully.")
                } else {
                    isSucceeded = false
                    errorAlert = AlertItem(message: "Server error. Try later")
                }
            }
        }
    }
    
}
