//
//  CardInputView.swift
//  BullHu
//
//  Created by Good Developer on 2022/7/9.
//

import SwiftUI

struct CardInputView: View {
    
    var delivery: Delivery
    
    @ObservedObject private var model = CardInputViewModel()
    
    var body: some View {
        
        VStack {
            Image("logo_bar")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: 60)
                .padding(.vertical, 30)
            
            VStack(alignment: .leading) {
                
                Text("Card Number")
                    .font(.system(size: 15))
                    .foregroundColor(.appPrimary)
                    .padding(.top, 8)
                
                TextField("1234 5678 1234 5678 000", text: $model.cardNumber)
                    .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                    .font(.system(size: 17))
                    .tint(.appPrimary)
                    .accentColor(.appPrimary)
                    .frame(height: 46)
                    .background(
                        RoundedRectangle(cornerRadius: 4, style: .continuous)
                            .stroke(Color.appGrayDark, lineWidth: 1)
                            .background(Color.appGrayLight))
                    .padding(.all, 2)
                    .keyboardType(.numberPad)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Card Expiry")
                            .font(.system(size: 15))
                            .foregroundColor(.appPrimary)
                            .padding(.top, 8)
                        
                        TextField("MM/YY", text: $model.cardNumber)
                            .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                            .font(.system(size: 17))
                            .tint(.appPrimary)
                            .accentColor(.appPrimary)
                            .frame(height: 46)
                            .background(
                                RoundedRectangle(cornerRadius: 4, style: .continuous)
                                    .stroke(Color.appGrayDark, lineWidth: 1)
                                    .background(Color.appGrayLight))
                            .padding(.all, 2)
                            .keyboardType(.numbersAndPunctuation)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("CVV")
                            .font(.system(size: 15))
                            .foregroundColor(.appPrimary)
                            .padding(.top, 8)
                        
                        TextField("123", text: $model.cardNumber)
                            .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                            .font(.system(size: 17))
                            .tint(.appPrimary)
                            .accentColor(.appPrimary)
                            .frame(height: 46)
                            .background(
                                RoundedRectangle(cornerRadius: 4, style: .continuous)
                                    .stroke(Color.appGrayDark, lineWidth: 1)
                                    .background(Color.appGrayLight))
                            .padding(.all, 2)
                            .keyboardType(.numberPad)
                    }
                }
            }
            
            Button {
                model.checkValid()
            } label: {
                if model.isLoading {
                    LoadingView()
                } else {
                    Text("Pay ₦\(delivery.deliveryPrice)")
                }
            }
            .buttonStyle(AppButtonStyle())
            .padding(.vertical, 20)
            .disabled(model.cardNumber.isEmpty || model.cardExpiary.isEmpty || model.cardCvv.isEmpty)
            .alert(item: $model.errorAlert) { item in
                Alert(title: Text("Sorry!"), message: Text(item.message), dismissButton: .default(Text("OK")))
            }
            
            Spacer()
        }
        .padding(.horizontal, 30)
        .navigationTitle("")
    }
}

struct CardInputView_Previews: PreviewProvider {
    static var previews: some View {
        CardInputView(delivery: Delivery.default)
    }
}
