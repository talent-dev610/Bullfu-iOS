//
//  SettingsView.swift
//  BullHu
//
//  Created by Good Developer on 2022/6/7.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var isSignout = false
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.label]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.label]
    }
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink {
                        MyProfileView()
                    } label: {
                        HStack {
                            Image("ic_profile")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            Text("My Profile")
                            Spacer()
                        }
                    }

                    
                    NavigationLink {
                        ChangePwdView()
                    } label: {
                        HStack {
                            Image("ic_password")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            Text("Change Password")
                            Spacer()
                        }
                    }
                }
                
                Section {
                    Button {
                        
                    } label: {
                        HStack {
                            Image("ic_about")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            Text("About Us")
                                .font(.primaryRegular)
                                .foregroundColor(.black)
                            Spacer()
                        }
                    }
                    
                    Button {
                        
                    } label: {
                        HStack {
                            Image("ic_policy")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            Text("Privacy Policy")
                                .font(.primaryRegular)
                                .foregroundColor(.black)
                            Spacer()
                        }
                    }
                    
                    Button {
                        
                    } label: {
                        HStack {
                            Image("ic_contact")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            Text("Contact Us")
                                .font(.primaryRegular)
                                .foregroundColor(.black)
                            Spacer()
                        }
                    }
                }
                
                Section {
                    Button {
                        isSignout = true
                        UserData.shared.setPassword("")
                        UserData.shared.setUser(User.default)
                    } label: {
                        HStack {
                            Image("ic_logout")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            Text("Logout")
                                .font(.primaryRegular)
                                .foregroundColor(.black)
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle(Text("Settings"))
//            .navigationBarTitleDisplayMode(.inline)
            .fullScreenCover(isPresented: $isSignout) {
                LoginView()
            }
        }
        .accentColor(.white)
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
