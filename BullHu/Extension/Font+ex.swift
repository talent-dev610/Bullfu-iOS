//
//  Font+ex.swift
//  Icered
//
//  Created by Good Developer on 2022/3/2.
//

import SwiftUI

extension Font {
    static func appFont(_ style: AppFontStyle, size: CGFloat) -> Font {
        custom(style.rawValue, size: size)
    }
    
    static let primaryRegular = appFont(.regular, size: 17)
    static let primaryMedium  = appFont(.medium, size: 17)
    static let primaryBold    = appFont(.bold, size: 17)
}



enum AppFontStyle: String {
    case black        = "Inter-Black"
    
    case extraLight   = "Inter-ExtraLight"
    case light        = "Inter-Light"
    case thin         = "Inter-Thin"
    case medium       = "Inter-Medium"
    case regular      = "Inter-Regular"
    
    case semiBold     = "Inter-SemiBold"
    case bold         = "Inter-Bold"
    case extraBold    = "Inter-ExtraBold"
}
