//
//  NotiItem.swift
//  BullHu
//
//  Created by Good Developer on 2022/6/8.
//

import SwiftUI

struct NotiItem: View {
    
    var delivery: Delivery
    
    @State private var isPresentedCardView = false
    @State private var isPresented = false
    
    @State private var isLoading = false
    @State private var errorAlert: AlertItem?
    
    @State private var isPresentWebView = false
    @State private var authUrl = ""
    @State private var reference = ""
    
    var body: some View {
        HStack(alignment: .top) {
            
            AsyncImage(url: URL(string: delivery.driver.photo)!, scale: 1.0) { image in
                image.resizable().scaledToFill()
            } placeholder: {
                ProgressView()
                    .progressViewStyle(.circular)
            }
            .frame(width: 40, height: 40)
            .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(delivery.driver.name)
                    .font(.appFont(.extraBold, size: 18))
                
                Text("Will be available to deliver your container/freight for the price of ₦\(delivery.deliveryPrice), you will be contacted with a pick up time.")
                    .font(.appFont(.regular, size: 15))
            }
            
            VStack(alignment: .trailing) {
                Button {
                    print("Accept clicked")
                    runInitializePay()
                } label: {
                    if isLoading {
                        LoadingView()
                    } else {
                        Text("ACCEPT/PAY")
                            .font(.appFont(.bold, size: 12))
                            .foregroundColor(.white)
                    }
                        
                }
                .frame(width: 105, height: 34)
                .background(Color.appGreen)
                .cornerRadius(20)
                .alert(item: $errorAlert) { item in
                    Alert(title: Text("Sorry!"), message: Text(item.message), dismissButton: .default(Text("OK")))
                }
                .sheet(isPresented: $isPresentWebView) {
                    WebView(url: URL(string: authUrl)!)
                }

                Button {
                    print("Declined")
                    isPresented = true
                } label: {
                    Text("DECLINE")
                        .font(.appFont(.bold, size: 12))
                        .foregroundColor(.white)
                        
                }
                .frame(width: 105, height: 34)
                .background(Color.appPrimaryDark)
                .cornerRadius(20)
                
                
                NavigationLink(destination: CardInputView(delivery: delivery), isActive: $isPresentedCardView) {}
                    .hidden() // to remove right arrow accessory view
                NavigationLink(destination: PayView(), isActive: $isPresented) {}
                    .hidden()
            }
        }
        .padding()
        .background(Color.appGrayLight)
        .cornerRadius(16)
        .buttonStyle(PlainButtonStyle())
    }
    
    func runInitializePay() {
        let email = UserData.shared.getUser().email
        let amount = delivery.deliveryPrice
        
        print(email, amount)
        isLoading = true
        NetworkManager.shared.initializePay(email: email, amount: Int(amount)!) { success, authUrl, reference in
            DispatchQueue.main.async { [self] in
                isLoading = false
                if success {
                    isPresentWebView = true
                    self.authUrl = authUrl
                    self.reference = reference
                    print("Auth URL: ", self.authUrl)
                    print("Reference: ", self.reference)
                    
                } else {
                    errorAlert = AlertItem(message: authUrl)
                }
            }
        }
    }
    
}

struct NotiItem_Previews: PreviewProvider {
    static var previews: some View {
        NotiItem(delivery: Delivery.default)
    }
}
