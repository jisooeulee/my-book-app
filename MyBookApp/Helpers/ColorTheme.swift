//
//  ColorTheme.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/04.
//

import UIKit

enum ColorTheme {
    case customLightBlue
    case customLightNavi
    case customDarkNavi
    case customLightPink
    case customDarkPink
    
    var color: UIColor {
        switch self {
        case .customLightBlue:
            return UIColor(r: 73, g: 139, b: 174)
        case .customLightNavi:
            return UIColor(r: 22, g: 38, b: 68)
        case .customDarkNavi:
            return UIColor(r: 12, g: 27, b: 59)
        case .customLightPink:
            return UIColor(r: 231, g: 191, b: 193)
        case .customDarkPink:
            return UIColor(r: 187, g: 159, b: 165)
        }
    }
}

