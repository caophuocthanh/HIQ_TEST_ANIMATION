//
//  ImageViewCollectionViewAnimation.swift
//  HIQ-Test-CaoPhuocThanh
//
//  Created by Cao Phuoc Thanh on 10/28/17.
//  Copyright © 2017 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

extension ImageViewCollectionView {
    
    func deleteItemAnimation(indexPath: IndexPath) {
        if let cell = self.cellForItem(at: indexPath) as? ImageViewCollectionViewCell {
            cell.deleteAnimation(completion: { (_) in
                UIView.animate(withDuration: 0.8,
                               delay: 0,
                               usingSpringWithDamping: 0.8,
                               initialSpringVelocity: 0.2,
                               options: [],
                               animations: {
                     self.deleteItems(at: [indexPath])
                })
            })
        }
        
    }
}


