//
//  CustomTabBar.swift
//  Spreago
//
//  Created by eman shedeed on 6/29/20.
//  Copyright © 2020 eman shedeed. All rights reserved.
//

import Foundation
import UIKit
class CustomTabBar: UITabBarController {
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.tabBar.frame.origin.y -= 30
        self.tabBar.frame.size.width -= 30
        self.tabBar.center.x = self.view.center.x
        
        self.tabBar.layer.cornerRadius = self.tabBar.frame.height / 5
        self.tabBar.clipsToBounds = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBar.applyGradient(with: [UIColor.tabbarGradiant1!,UIColor.tabbarGradiant2!], gradient: .horizontal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.appColor2!], for: .selected)
        
        if  let arrayOfTabBarItems = self.tabBar.items as AnyObject as? NSArray{
//            let tabBarItem = arrayOfTabBarItems[3] as? UITabBarItem
            arrayOfTabBarItems.forEach { (tabBarItem) in
                if let item = tabBarItem as? UITabBarItem{
                    item.isEnabled = false
                }
            }
            if  let tabBarItem = arrayOfTabBarItems[0] as? UITabBarItem{
                tabBarItem.isEnabled = true
            }
           
        }
    }
}
