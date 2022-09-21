//
//  PinCodeView.swift
//  Icered
//
//  Created by Good Developer on 2022/3/16.
//

import SwiftUI
import UIKit
import DPOTPView

struct PinCodeView: UIViewRepresentable {
    
    typealias UIViewType = DPOTPView
    
    private let txtOTPView = DPOTPView()
    @Binding var code: String
    
    func makeUIView(context: Context) -> DPOTPView {
        txtOTPView.count = 6
        txtOTPView.spacing = 10
        txtOTPView.borderWidthTextField = 1
        txtOTPView.selectedBorderWidthTextField = 1
        txtOTPView.cornerRadiusTextField = 8
        
        txtOTPView.textColorTextField = .black
        txtOTPView.placeholderTextColor = UIColor.appPrimary
        txtOTPView.tintColorTextField = .appPrimary
        txtOTPView.borderColorTextField = UIColor.appGray
        txtOTPView.selectedBorderColorTextField = UIColor.appGrayDark
        txtOTPView.isCursorHidden = true
        txtOTPView.backGroundColorTextField = .appGrayLight
        
//        txtOTPView.becomeFirstResponder()
        
        return txtOTPView
    }
    
    func updateUIView(_ uiView: DPOTPView, context: Context) {
        
    }
    
    func getCode() {
        code = txtOTPView.text ?? "123"
    }
}

struct PinCodeView_Previews: PreviewProvider {
    static var previews: some View {
        PinCodeView(code: .constant("123456"))
            .previewLayout(.fixed(width: 350, height: 200))
    }
}
