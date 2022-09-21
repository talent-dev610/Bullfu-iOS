//
//  ForgotPwdView.swift
//  BullHu
//
//  Created by Good Developer on 2022/6/15.
//

import SwiftUI

struct ForgotPwdView: View {
    
    @StateObject private var model = ForgotPwdViewModel()
    
    init() {
        //Use this if NavigationBarTitle is with Large Font
        //UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.red]
        
        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
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
                        AppTextField(text: $model.email, placeholder: "Email", keyboardType: .emailAddress, imageName: "ic_email")
                        
                        if model.isCodeSent {
                            model.codeView
                                .frame(height: 80)
                        }
                        
                        Button {
                            if model.isCodeSent {
                                model.runVerifyCode()
                            } else {
                                model.checkValid()
                            }
                        } label: {
                            if model.isCodeSent {
                                if model.isLoading {
                                    HStack {
                                        LoadingView()
                                        Text("Verifying...")
                                            .padding(.leading)
                                    }
                                } else {
                                    Text("Verify")
                                }
                            } else {
                                if model.isLoading {
                                    HStack {
                                        LoadingView()
                                        Text("Sending...")
                                            .padding(.leading)
                                    }
                                } else {
                                    Text("Send Code")
                                }
                            }
                        }
                        .buttonStyle(AppButtonStyle())
                        .padding(.top, 20)
                        .disabled(model.email.isEmpty)
                        .alert(item: $model.errorAlert) { item in
                            Alert(title: Text("Sorry!"), message: Text(item.message), dismissButton: .default(Text("OK")))
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal, 30)
                }
                
                NavigationLink(destination: ResetPwdView(email: model.email), isActive: $model.isSucceeded) {}
                
                //'init(destination:isActive:label:)' was deprecated in iOS 16.0: use NavigationLink(value:label:) inside a NavigationStack or NavigationSplitView
                
            }
            .padding(.top)
            .navigationTitle(Text("Forgot Password"))
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                model.codeView = PinCodeView(code: $model.code)
            }
        }
    }
}

struct ForgotPwdView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPwdView()
    }
}
