//
//  TabBarController.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/04.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.backgroundColor = .systemBackground
        self.tabBar.tintColor = .systemRed
        self.tabBar.unselectedItemTintColor = .systemGray
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        homeVC.tabBarItem.selectedImage = UIImage(systemName: Symbols.star)
        homeVC.tabBarItem.title = Text.homeTabBarTitle
        homeVC.tabBarItem.image = UIImage(systemName: Symbols.starFill)
        
        let readBookListVC = UIViewController()
        readBookListVC.view.backgroundColor = .orange // TODO: 削除予定
        readBookListVC.tabBarItem.selectedImage = UIImage(systemName: Symbols.checkMarkCircle)
        readBookListVC.tabBarItem.title = Text.myBookTabBarTitle
        readBookListVC.tabBarItem.image = UIImage(systemName: Symbols.checkMarkCircleFill)
        
        let settingVC = UIViewController()
        settingVC.view.backgroundColor = .lightGray // TODO: 削除予定
        settingVC.tabBarItem.selectedImage = UIImage(systemName: Symbols.gearShape)
        settingVC.tabBarItem.title = Text.settingTabBarTitle
        settingVC.tabBarItem.image = UIImage(systemName: Symbols.gearShapeFill)
        
        viewControllers = [homeVC, readBookListVC, settingVC]
    }
    
}
