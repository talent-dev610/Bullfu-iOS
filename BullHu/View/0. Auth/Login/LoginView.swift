//
//  LoginView.swift
//  BullHu
//
//  Created by Good Developer on 2022/6/5.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var model = LoginViewModel()
    @State private var isRegisterPresented = false
    @State private var isForgotPwdPresented = false
    
    var body: some View {
        NavigationView {
            
            ZStack {

                VStack {
                    Color.appPrimaryDark.edgesIgnoringSafeArea(.all)
                }

                VStack(spacing: 0) {
                    HStack {
                        Text("Login To\nEnter App")
                            .font(.appFont(.extraBold, size: 35))
                            .foregroundColor(.white)

                        Spacer()
                    }
                    .padding(EdgeInsets(top: 20, leading: 30, bottom: 20, trailing: 30))
                    .background(Color.appPrimaryDark)

                    ZStack {
                        Text("")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(RoundedCorners(color: .white, tl: 35, tr: 35, bl: 0, br: 0))

                        ScrollView {

                            AppTextField(text: $model.email, placeholder: "Email", keyboardType: .emailAddress, imageName: "ic_email")

                            HStack {
                                if model.isSecured {
                                    SecureField("Password", text: $model.password)
                                        .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                                        .font(.system(size: 17))
                                        .foregroundColor(.appPrimary)
                                        .tint(.appPrimary)
                                        .accentColor(.appPrimary)
                                        .frame(height: 46)
                                } else {
                                    TextField("Password", text: $model.password)
                                        .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                                        .font(.system(size: 17))
                                        .foregroundColor(.appPrimary)
                                        .tint(.appPrimary)
                                        .accentColor(.appPrimary)
                                        .frame(height: 46)
                                }

                                Button {
                                    model.isSecured.toggle()
                                } label: {
                                    if !model.password.isEmpty {
                                        if model.isSecured {
                                            Image(systemName: "eye.slash")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: 16)
                                                .foregroundColor(.appPrimary)
                                        } else {
                                            Image(systemName: "eye")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: 16)
                                                .foregroundColor(.appPrimary)
                                        }
                                    }
                                }

                                Image("ic_password")
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
                            .padding(.top)
                            .padding(.horizontal, 2)

                            HStack {
                                Spacer()

                                Button {
                                    isForgotPwdPresented = true
                                } label: {
                                    Text("Forgot Password?")
                                        .font(.appFont(.regular, size: 16))
                                        .foregroundColor(.appBlue)
                                }
                            }
                            .padding(.top)

                            Button {
                                model.checkValid()
                            } label: {
                                if model.isLoading {
                                    HStack {
                                        LoadingView()
                                        Text("LOGIN")
                                            .padding(.leading)
                                    }
                                } else {
                                    Text("LOGIN")
                                }
                            }
                            .buttonStyle(AppButtonStyle())
                            .padding(.top, 20)
                            .fullScreenCover(isPresented: $model.isPresented, onDismiss: nil) {
                                MainTabView()
                            }
                            .disabled(model.isLoading)
                            .alert(item: $model.errorAlert) { item in
                                Alert(title: Text("Sorry!"), message: Text(item.message), dismissButton: .default(Text("OK")))
                            }

                            Text("OR")

                            Button {
                                isRegisterPresented = true
                            } label: {
                                Text("REGISTER")
                            }
                            .buttonStyle(AppButtonStyle())
                            
                            NavigationLink(destination: RegisterView(), isActive: $isRegisterPresented) {}
                            
                            NavigationLink(destination: ForgotPwdView(), isActive: $isForgotPwdPresented) {}
                        }
                        .padding(EdgeInsets(top: 40, leading: 30, bottom: 0, trailing: 30))
                    }
                }
                .edgesIgnoringSafeArea(.bottom)
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        .accentColor(.white)
        .navigationViewStyle(.stack)
        .onAppear {
            if AppData.shared.isRegistered() {
                model.email = UserData.shared.getUser().email
                model.password = UserData.shared.getPassword()
                model.checkValid()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
