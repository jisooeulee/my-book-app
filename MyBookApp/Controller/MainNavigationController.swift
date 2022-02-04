//
//  MainNavigationController.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/04.
//

import UIKit

class MainNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [TabBarController()] // Embed
    }
}
