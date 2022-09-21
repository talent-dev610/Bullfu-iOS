//
//  ChangePwdView.swift
//  BullHu
//
//  Created by Good Developer on 2022/6/16.
//

import SwiftUI

struct ChangePwdView: View {
    
    @StateObject private var model = ChangePwdViewModel()
    
    
    var body: some View {
        ZStack {
            Color.appPrimaryDark
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                Text("")
                    .frame(maxWidth: .infinity, maxHeight: 70)
                    .background(RoundedCorners(color: .white, tl: 35, tr: 35, bl: 0, br: 0))
                    .padding(.top)
                
                Image("logo_bar")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .offset(y: -30)
                    .background(Color.white)
                
                ZStack {
                    Text("")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.white)
                    
                    VStack {
                        HStack {
                            if model.isSecured {
                                SecureField("Current Password", text: $model.password)
                                    .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                                    .font(.system(size: 17))
                                    .foregroundColor(.appPrimary)
                                    .tint(.appPrimary)
                                    .accentColor(.appPrimary)
                                    .frame(height: 46)
                            } else {
                                TextField("Current Password", text: $model.password)
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
                        
                        HStack {
                            if model.isNewSecured {
                                SecureField("New Password", text: $model.newPassword)
                                    .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                                    .font(.system(size: 17))
                                    .foregroundColor(.appPrimary)
                                    .tint(.appPrimary)
                                    .accentColor(.appPrimary)
                                    .frame(height: 46)
                            } else {
                                TextField("New Password", text: $model.newPassword)
                                    .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                                    .font(.system(size: 17))
                                    .foregroundColor(.appPrimary)
                                    .tint(.appPrimary)
                                    .accentColor(.appPrimary)
                                    .frame(height: 46)
                            }

                            Button {
                                model.isNewSecured.toggle()
                            } label: {
                                if !model.newPassword.isEmpty {
                                    if model.isNewSecured {
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
                        
                        HStack {
                            if model.isConfirmSecured {
                                SecureField("Confirm Password", text: $model.confirmPwd)
                                    .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                                    .font(.system(size: 17))
                                    .foregroundColor(.appPrimary)
                                    .tint(.appPrimary)
                                    .accentColor(.appPrimary)
                                    .frame(height: 46)
                            } else {
                                TextField("Confirm Password", text: $model.confirmPwd)
                                    .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                                    .font(.system(size: 17))
                                    .foregroundColor(.appPrimary)
                                    .tint(.appPrimary)
                                    .accentColor(.appPrimary)
                                    .frame(height: 46)
                            }

                            Button {
                                model.isConfirmSecured.toggle()
                            } label: {
                                if !model.confirmPwd.isEmpty {
                                    if model.isConfirmSecured {
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
                        
                        Button {
                            model.checkValid()
                        } label: {
                            if model.isLoading {
                                HStack {
                                    LoadingView()
                                    Text("UPDATE")
                                }
                            } else {
                                Text("UPDATE")
                            }
                        }
                        .buttonStyle(AppButtonStyle())
                        .padding(.top, 20)
                        .alert(item: $model.errorAlert) { item in
                            Alert(title: Text("Notice!"), message: Text(item.message), dismissButton: .default(Text("OK")))
                        }
                        .disabled(model.password.isEmpty || model.newPassword.isEmpty || model.confirmPwd.isEmpty)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 30)
                }
                
            }
            .padding(.top)
        }
        .navigationTitle(Text("Change Password"))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ChangePwdView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePwdView()
    }
}
