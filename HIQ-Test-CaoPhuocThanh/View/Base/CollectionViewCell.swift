//
//  CollectionViewCell.swift
//  HIQ-Test-CaoPhuocThanh
//
//  Created by Cao Phuoc Thanh on 10/26/17.
//  Copyright © 2017 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

// MARK: Life Circel

class CollectionViewCell: UICollectionViewCell {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadView()
        self.addContraints()
        self.loadData()
    }
    
    internal func loadView() {
        
    }
    
    internal func loadData() {
        
    }
    
    internal func addContraints() {
        
    }
    
    deinit{
        NotificationCenter.default.removeObserver(self)
    }
}

// MARK: - BaseCollectionViewCell Utils

extension CollectionViewCell {
    
    class func reuseIdentifier() -> String {
        return String(describing: type(of: (self) as AnyObject)).components(separatedBy: "__").last!
    }
    
}

