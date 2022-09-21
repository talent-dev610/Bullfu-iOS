//
//  NotiListView.swift
//  BullHu
//
//  Created by Good Developer on 2022/6/7.
//

import SwiftUI

struct NotiListView: View {
    
    @State private var deliveries = [Delivery]()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.label]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.label]
    }
    
    var body: some View {
        NavigationView {
            
            List(deliveries) { delivery in
                NotiItem(delivery: delivery)
            }
            .listStyle(.plain)
            .navigationTitle(Text("Notifications"))
//            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
        .navigationBarBackButtonHidden(true)
        .onAppear(perform: fetchData)
    }
    
    func fetchData() {
        let host = UserData.shared.getUser()
        if host.type == "0" { // consignor
            NetworkManager.shared.allDeliveryForConsignor { success, data in
                if success {
                    self.deliveries = data
                }
            }
        }
    }
}

struct NotiListView_Previews: PreviewProvider {
    static var previews: some View {
        NotiListView()
    }
}
