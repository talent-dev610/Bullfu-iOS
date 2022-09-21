//
//  DrHomeView.swift
//  BullHu
//
//  Created by Good Developer on 2022/6/8.
//

import SwiftUI

struct DrHomeView: View {
    
    @State private var deliveries = [Delivery]()
    
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.appPrimaryDark]
    }
    
    var body: some View {
        NavigationView {
            
            List(deliveries) { delivery in
                DrHomeItem(delivery: delivery)
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 4))
            }
            .listStyle(.plain)
            .navigationTitle("Available Freight for Delivery")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: fetchData)
        }
        .navigationViewStyle(.stack)
        .navigationBarBackButtonHidden()
    }
    
    func fetchData() {
        NetworkManager.shared.allDeliveryForDriver { success, data in
            if success {
                self.deliveries = data
            }
        }
    }
}

struct DrHomeView_Previews: PreviewProvider {
    static var previews: some View {
        DrHomeView()
    }
}
