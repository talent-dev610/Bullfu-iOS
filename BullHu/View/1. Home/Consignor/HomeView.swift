//
//  HomeView.swift
//  BullHu
//
//  Created by Good Developer on 2022/6/7.
//

import SwiftUI
import MapKit

struct HomeView: View {
    
    @StateObject private var model = HomeViewModel()
    @StateObject private var locationManager = LocationManager()
    @StateObject private var searchModel = HomeSearchViewModel()
    @State private var isSearching = false
    @FocusState private var isLoadingLocationFocused: Bool
    @FocusState private var isUnloadingLocationFocused: Bool
    
    @State private var isProductTypesPresented = false
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.label]
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Group {
                        VStack(alignment: .leading) {
                            Text("Type of product needed")
                                .font(.system(size: 15))
                                .foregroundColor(.appPrimary)
                                .padding(.top, 8)
                            
                            HStack {
                                TextField("", text: $model.productType)
                                    .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                                    .font(.system(size: 17))
                                    .tint(.appPrimary)
                                    .accentColor(.appPrimary)
                                    .frame(height: 46)
                                    .disabled(true)
                                
                                Button {
                                    isProductTypesPresented.toggle()
                                } label: {
                                    Image("ic_down_arrow")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20, height: 20)
                                        .symbolRenderingMode(.none)
                                        .padding(.horizontal, 10)
                                }
                                .confirmationDialog("Type of product needed", isPresented: $isProductTypesPresented, titleVisibility: .visible) {
                                    Button("Premium Motor Spirit (PMS)") {
                                        model.productType = "Premium Motor Spirit (PMS)"
                                    }
                                    
                                    Button("Automotive Gas Oil (AGO)") {
                                        model.productType = "Automotive Gas Oil (AGO)"
                                    }
                                    
                                    Button("Dual Purpose Kerosene (DPK)") {
                                        model.productType = "Dual Purpose Kerosene (DPK)"
                                    }
                                }
                                
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 4, style: .continuous)
                                    .stroke(Color.appGrayDark, lineWidth: 1)
                                    .background(Color.appGrayLight))
                            .padding(.all, 2)
                            
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Name & location of loading depot/tank farm/import jetty")
                                .font(.system(size: 15))
                                .foregroundColor(.appPrimary)
                                .padding(.top, 8)
                            HStack {
                                TextField("Enter Address", text: $model.dropoffLocation)
                                    .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                                    .font(.system(size: 17))
//                                    .foregroundColor(.appPrimary)
                                    .tint(.appPrimary)
                                    .accentColor(.appPrimary)
                                    .frame(height: 46)
                                    .keyboardType(.default)
                                    .focused($isLoadingLocationFocused)
                                
                                Image("ic_pin")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .symbolRenderingMode(.none)
                                    .padding(.horizontal, 10)
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 4, style: .continuous)
                                    .stroke(Color.appGrayDark, lineWidth: 1)
                                    .background(Color.appGrayLight))
                            .onChange(of: model.dropoffLocation) { searchText in
                                if searchText.isEmpty {
                                    searchModel.places.removeAll()
                                } else {
                                    searchModel.search(text: searchText, region: locationManager.region)
                                }
                            }
                        }
                        
                        if isLoadingLocationFocused {
                            List(searchModel.places) { place in
                                Button {
                                    model.dropoffPlace = place
                                    
                                    model.homePlaces.removeAll()
                                    if let pickupPlace = model.pickupPlace {
                                        model.homePlaces.append(pickupPlace)
                                    }
                                    if let dropoffPlace = model.dropoffPlace {
                                        model.homePlaces.append(dropoffPlace)
                                    }
                                    if let returnPlace = model.returnPlace {
                                        model.homePlaces.append(returnPlace)
                                    }
                                    
                                    isLoadingLocationFocused = false
                                } label: {
                                    Text(place.name)
                                }

                            }
                            .listStyle(.plain)
                            .frame(height: 120)
                            .onChange(of: model.dropoffPlace) { newValue in
                                model.dropoffLocation = newValue?.name ?? "Unknown location"
                            }
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Name & location of unloading depot/filling station")
                                .font(.system(size: 15))
                                .foregroundColor(.appPrimary)
                                .padding(.top, 8)
                            HStack {
                                TextField("Enter Address", text: $model.returnLocation)
                                    .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                                    .font(.system(size: 17))
//                                    .foregroundColor(.appGrayDark)
                                    .tint(.appPrimary)
                                    .accentColor(.appPrimary)
                                    .frame(height: 46)
                                    .keyboardType(.default)
                                    .focused($isUnloadingLocationFocused)
                                
                                Image("ic_pin")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .symbolRenderingMode(.none)
                                    .padding(.horizontal, 10)
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 4, style: .continuous)
                                    .stroke(Color.appGrayDark, lineWidth: 1)
                                    .background(Color.appGrayLight))
                            .onChange(of: model.returnLocation) { searchText in
                                if searchText.isEmpty {
                                    searchModel.places.removeAll()
                                } else {
                                    searchModel.search(text: searchText, region: locationManager.region)
                                }
                            }
                        }
                        
                        if isUnloadingLocationFocused {
                            List(searchModel.places) { place in
                                Button {
                                    model.returnPlace = place
                                    
                                    model.homePlaces.removeAll()
                                    if let pickupPlace = model.pickupPlace {
                                        model.homePlaces.append(pickupPlace)
                                    }
                                    if let dropoffPlace = model.dropoffPlace {
                                        model.homePlaces.append(dropoffPlace)
                                    }
                                    if let returnPlace = model.returnPlace {
                                        model.homePlaces.append(returnPlace)
                                    }
                                    
                                    isUnloadingLocationFocused = false
                                } label: {
                                    Text(place.name)
                                }

                            }
                            .listStyle(.plain)
                            .frame(height: 120)
                            .onChange(of: model.returnPlace) { newValue in
                                model.returnLocation = newValue?.name ?? "Unknown location"
                            }
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Terminal Delivery Order (TDO) is ready?")
                            .font(.system(size: 15))
                            .foregroundColor(.appPrimary)
                            .padding(.top, 8)
                        AppSegmentedControl(preselectedIndex: $model.tdoReady, options: ["Yes", "No"])
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Product pick up date & time")
                            .font(.system(size: 15))
                            .foregroundColor(.appPrimary)
                            .padding(.top, 8)
                        DatePicker("", selection: $model.pickupTime, displayedComponents: [.date, .hourAndMinute])
                            .environment(\.locale, Locale.init(identifier: "en-US"))
                    }
                    
                    MapView(coordinate: CLLocationCoordinate2D(latitude: model.pickupPlace?.latitude ?? 34.05346, longitude: model.pickupPlace?.longitude ?? -118.23934))
                        .frame(height: 200)
                        .cornerRadius(5)
                        .padding(.top, 8)
                    
                    Button {
                        model.checkValid()
                    } label: {
                        if model.isLoading {
                            LoadingView()
                        } else {
                            Text("REQUEST PRODUCT DELIVERY")
                        }
                    }
                    .buttonStyle(AppButtonStyle())
                    .padding(.vertical)
                    .alert(item: $model.errorAlert) { item in
                        Alert(title: Text("Notice!"), message: Text(item.message), dismissButton: .default(Text("OK")))
                    }
                }
                .toolbar {
                    ToolbarItem {
                        Image("logo_bar")
                            .resizable()
                            .scaledToFit()
                    }
                }
                .padding(.horizontal)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        .accentColor(.appPrimary)
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewLayout(.fixed(width: 375, height: 1000))
    }
}


