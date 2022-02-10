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
    
    func setCornerRadius(cornerRadius: CGFloat = 8, masksToBounds: Bool = true) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = masksToBounds
    }
    
    func configureDetailView() {
        backgroundColor = ColorTheme.customDarkNavi.color
    }
    
    func configureDetailInfoView() {
        backgroundColor = ColorTheme.customLightNavi.color
        setCornerRadius(cornerRadius: 4, masksToBounds: false)
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
    
    func configureSearchTextField(of searchController: UISearchController) {
        searchController.searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: Text.searchBarPlaceholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        searchController.searchBar.searchTextField.textColor = .white
    }
    
    func configureHomeViewController(view: UIView) {
        view.backgroundColor = ColorTheme.customLightBlue.color
    }
    
    func configureDetailViewController(view: UIView) {
        view.backgroundColor = .white
    }
    
    func configureNavigationBar(of navigationController: UINavigationController) {
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController.navigationBar.tintColor = .white
        navigationController.navigationBar.barTintColor = ColorTheme.customLightNavi.color
    }
    
    func configureNavigationItem() {
        navigationItem.title = Text.navigationItemTitle
    }
    
}

extension UIColor {
    
    public convenience init(r: Int, g: Int, b: Int, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: alpha)
    }
}

extension UITableViewCell {
    
    func configureBookCell() {
        selectionStyle = .none
        backgroundColor = ColorTheme.customDarkNavi.color
        contentView.backgroundColor = ColorTheme.customLightNavi.color
        contentView.setCornerRadius()
    }
}
