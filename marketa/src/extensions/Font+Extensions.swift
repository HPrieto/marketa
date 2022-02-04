//
//  Font+Extensions.swift
//  marketa
//
//  Created by Heriberto Prieto on 2/3/22.
//

import SwiftUI

extension Font {
    
    public static func avenirNext(_ weight: Font.Weight, size: CGFloat) -> Font {
        let fontName: String
        switch weight {
        case .light: fontName = "AvenirNext-UltraLight"
        case .heavy: fontName = "AvenirNext-Heavy"
        case .medium: fontName = "AvenirNext-Medium"
        case .bold: fontName = "AvenirNext-Bold"
        case .regular: fontName = "AvenirNext-Regular"
        case .semibold: fontName = "AvenirNext-DemiBold"
        case .black: fontName = "AvenirNext-Black"
        case .ultraLight: fontName = "AvenirNext-UltraLight"
        default: fontName = "AvenirNext-Regular"
        }
        return Font.custom(fontName, size: size)
    }
    
}
