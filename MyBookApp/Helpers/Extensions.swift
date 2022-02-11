//
//  Extensions.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/04.
//

import UIKit
import Kingfisher
import SPAlert

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
    
    func setDetailViewProperty() {
        backgroundColor = ColorTheme.customDarkNavi.color
    }
    
    func setDetailInfoViewProperty() {
        backgroundColor = ColorTheme.customLightNavi.color
        setCornerRadius(cornerRadius: 4, masksToBounds: false)
    }
    
}

extension UIViewController {
    
    // MARK: - Alert
    
    func showNoDataAlert() {
        let alertView = SPAlertView(title: Text.alertTitle, preset: .error)
        alertView.duration = 1
        
        alertView.present()
    }
    
    func showDoneAlert() {
        let alertView = SPAlertView(title: Text.registered, preset: .done)
        alertView.duration = 0.5
        
        alertView.present()
    }
    
    // MARK: - Setting of UIViewController
    
    func setHomeViewControllerProperty() {
        view.backgroundColor = ColorTheme.customLightBlue.color
    }
    
    func setMyBookListViewControllerProperty() {
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = ColorTheme.customDarkNavi.color
    }
    
    // MARK: - Setting of NavigationBar, NavigationItem
    
    func setNavigationBarProperty(of navigationController: UINavigationController) {
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController.navigationBar.tintColor = .white
    }
    
    func setNavigationItemProperty() {
        navigationItem.title = Text.navigationItemTitle
    }
    
    // MARK: - Setting of TableView
    
    func setTableViewProperty(of tableView: UITableView) {
        tableView.rowHeight = 150
        tableView.separatorStyle = .none
        tableView.backgroundColor = ColorTheme.customDarkNavi.color
    }
    
    // MARK: - Setting of Search Bar
    
    func setSearchBarProperty(of searchController: UISearchController) {
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.tintColor = .white
        searchController.searchBar.placeholder = Text.searchBarPlaceholder
    }
    
    // MARK: - Setting of TextField
    
    func setSearchTextFieldProperty(of searchController: UISearchController) {
        searchController.searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: Text.searchBarPlaceholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        searchController.searchBar.searchTextField.textColor = .white
    }
    
}

extension UIColor {
    
    public convenience init(r: Int, g: Int, b: Int, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: alpha)
    }
}

extension UITableViewCell {
    
    func setBookCellProperty() {
        selectionStyle = .none
        backgroundColor = ColorTheme.customDarkNavi.color
        contentView.backgroundColor = ColorTheme.customLightNavi.color
        contentView.setCornerRadius()
    }
}

extension UITabBarController {
    
    func setTabBarProperty() {
        tabBar.backgroundColor = ColorTheme.customDarkNavi.color
        tabBar.barTintColor = ColorTheme.customDarkNavi.color
        tabBar.tintColor = ColorTheme.customMint.color
        tabBar.unselectedItemTintColor = .white
        tabBar.isTranslucent = false
    }
    
}
