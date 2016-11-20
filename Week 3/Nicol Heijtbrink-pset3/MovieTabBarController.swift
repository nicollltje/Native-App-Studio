//
//  MovieTabBarController.swift
//  Nicol Heijtbrink-pset3
//
//  Created by Nicol Heijtbrink on 20/11/16.
//  Copyright © 2016 Nicol Heijtbrink. All rights reserved.
//

import UIKit

class MovieTabBarController: UITabBarController{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if let navigtationController = selectedViewController as? UINavigationController{
            let rootViewController = navigtationController.viewControllers[0] 
            rootViewController.viewWillAppear(false)
        }
    }
}
