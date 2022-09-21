//
//  PhoneNumberView.swift
//  Icered
//
//  Created by Good Developer on 2022/3/15.
//

import SwiftUI
import UIKit
import PhoneNumberKit

struct PhoneNumberView: UIViewRepresentable {
    
    typealias Context = UIViewRepresentableContext<Self>
    typealias UIViewType = PhoneNumberTextField
    
    @Binding var countryCode: String
    @Binding var nationalNum: String
    
    private let textField = PhoneNumberTextField()
    
    func makeUIView(context: Context) -> PhoneNumberTextField {
        
        textField.withPrefix = true
        textField.withFlag = true
        textField.withExamplePlaceholder = true
        textField.withDefaultPickerUI = true
//        textField.textColor = .appPrimary
        textField.tintColor = .appPrimary
        textField.font = UIFont(name: AppFontStyle.regular.rawValue, size: 17)
        return textField
    }
    
    func updateUIView(_ uiView: PhoneNumberTextField, context: Context) {
        
    }
    
    func getNumber() {
        if let phoneNum = textField.phoneNumber {
            countryCode = String(phoneNum.countryCode)
            nationalNum = String(phoneNum.nationalNumber)
            print(phoneNum)
        } else {
            print("Error getting phone number")
        }
    }
}

struct PhoneNumberView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumberView(countryCode: .constant("+1"), nationalNum: .constant("(530) 324 2463"))
    }
}
