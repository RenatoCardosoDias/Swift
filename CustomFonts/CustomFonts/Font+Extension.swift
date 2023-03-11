//
//  Font+Extension.swift
//  CustomFonts
//
//  Created by Renato on 11/03/23.
//

import SwiftUI

extension Font {
    static func custom(_ font: CustomFont, size: CGFloat) -> SwiftUI.Font {
        SwiftUI.Font.custom(font.rawValue, size: size)
    } //end static func custom
} //end extension Font
