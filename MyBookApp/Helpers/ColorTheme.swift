//
//  ColorTheme.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/04.
//

import UIKit

enum ColorTheme {
    case customYellow
    case customLightBlue
    
    var color: UIColor {
        switch self {
        case .customYellow:
            return UIColor(r: 235, g: 190, b: 104)
        case .customLightBlue:
            return UIColor(r: 88, g: 175, b: 243)
        }
    }
}

