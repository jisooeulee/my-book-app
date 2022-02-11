//
//  TabBarController.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/04.
//

import UIKit

class TabBarController: UITabBarController {
    
    var beforeSelectedTab: Int?
    let homeVC = UINavigationController(rootViewController: HomeViewController())
    let readBookListVC = MyBookListViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarProperty()
        
        homeVC.tabBarItem.selectedImage = UIImage(systemName: Symbols.star)
        homeVC.tabBarItem.title = Text.homeTabBarTitle
        homeVC.tabBarItem.image = UIImage(systemName: Symbols.starFill)
        
        readBookListVC.tabBarItem.selectedImage = UIImage(systemName: Symbols.checkMarkCircle)
        readBookListVC.tabBarItem.title = Text.myBookTabBarTitle
        readBookListVC.tabBarItem.image = UIImage(systemName: Symbols.checkMarkCircleFill)
        
        viewControllers = [homeVC, readBookListVC]
    }
    
}
