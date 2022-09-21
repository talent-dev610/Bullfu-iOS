//
//  HomeItem.swift
//  BullHu
//
//  Created by Good Developer on 2022/6/7.
//

import SwiftUI

struct HomeItem: View {
    
    var text: String
    var image: String
    @Binding var info: String
    
    var body: some View {
        HStack {
            Text(text)
            Spacer()
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(Color.appGrayDark, lineWidth: 1)
                .background(Color.appGrayLight))
        .cornerRadius(12)
    }
}

struct HomeItem_Previews: PreviewProvider {
    static var previews: some View {
        HomeItem(text: "Pick up location/port/terminal", image: "ic_pin", info: .constant(""))
    }
}
