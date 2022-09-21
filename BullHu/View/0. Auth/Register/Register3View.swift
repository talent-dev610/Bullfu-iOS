//
//  Register3View.swift
//  BullHu
//
//  Created by Good Developer on 2022/6/5.
//

import SwiftUI

struct Register3View: View {
    
    @State private var fullName: String = ""
    @State private var userTypeIndex: Int = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            HStack {
                Spacer()
                ZStack(alignment: .bottomTrailing) {
                    CircleImage(image: Image(systemName: "person.crop.circle.fill"))
                        .frame(width: 120, height: 120)
                        .foregroundColor(.appGray)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.appPrimaryDark)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 4))
                    }
                }
                Spacer()
            }
            .padding(.vertical, 30)
                
            Text("Full Name")
                .font(.system(size: 15))
                .foregroundColor(.appPrimary)
            
            AppTextField(text: $fullName, placeholder: "Full Name", keyboardType: .default, imageName: "logo")
            
            AppSegmentedControl(preselectedIndex: $userTypeIndex, options: ["Consignor", "Driver"])
                .padding(.top, 20)
            
            HStack {
                Spacer()
                VStack(spacing: 2) {
                    Text("By signing up, you agree to our ")
                    NavigationLink {
                        AppWebView(url: URL(string: "https://apple.com/")!)
                    } label: {
                        Text("Terms and Conditions")
                            .foregroundColor(.blue)
                            .underline()
                    }
                }
                Spacer()
            }
            
            
            Button {
                
            } label: {
                Text("Get Started")
            }
            .buttonStyle(AppButtonStyle())
            .padding(.top)
            
            
            

            
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct Register3View_Previews: PreviewProvider {
    static var previews: some View {
        Register3View()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
            .previewDisplayName("iPhone 12")
        
        Register3View()
            .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
            .previewDisplayName("iPhone 13 Pro Max")
    }
}
