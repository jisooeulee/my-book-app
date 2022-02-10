//
//  TabBarController+MyBookTabBar.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/10.
//

import UIKit
import SPAlert

extension TabBarController {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        // My Book Tabの場合、My Book Listを表示する
        if tabBar.items?.firstIndex(of: item) == 1 {
            self.readBookListVC.configureActivityIndicator()
            self.readBookListVC.indicator.startAnimating()
            
            FirebaseProcessor.shared.fetchBookInfo { [weak self] result in
                guard let self = self else { return }
                
                if result.isEmpty {
                    self.readBookListVC.indicator.stopAnimating()
                    
                    let alertView = SPAlertView(title: Text.alertTitle, preset: .error)
                    alertView.duration = 1
                    
                    alertView.present()
                    return
                }
                
                let sortedItem = result.sorted { s1, s2 in
                    return s1.id < s2.id
                }
                
                self.readBookListVC.indicator.stopAnimating()
                self.readBookListVC.resetTableView()
                self.readBookListVC.bookData.addItems(newItems: sortedItem)
                self.readBookListVC.tableView.reloadData()
            }
        }
    }
}
