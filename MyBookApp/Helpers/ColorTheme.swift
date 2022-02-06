//
//  ColorTheme.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/04.
//

import UIKit

enum ColorTheme {
    case customYellow
    
    var color: UIColor {
        switch self {
        case .customYellow:
            return UIColor(r: 235, g: 190, b: 104)
        }
    }
}

