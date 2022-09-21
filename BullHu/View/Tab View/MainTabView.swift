//
//  MainTabView.swift
//  BullHu
//
//  Created by Good Developer on 2022/6/7.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var selectedIndex = 0
    
    var tabHandler: Binding<Int> { Binding (
        get: { selectedIndex },
        set: {
            if $0 == selectedIndex {
                print("Reset a view here!!")
            }
            selectedIndex = $0
        }
    )}
    
    var body: some View {
        
        TabView(selection: tabHandler) {
            if UserData.shared.getUser().type == "0" { // consignor
                HomeView()
                    .tabItem {
                        Label("Home", image: "ic_home")
                    }
                    .tag(0)
            } else {
                DrHomeView()
                    .tabItem {
                        Label("Home", image: "ic_home")
                    }
                    .tag(0)
            }
            

            HistoryView()
                .tabItem {
                    Label("History", image: "ic_history")
                }
                .tag(1)
            
            NotiListView()
                .tabItem {
                    Label("Notification", image: "ic_notification")
                }
                .tag(2)
            
            SettingsView()
                .tabItem {
                    Label("Settings", image: "ic_settings")
                }
                .tag(3)
        }
        .onAppear {
//            AppData.shared.setRegister(true)
        }
        .accentColor(.appPrimary)
        
//        VStack {
//            ZStack {
//                switch selectedIndex {
//                case 0:
//                    HomeView()
//                case 1:
//                    HistoryView()
//                case 2:
//                    NotiListView()
//                case 3:
//                    SettingsView()
//                default:
//                    SettingsView()
//                }
//            }
//            Spacer()
//            TabBar()
//        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
