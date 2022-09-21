//
//  MyProfileView.swift
//  BullHu
//
//  Created by Good Developer on 2022/6/8.
//

import SwiftUI

struct MyProfileView: View {
    
    @StateObject private var model = MyProfileViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("")
                Spacer()
            }
            .frame(height: 80)
            .background(Color.appPrimaryDark)
            
            Text("")
                .frame(maxWidth: .infinity, maxHeight: 70)
                .background(RoundedCorners(color: .white, tl: 35, tr: 35, bl: 0, br: 0))
                .offset(y: -35)
            
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    
                    AsyncImage(url: URL(string: model.user.photo)!, scale: 1.0) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        ProgressView()
                            .progressViewStyle(.circular)
                    }
                    .frame(width: 120, height: 120, alignment: .center)
                    .clipShape(Circle())

                    CircleImage(image: model.profileImage ?? Image(""))
                        .frame(width: 120, height: 120)
                    
                    if model.isImageUploading {
                        ProgressView()
                            .progressViewStyle(.circular)
                    }
                    
                    Button {
                        model.isConfirmationPresented = true
                    } label: {
                        Image("ic_plus")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.appPrimaryDark)
                            .frame(width: 35, height: 35)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
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
                
                AppTextField(text: $model.name, placeholder: "Full Name", keyboardType: .default, imageName: "ic_person")
                    .padding(.horizontal, 30)
                    .padding(.top)
                
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
                .padding(.horizontal, 30)
                .padding(.top)
                .onAppear {
                    model.phoneNumberField = PhoneNumberView(countryCode: $model.countryCode, nationalNum: $model.phone)
                }
                
                Button {
                    model.checkValid()
                } label: {
                    if model.isLoading {
                        HStack {
                            LoadingView()
                            Text("CHANGE")
                        }
                    } else {
                        Text("CHANGE")
                    }
                }
                .buttonStyle(AppButtonStyle())
                .padding(.horizontal, 30)
                .padding(.top, 16)
                .onAppear {
                    model.name = model.user.name
                }
                .alert(item: $model.errorAlert) { item in
                    Alert(title: Text("Notice!"), message: Text(item.message), dismissButton: .default(Text("OK")))
                }
                
            }
            .offset(y: -170)
            .padding(.bottom, -170)
            
            Spacer()
        }
    }
}

struct MyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileView()
    }
}
