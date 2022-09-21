//
//  Register1View.swift
//  BullHu
//
//  Created by Good Developer on 2022/6/5.
//

import SwiftUI

struct Register1View: View {
    
    @State private var countryCode: String = ""
    @State private var phoneNumber: String = ""
    @State private var isSucceeded: Bool = false
    
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
                
            Text("Phone Number")
                .font(.system(size: 15))
                .foregroundColor(.appPrimary)
            
            PhoneNumberView(countryCode: $countryCode, nationalNum: $phoneNumber)
                .frame(height: 46)
                .padding(.horizontal, 16)
                .background(
                    RoundedRectangle(cornerRadius: 4, style: .continuous)
                        .stroke(Color.appPrimary, lineWidth: 1)
                        .background(Color.appGrayLight))
            
            Button {
                isSucceeded = true
            } label: {
                Text("Continue")
            }
            .buttonStyle(AppButtonStyle())
            .padding(.top)
            
            Spacer()
            
            NavigationLink(destination: Register2View(), isActive: $isSucceeded) {}
        }
        .padding(.horizontal)
    }
}

struct Register1view_Previews: PreviewProvider {
    static var previews: some View {
        Register1View()
    }
}
