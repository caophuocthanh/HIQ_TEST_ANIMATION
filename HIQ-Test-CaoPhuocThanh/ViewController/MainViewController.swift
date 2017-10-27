//
//  ViewController.swift
//  HIQ-Test-CaoPhuocThanh
//
//  Created by Cao Phuoc Thanh on 10/26/17.
//  Copyright © 2017 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

// MARK: Class

class MainViewController: TabBarController {
    
    // MARK: Private properties
    
    fileprivate let firstViewController: ViewController = FirstViewController()
    fileprivate let secondViewController: ViewController = ViewController()
    fileprivate let thirdViewController: ViewController = ViewController()
    fileprivate let fourthViewController: ViewController = ViewController()
    fileprivate let fifthViewController: ViewController = ViewController()
    
    // MARK: Life Circle
    
    override func loadView() {
        super.loadView()
        firstViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "oval-icon"), tag: 1)
        secondViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "oval-icon"), tag: 2)
        thirdViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "oval-icon"), tag: 3)
        fourthViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "oval-icon"), tag: 4)
        fifthViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "oval-icon"), tag: 5)
        
        firstViewController.tabBarItem.selectedImage = UIImage(named: "oval-fill-icon")
        secondViewController.tabBarItem.selectedImage = UIImage(named: "oval-fill-icon")
        thirdViewController.tabBarItem.selectedImage = UIImage(named: "oval-fill-icon")
        fourthViewController.tabBarItem.selectedImage = UIImage(named: "oval-fill-icon")
        fifthViewController.tabBarItem.selectedImage = UIImage(named: "oval-fill-icon")
        
        self.viewControllers = [
            NavigationController(rootViewController: firstViewController),
            NavigationController(rootViewController: secondViewController),
            NavigationController(rootViewController: thirdViewController),
            NavigationController(rootViewController: fourthViewController),
            NavigationController(rootViewController: fifthViewController)
        ]
        
        for tabBarItem in self.tabBar.items! {
            tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
        }
        
        self.view.backgroundColor = UIColor.white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

// MARK: Delegate

extension MainViewController {
    
    // Animation Touch TabBarItem
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        (self.tabBar.subviews[item.tag].subviews.first as! UIImageView).pop(1)
    }
}

