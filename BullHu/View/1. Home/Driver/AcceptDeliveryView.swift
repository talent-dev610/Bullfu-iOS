//
//  AcceptDeliveryView.swift
//  BullHu
//
//  Created by Good Developer on 2022/7/22.
//

import SwiftUI

struct AcceptDeliveryView: View {
    
    var delivery: Delivery
    @StateObject private var model = AcceptDeliveryViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
           
            Text(delivery.consignor.name)
                .font(.appFont(.bold, size: 25))
                .padding(.bottom)
            
            Text("Please input a price (₦)")
            
            AppTextField(text: $model.price, placeholder: "1234", keyboardType: .numberPad, imageName: "ic_dollar")
            
            Button {
                model.runAccept(deliverId: delivery.id)
            } label: {
                if model.isLoading {
                    HStack {
                        LoadingView()
                        Text("Sending")
                            .padding(.leading)
                    }
                } else {
                    Text("SEND")
                }
            }
            .buttonStyle(AppButtonStyle())
            .padding(.top, 20)
            .disabled(model.price.isEmpty)
            .alert(item: $model.errorAlert) { item in
                Alert(title: Text("Sorry!"), message: Text(item.message), dismissButton: .default(Text("OK")))
            }
            .alert("Accepted delivery successfully. Wait until the service is paid", isPresented: $model.isSucceeded) {
                Button("Ok") {
                    dismiss()
                }
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Accept Delivery")
    }
}

struct AcceptDeliveryView_Previews: PreviewProvider {
    static var previews: some View {
        AcceptDeliveryView(delivery: Delivery.default)
    }
}
