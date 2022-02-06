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

