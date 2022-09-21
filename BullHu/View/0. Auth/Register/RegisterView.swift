//
//  RegisterView.swift
//  BullHu
//
//  Created by Good Developer on 2022/6/3.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject private var model = RegisterViewModel()
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            HStack {
                Text("Hello!\nRegister to \nget started")
                    .font(.system(size: 32))
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                
                Spacer()
                
                ZStack(alignment: .bottomTrailing) {
                    CircleImage(image: model.profileImage ?? Image(systemName: "person.circle"))
                        .frame(width: 120, height: 120)
                        .foregroundColor(.appGray)
                    
                    Button {
                        model.isConfirmationPresented = true
                    } label: {
                        Image("ic_plus")
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 4))
                    }
                    .confirmationDialog("Choose an option", isPresented: $model.isConfirmationPresented) {
                        Button {
                            model.isPresentedCamera = true
                        } label: {
                            Text("Take Photo")
                        }
                        
                        Button {
                            model.isPresentedImagePicker = true
                        } label: {
                            Text("Photo Library")
                        }
                    }
                    .onChange(of: model.inputUIImage) { _ in model.loadImage() }
                    .fullScreenCover(isPresented: $model.isPresentedCamera) {
                        ImagePicker(image: $model.inputUIImage, sourceType: .camera)
                    }
                    .fullScreenCover(isPresented: $model.isPresentedImagePicker) {
                        ImagePicker(image: $model.inputUIImage, sourceType: .photoLibrary)
                    }
                }
            }
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(Color.appPrimaryDark)
            
            ZStack {
                Text("")
                    .frame(maxWidth: .infinity, maxHeight: 70)
                    .background(Color.appPrimaryDark)
                
                Text("")
                    .frame(maxWidth: .infinity, maxHeight: 70)
                    .background(RoundedCorners(color: .white, tl: 35, tr: 35, bl: 0, br: 0))
            }
            .frame(height: 70)
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 0) {
                    AppTextField(text: $model.fullName, placeholder: "Full Name", keyboardType: .namePhonePad, imageName: "ic_person")
                    AppTextField(text: $model.email, placeholder: "Email", keyboardType: .emailAddress, imageName: "ic_email")
                        .padding(.top, 16)
                    HStack {
                        model.phoneNumberField
                            .frame(height: 46)
                        
                        Image("ic_phone")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    .padding(.horizontal, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 4, style: .continuous)
                            .stroke(Color.appGrayDark, lineWidth: 1)
                            .background(Color.appGrayLight))
                    .padding(.top, 16)
                    .padding(.horizontal, 2)
                    .onAppear {
                        model.phoneNumberField = PhoneNumberView(countryCode: $model.countryCode, nationalNum: $model.phone)
                    }
                    
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
                                    Image(systemName: "eye")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 16)
                                        .foregroundColor(.appPrimary)
                                } else {
                                    Image(systemName: "eye.slash")
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
                    .padding(.top, 16)
                    .padding(.horizontal, 2)
                    
                    AppSegmentedControl(preselectedIndex: $model.userTypeIndex, options: ["Consignor", "Driver"])
                        .padding(.top, 16)
                    
                    Button {
                        model.checkValid()
                    } label: {
                        if model.isLoading {
                            HStack {
                                LoadingView()
                                Text("REGISTER")
                                    .padding(.leading)
                            }
                        } else {
                            Text("REGISTER")
                        }
                        
                    }
                    .buttonStyle(AppButtonStyle())
                    .padding(.top, 30)
                    .disabled(model.isLoading)
                    .alert(item: $model.errorAlert) { item in
                        Alert(title: Text("Notice!"), message: Text(item.message), dismissButton: .default(Text("OK")))
                    }
                    .fullScreenCover(isPresented: $model.isSucceeded, onDismiss: nil) {
                        MainTabView()
                    }
                }
                .padding(.horizontal, 30)
                
                Text("")
                    .frame(height: 200)
                    .background(Color.green)
            }
            .offset(y: -30)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .previewDevice("iPhone 13 Pro Max")
    }
}
