//
//  DrHomeItem.swift
//  BullHu
//
//  Created by Good Developer on 2022/6/8.
//

import SwiftUI
import CoreLocation

struct DrHomeItem: View {
    
    var delivery: Delivery
    @State private var pickupLocation = ""
    @State private var dropOffLocation = ""
    @State private var returnLocation = ""
    
    @State private var isPresented = false
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Text(delivery.consignor.name)
                    .font(.appFont(.extraBold, size: 22))
                
                Spacer()
                
                Button {
                    isPresented = true
                } label: {
                    Text("ACCEPT")
                        .font(.appFont(.bold, size: 15))
                        .foregroundColor(Color(uiColor: .label))
                        .padding()
                }
                .frame(height: 34)
                .background(Color(uiColor: .systemGray3))
                .cornerRadius(20)
            }
            
            HStack {
                Text("Container/Freight size: ")
                    .font(.appFont(.regular, size: 12))
                Text(delivery.containerSize)
                    .font(.appFont(.semiBold, size: 13))
            }
            HStack {
                Text("Container/Freight weight: ")
                    .font(.appFont(.regular, size: 12))
                Text(delivery.containerWeight)
                    .font(.appFont(.semiBold, size: 12))
            }
            HStack {
                Text("Preferred Pick up time: ")
                    .font(.appFont(.regular, size: 12))
                Text(Utils.shared.getDateFrom(timestamp: Int64(delivery.pickupTime)!))
                    .font(.appFont(.semiBold, size: 12))
            }
            HStack {
                Text("Pick up at: ")
                    .font(.appFont(.regular, size: 12))
                Text(pickupLocation)
                    .font(.appFont(.semiBold, size: 12))
            }
            .onAppear {
                let co = delivery.pickupLocationName.split(separator: ",")
                if co.count == 2 {
                    let coordinate = CLLocationCoordinate2D(latitude: Double(co.first!)!, longitude: Double(co.last!)!)
                    Utils.shared.getAddressFrom(coordinate: coordinate) { address in
                        self.pickupLocation = address
                    }
                }
            }
            HStack {
                Text("Drop off at: ")
                    .font(.appFont(.regular, size: 12))
                Text(dropOffLocation)
                    .font(.appFont(.semiBold, size: 12))
            }
            .onAppear {
                let co = delivery.dropOffLocationName.split(separator: ",")
                if co.count == 2 {
                    let coordinate = CLLocationCoordinate2D(latitude: Double(co.first!)!, longitude: Double(co.last!)!)
                    Utils.shared.getAddressFrom(coordinate: coordinate) { address in
                        self.dropOffLocation = address
                    }
                }
            }
            
            HStack {
                Text("Empty(container) return location: ")
                    .font(.appFont(.regular, size: 12))
                Text(returnLocation)
                    .font(.appFont(.semiBold, size: 12))
            }
            .onAppear {
                let co = delivery.emptyReturnLocationName.split(separator: ",")
                if co.count == 2 {
                    let coordinate = CLLocationCoordinate2D(latitude: Double(co.first!)!, longitude: Double(co.last!)!)
                    Utils.shared.getAddressFrom(coordinate: coordinate) { address in
                        self.returnLocation = address
                    }
                }
            }
            
            HStack {
                Text("Terminal Delivery Order(TDO) is ready?: ")
                    .font(.appFont(.regular, size: 12))
                Text(delivery.tdoReady ? "Yes" : "No")
                    .font(.appFont(.semiBold, size: 12))
            }
            
            NavigationLink(destination: AcceptDeliveryView(delivery: delivery), isActive: $isPresented) {}
                .frame(height: 1)
                .hidden()
        }
        .padding()
        .background(Color.appGrayLight)
        .cornerRadius(16)
        .buttonStyle(PlainButtonStyle()) // to remove the list row animation
    }
}

struct DrHomeItem_Previews: PreviewProvider {
    static var previews: some View {
        DrHomeItem(delivery: Delivery.default)
    }
}
