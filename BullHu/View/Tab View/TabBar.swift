//
//  TabBar.swift
//  BullHu
//
//  Created by Good Developer on 2022/6/7.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Image("ic_home")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 26, height: 26)
                Text("Home")
                    .font(.system(size: 12))
            }
            Spacer()
            VStack {
                Image("ic_home")
                Text("Home")
            }
            Spacer()
            VStack {
                Image("ic_home")
                Text("Home")
            }
            Spacer()
            VStack {
                Image("ic_home")
                Text("Home")
            }
            Spacer()
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
