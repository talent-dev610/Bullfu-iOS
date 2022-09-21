//
//  Register2View.swift
//  BullHu
//
//  Created by Good Developer on 2022/6/5.
//

import SwiftUI

struct Register2View: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isSecured = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            HStack {
                Spacer()
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 160)
                Spacer()
            }
                
            Text("Email")
                .font(.system(size: 15))
                .foregroundColor(.appPrimary)
            
            AppTextField(text: $email, placeholder: "Email", keyboardType: .default, imageName: "logo")
            
            Text("Password")
                .font(.system(size: 15))
                .foregroundColor(.appPrimary)
                .padding(.top)
            
            HStack {
                if isSecured {
                    SecureField("Password", text: $password)
                        .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                        .font(.system(size: 17))
                        .foregroundColor(.appPrimary)
                        .tint(.appPrimary)
                        .accentColor(.appPrimary)
                        .frame(height: 46)
                } else {
                    TextField("Password", text: $password)
                        .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                        .font(.system(size: 17))
                        .foregroundColor(.appPrimary)
                        .tint(.appPrimary)
                        .accentColor(.appPrimary)
                        .frame(height: 46)
                }
                
                Button {
                    isSecured.toggle()
                } label: {
                    if !password.isEmpty {
                        if isSecured {
                            Image(systemName: "eye")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 16)
                                .foregroundColor(.appPrimary)
                        } else {
                            Image(systemName: "eye.slash")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 16)
                                .foregroundColor(.appPrimary)
                        }
                    }
                }
                
                Image("logo")
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
            
            
            
            Button {
                
            } label: {
                Text("Continue")
            }
            .buttonStyle(AppButtonStyle())
            .padding(.top)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct Register2View_Previews: PreviewProvider {
    static var previews: some View {
        Register2View()
    }
}
