//
//  ButtonStyle.swift
//  Icered
//
//  Created by Good Developer on 2022/3/2.
//

import SwiftUI

struct AppButtonStyle: PrimitiveButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: configuration.trigger) {
            configuration.label
                .padding()
                .font(.primaryBold)
                .tint(.appPrimary)
                .frame(maxWidth: .infinity, maxHeight: 46)
                .foregroundColor(.white)
                .background(Color.appPrimaryDark)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.appPrimary, lineWidth: 1))
                
        }
//        .buttonStyle(.borderedProminent)
        .controlSize(.large)
    }
}

struct AppButton_Previews: PreviewProvider {
    static var previews: some View {
        Button("Button") {}
            .buttonStyle(AppButtonStyle())
            .padding()
            .previewLayout(.fixed(width: 350, height: 100))
    }
}
