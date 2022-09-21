//
//  AppSegmentedControl.swift
//  BullHu
//
//  Created by Good Developer on 2022/6/4.
//

import SwiftUI

struct AppSegmentedControl: View {
    @Binding var preselectedIndex: Int
    var options: [String]
    let color = Color.appPrimary
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(options.indices, id:\.self) { index in
                let isSelected = preselectedIndex == index
                ZStack {
                    Rectangle()
                        .fill(color.opacity(0.05))
                    
                    Rectangle()
                        .fill(color)
                        .cornerRadius(4)
                        .padding(2)
                        .opacity(isSelected ? 1 : 0.01)
                        .onTapGesture {
                            withAnimation(.interactiveSpring(response: 0.2,
                                                             dampingFraction: 2,
                                                             blendDuration: 0.5)) {
                                preselectedIndex = index
                            }
                        }
                }
                .overlay(
                    Text(options[index])
                        .fontWeight(isSelected ? .medium : .regular)
                        .foregroundColor(isSelected ? .white : .black)
                )
            }
        }
        .frame(height: 40)
        .cornerRadius(4)
    }
}

struct AppSegmentedControl_Previews: PreviewProvider {
    static var previews: some View {
        AppSegmentedControl(preselectedIndex: .constant(0), options: ["Consignor", "Driver"])
    }
}
