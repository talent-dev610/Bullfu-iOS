//
//  SplashView.swift
//  BullHu
//
//  Created by Good Developer on 2022/6/3.
//

import SwiftUI

struct SplashView: View {
    
    @State private var scaleValue: CGFloat = 1.0
    
    var body: some View {
        Image("logo")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
            .scaleEffect(scaleValue)
            .task {
                Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { _ in
                    withAnimation {
                        self.scaleValue = SCREENHEIGHT / 30
                    }
                }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
