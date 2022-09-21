//
//  AppTextField.swift
//  BullHu
//
//  Created by Good Developer on 2022/6/4.
//

import SwiftUI

struct AppTextField: View {
    
    @Binding var text: String
    var placeholder: String
    var keyboardType: UIKeyboardType
    var imageName: String
    
    var body: some View {
        HStack {
            TextField(placeholder, text: $text)
                .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                .font(.system(size: 17))
//                .foregroundColor(.appPrimary)
                .tint(.appPrimary)
                .accentColor(.appPrimary)
                .frame(height: 46)
                .keyboardType(keyboardType)
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .symbolRenderingMode(.none)
                .padding(.horizontal, 10)
        }
        .background(
            RoundedRectangle(cornerRadius: 4, style: .continuous)
                .stroke(Color.appGrayDark, lineWidth: 1)
                .background(Color.appGrayLight))
        .padding(.all, 2)
        
    }
}

struct AppTextField_Previews: PreviewProvider {
    static var previews: some View {
        AppTextField(text: .constant("Text"), placeholder: "Email", keyboardType: .emailAddress, imageName: "logo")
    }
}
