//
//  TabBarController.swift
//  HIQ-Test-CaoPhuocThanh
//
//  Created by Cao Phuoc Thanh on 10/26/17.
//  Copyright © 2017 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func loadView() {
        super.loadView()
        
        self.tabBar.barTintColor = UIColor.white
        self.tabBar.backgroundColor = UIColor.white
        self.tabBar.tintColor = UIColor.yellow
        self.tabBar.shadowImage = nil
        self.tabBar.backgroundImage = nil
        self.tabBar.tintAdjustmentMode = .automatic
        self.tabBar.layer.masksToBounds = true
        self.tabBar.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.6).cgColor
        self.tabBar.layer.borderWidth = 0.5
    }

}
