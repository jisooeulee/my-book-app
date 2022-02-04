//
//  Extensions.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/04.
//

import UIKit

extension UIView {
    
    /// Shadow Effectをセットする
    func dropShadow(color: UIColor = .black, opacity: Float = 0.3, offset: CGSize = CGSize(width: 1, height: 3), radius: CGFloat = 4) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
    
}

