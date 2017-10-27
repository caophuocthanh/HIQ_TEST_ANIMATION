//
//  CollectionView.swift
//  HIQ-Test-CaoPhuocThanh
//
//  Created by Cao Phuoc Thanh on 10/26/17.
//  Copyright © 2017 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

class CollectionView: UICollectionView {
    
    let layout = CollectionViewFlowLayout()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: CGRect.zero, collectionViewLayout: self.layout)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.white
        self.alwaysBounceVertical = true
        self.loadView()
        self.addContraints()
    }
    
    internal func loadView() {
        
    }
    
    internal func addContraints() {
        
    }
    
    func animateTable(withDuration: Double) {
        self.isHidden = false
        let cells = self.visibleCells
        let tableHeight: CGFloat = self.bounds.size.height
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        
        var index = 0

        for cell in cells {
            UIView.animate(withDuration: withDuration,
                           delay: withDuration/80 * Double(index),
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: [],
                           animations: {
                            cell.transform = CGAffineTransform(translationX: 0, y: 0);
            }, completion: nil)
            index += 1
        }
    }
}
