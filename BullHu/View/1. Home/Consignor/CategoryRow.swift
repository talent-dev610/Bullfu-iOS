//
//  CategoryRow.swift
//  BullHu
//
//  Created by Good Developer on 2022/6/7.
//

import SwiftUI

struct CategoryRow: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 0) {
                ForEach(0 ..< 5) { num in
                    CategoryItem()
                }
            }
        }
        .frame(height: 160)
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow()
    }
}

struct CategoryItem: View {
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image("img_default")
                .renderingMode(.original)
                .resizable()
                .frame(width: 300, height: 155)
                .cornerRadius(5)
            
            Text("Request Fast Delivery")
                .font(.primaryBold)
                .foregroundColor(.white)
                .padding()
        }
        .padding(.trailing, 16)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem()
    }
}
