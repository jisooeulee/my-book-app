//
//  ColorTheme.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/04.
//

import UIKit

enum ColorTheme {
    case customLightBlue
    
    var color: UIColor {
        switch self {
        case .customLightBlue:
            return UIColor(r: 88, g: 175, b: 243)
        }
    }
}

extension UIColor {
    
    public convenience init(r: Int, g: Int, b: Int, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: alpha)
    }
    
}

