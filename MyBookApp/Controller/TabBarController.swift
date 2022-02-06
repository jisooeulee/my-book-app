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
        
        self.tabBar.barTintColor = .white
        self.tabBar.tintColor = .red
        self.tabBar.unselectedItemTintColor = .gray
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        homeVC.tabBarItem.selectedImage = UIImage(systemName: SFSymbols.star)
        homeVC.tabBarItem.title = Text.homeTabBarTitle
        homeVC.tabBarItem.image = UIImage(systemName: SFSymbols.starFill)
        
        let readBookListVC = UIViewController()
        readBookListVC.view.backgroundColor = .orange
        readBookListVC.tabBarItem.selectedImage = UIImage(systemName: SFSymbols.checkMarkCircle)
        readBookListVC.tabBarItem.title = Text.myBookTabBarTitle
        readBookListVC.tabBarItem.image = UIImage(systemName: SFSymbols.checkMarkCircleFill)
        
        let settingVC = UIViewController()
        settingVC.view.backgroundColor = .lightGray
        settingVC.tabBarItem.selectedImage = UIImage(systemName: SFSymbols.gearShape)
        settingVC.tabBarItem.title = Text.settingTabBarTitle
        settingVC.tabBarItem.image = UIImage(systemName: SFSymbols.gearShapeFill)
        
        viewControllers = [homeVC, readBookListVC, settingVC]
    }
    
}
