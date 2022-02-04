//
//  TabBarController.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/04.
//

import UIKit

class TabBarController: UITabBarController {
    
    // TODO: Code Refactoringすること
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.barTintColor = .white
        self.tabBar.tintColor = .red
        self.tabBar.unselectedItemTintColor = .gray
        
        let mainVC = UINavigationController(rootViewController: ViewController())
        mainVC.tabBarItem.selectedImage = UIImage(systemName: "star")
        mainVC.tabBarItem.title = "Home"
        mainVC.tabBarItem.image = UIImage(systemName: "star.fill")
        
        let readBookListView = UIViewController()
        readBookListView.view.backgroundColor = .orange
        readBookListView.tabBarItem.selectedImage = UIImage(systemName: "checkmark.circle")
        readBookListView.tabBarItem.title = "My Book"
        readBookListView.tabBarItem.image = UIImage(systemName: "checkmark.circle.fill")
        
        let settingView = UIViewController()
        settingView.view.backgroundColor = .lightGray
        settingView.tabBarItem.selectedImage = UIImage(systemName: "gearshape")
        settingView.tabBarItem.title = "Setting"
        settingView.tabBarItem.image = UIImage(systemName: "gearshape.fill")
        
        viewControllers = [mainVC, readBookListView, settingView]
    }
    
}
