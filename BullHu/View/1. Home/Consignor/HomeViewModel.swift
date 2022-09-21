//
//  HomeViewModel.swift
//  BullHu
//
//  Created by Good Developer on 2022/6/7.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    @Published var productType = ""
    @Published var dropoffLocation = ""
    @Published var returnLocation = ""
    @Published var containerSize = "" // 00.00 feet
    @Published var containerWeight = ""
    @Published var tdoReady = 0
    @Published var pickupTime = Date()
    
    @Published var pickupPlace: Place?
    @Published var dropoffPlace: Place?
    @Published var returnPlace: Place?
    @Published var homePlaces = [Place]()
    
    @Published var isLoading = false
    @Published var errorAlert: AlertItem?
    @Published var isSucceeded = false
    
    func checkValid() {
        
        if productType.isEmpty {
            errorAlert = AlertItem(message: "Please select pickup location")
            return
        }
        if dropoffLocation.isEmpty {
            errorAlert = AlertItem(message: "Please select drop off location")
            return
        }
        if returnLocation.isEmpty {
            errorAlert = AlertItem(message: "Please select empty (container) return location")
            return
        }
        if containerSize.isEmpty {
            errorAlert = AlertItem(message: "Please enter container/freight size")
            return
        }
        if containerWeight.isEmpty {
            errorAlert = AlertItem(message: "Please enter container/freight weight")
            return
        }
        
        runRequestDelivery()
    }
    
    func runRequestDelivery() {
        let pickupDetail = pickupPlace?.detail()
        let dropOffDetail = dropoffPlace?.detail()
        let returnDetail = returnPlace?.detail()
        
        print(Utils.shared.timestampFrom(date: pickupTime))
        
        isLoading = true
        
        NetworkManager.shared.requestDelivery(pickup: pickupDetail ?? productType, dropOff: dropOffDetail ?? dropoffLocation, emptyReturn: returnDetail ?? returnLocation, size: containerSize+"feet", weight: containerWeight+"Kg", pickupTime: "\(Utils.shared.timestampFrom(date: pickupTime))", tdoReady: tdoReady == 0 ? true : false) { success, message in
            DispatchQueue.main.async { [self] in
                isLoading = false
                if success {
                    isSucceeded = true
                    errorAlert = AlertItem(message: "You created a new delivery successfully.")
                    productType = ""
                    pickupPlace = nil
                    dropoffLocation = ""
                    dropoffPlace = nil
                    returnLocation = ""
                    returnPlace = nil
                    containerSize = ""
                    containerWeight = ""
                } else {
                    isSucceeded = false
                    errorAlert = AlertItem(message: message)
                }
            }
        }
    }
    
}
