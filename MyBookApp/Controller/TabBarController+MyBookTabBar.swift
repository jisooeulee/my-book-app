//
//  TabBarController+MyBookTabBar.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/10.
//

import UIKit

extension TabBarController {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let selectedTab = tabBar.items?.firstIndex(of: item)
        
        scrollUp()
        
        /// 0: 'home' tab bar, 1: 'my book' tab bar
        switch selectedTab {
        case 0: // home viewを表示する
            if beforeSelectedTab != selectedTab {
                self.homeVC.popViewController(animated: true)
            }
            beforeSelectedTab = SelectedTab.homeTab
        case 1: // my book listを表示する
            if beforeSelectedTab != selectedTab {
                self.readBookListVC.configureActivityIndicator()
                self.readBookListVC.indicator.startAnimating()
                
                FirebaseService.shared.fetchBookInfo { [weak self] result in
                    guard let self = self else { return }
                    
                    // 検索キーワードと一致する本の情報がない場合
                    guard let result = result else {
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
                beforeSelectedTab = SelectedTab.myBookTab
            }
        default:
            break
        }
    }
    
    // MARK: - Scroll Up
    
    func scrollUp() {
        let indexPath = IndexPath(row: NSNotFound, section: 0)
        self.readBookListVC.tableView.scrollToRow(at: indexPath as IndexPath, at: .top, animated: true)
    }
}
