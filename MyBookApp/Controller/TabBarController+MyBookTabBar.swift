//
//  TabBarController+MyBookTabBar.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/10.
//

import UIKit

extension TabBarController {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        scrollUp()
        // My Book Tabの場合、My Book Listを表示する
        if tabBar.items?.firstIndex(of: item) == 1 {
            self.readBookListVC.configureActivityIndicator()
            self.readBookListVC.indicator.startAnimating()
            
            FirebaseProcessor.shared.fetchBookInfo { [weak self] result in
                guard let self = self else { return }
                
                if result.isEmpty {
                    self.readBookListVC.indicator.stopAnimating()
                    self.showNoDataAlert()
                    
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
    
    func scrollUp() {
        let indexPath = IndexPath(row: NSNotFound, section: 0)
        self.readBookListVC.tableView.scrollToRow(at: indexPath as IndexPath, at: .top, animated: true)
    }
}
