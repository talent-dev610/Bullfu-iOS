//
//  LoadingView.swift
//  BullHu
//
//  Created by Good Developer on 2022/7/19.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(.circular)
            .tint(Color(uiColor: .label))
//            .scaleEffect(0.6)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
