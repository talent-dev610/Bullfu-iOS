//
//  DeliverView.swift
//  BullHu
//
//  Created by Good Developer on 2022/6/8.
//

import SwiftUI

struct DeliverView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                HStack {
                    VStack(spacing: 16) {
                        VStack(alignment: .leading) {
                            Text("Pick up location")
                                .font(.appFont(.extraBold, size: 20))
                            
                            Text("Hello, World! Hello, World! Hello, World!")
                                .font(.appFont(.regular, size: 16))
                                .foregroundColor(.appGrayDark)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Drop off location")
                                .font(.appFont(.extraBold, size: 20))
                            
                            Text("Hello, World! Hello, World! Hello, World!")
                                .font(.appFont(.regular, size: 16))
                                .foregroundColor(.appGrayDark)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Empty container/freight return location")
                                .font(.appFont(.extraBold, size: 20))
                            
                            Text("Hello, World! Hello, World! Hello, World!")
                                .font(.appFont(.regular, size: 16))
                                .foregroundColor(.appGrayDark)
                        }
                    }
                    Spacer()
                }
                .padding()
                .background(Color.appGrayLight)
                .cornerRadius(16)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Delivery Complete")
                }
                .buttonStyle(AppButtonStyle())
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
            }
            .padding()
            .toolbar {
                ToolbarItem {
                    Image("logo_bar")
                        .resizable()
                        .scaledToFit()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct DeliverView_Previews: PreviewProvider {
    static var previews: some View {
        DeliverView()
    }
}
