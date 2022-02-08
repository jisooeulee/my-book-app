//
//  Extensions.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/04.
//

import UIKit
import Kingfisher

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

extension UIImageView {
    
    func setImage(imageUrl: String) {
        self.kf.setImage(with: URL(string: imageUrl))
    }
}

extension UIView {
    
    /// Shadow Effectをセットする
    func cellDropShadow(color: UIColor = .black, opacity: Float = 0.3, offset: CGSize = CGSize(width: 1, height: 3), radius: CGFloat = 4) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
    
    func detailStackViewDropShadow(color: CGColor, opcity: Float = 0.4, offset: CGSize = CGSize(width: 0, height: 4), radius: CGFloat = 4) {
        layer.shadowColor = color
        layer.shadowOffset = offset
        layer.shadowOpacity = opcity
        layer.shadowRadius = radius
    }
    
    func setCornerRadius(cornerRadius: CGFloat = 8, masksToBounds: Bool = true) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = masksToBounds
    }
}

extension UIViewController {
    /// Alertを表示する
    func showAlert(title: String, message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension UIColor {
    
    public convenience init(r: Int, g: Int, b: Int, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: alpha)
    }
}
