//
//  ContentView.swift
//  BullHu
//
//  Created by Good Developer on 2022/6/3.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isSplashPresented = true
    
    var body: some View {
        VStack {
            if isSplashPresented {
                SplashView()
            } else {
                LoginView()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation {
                    isSplashPresented = false
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
