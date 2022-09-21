//
//  CircleImage.swift
//  Icered
//
//  Created by Good Developer on 2022/3/4.
//

import SwiftUI

struct CircleImage: View {
    
    var image: Image
    var borderColor: Color = .appPrimary
    
    var body: some View {
        image
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
            .frame(minWidth: 20, maxWidth: 180, minHeight: 20, maxHeight: 180, alignment: .center)
//            .overlay(Circle().stroke(borderColor, lineWidth: 1))
            .padding(.all, 1)
//            .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("img_default"), borderColor: .appPrimary)
    }
}
