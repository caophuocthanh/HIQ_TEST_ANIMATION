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
        
        let cells = self.indexPathsForVisibleItems
            .sorted { $0.section < $1.section || $0.row < $1.row }
            .sorted { $0.section < $1.section || $0.row < $1.row }
            .sorted { $0.section < $1.section || $0.row < $1.row }
            .flatMap { self.cellForItem(at: $0) }
        
        let tableHeight: CGFloat = self.bounds.size.height
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        
        var line = 0
        var y: CGFloat = 0.0
        for cell in cells {
            if y != cell.frame.origin.y || y == 0.0 {
                line += 1
            }
            y = cell.frame.origin.y
            UIView.animate(withDuration: withDuration,
                           delay: withDuration/20 * Double(line),
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: [],
                           animations: {
                            cell.transform = CGAffineTransform(translationX: 0, y: 0);
                            
            }, completion: nil)
        }
    }
}
