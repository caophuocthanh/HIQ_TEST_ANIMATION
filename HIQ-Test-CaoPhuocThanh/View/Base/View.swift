//
//  View.swift
//  HIQ-Test-CaoPhuocThanh
//
//  Created by Cao Phuoc Thanh on 10/26/17.
//  Copyright © 2017 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

class View: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Default background color
        self.backgroundColor = UIColor.white
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // Setup View
        self.loadView()
        self.addContraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    internal func loadView() {
        
    }
    
    internal func addContraints() {
        
    }

}

extension UIView {
    
    // Top most Controller
    var topController: UIViewController {
        var topController: UIViewController = UIApplication.shared.keyWindow!.rootViewController!
        while (topController.presentedViewController != nil) {
            topController = topController.presentedViewController!
        }
        return topController
    }
    
}
