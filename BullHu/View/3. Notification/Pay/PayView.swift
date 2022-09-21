//
//  PayView.swift
//  BullHu
//
//  Created by Good Developer on 2022/6/8.
//

import SwiftUI

struct PayView: View {
    var body: some View {
        NavigationView {
            VStack {
                
                Image("logo_bar")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .background(Color.white)
                    .padding(.vertical, 30)
                
                Text("₦500.00")
                    .font(.appFont(.extraBold, size: 40))
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 20, leading: 30, bottom: 20, trailing: 30))
                    .background(Color.appPrimary)
                    .cornerRadius(16)
                    .padding(.top, 40)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Paystack")
                            .font(.appFont(.extraBold, size: 20))

                        
                        Text("Hello, World! Hello, World! Hello, World!")
                            .font(.appFont(.regular, size: 16))
                            .foregroundColor(.appGrayDark)
                    }
                    Spacer()
                    
                    Image("ic_check")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
                .padding()
                .background(Color.appGrayLight)
                .cornerRadius(16)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Pay Now")
                }
                .buttonStyle(AppButtonStyle())
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
            }
            .padding()
//            .toolbar {
//                ToolbarItem {
//                    Image("logo_bar")
//                        .resizable()
//                        .scaledToFit()
//                }
//            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct PayView_Previews: PreviewProvider {
    static var previews: some View {
        PayView()
    }
}
