//
//  ImageViewCollectionViewAnimation.swift
//  HIQ-Test-CaoPhuocThanh
//
//  Created by Cao Phuoc Thanh on 10/28/17.
//  Copyright © 2017 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

extension ImageViewCollectionView {
    
    func deleteAnaimationCell(indexPath: IndexPath) {
        if let deleteCell = self.cellForItem(at: indexPath) {
            UIView.animate(withDuration: 2,
                           delay: 0.2,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0.2,
                           options: [],
                           animations: {
                            (deleteCell as? ImageViewCollectionViewCell)?.deleteAnimation(completion: { (_) in
                                deleteCell.isHidden = true
                            })
            }, completion: { (_) in
                var tempCell = deleteCell
                for i in 1...3 {
                    if let nextCell = self.cellForItem(at: IndexPath(row: indexPath.row + i, section: indexPath.section)) {
                        if nextCell.frame.origin.y == tempCell.frame.origin.y && nextCell.isHidden == false {
                            UIView.animate(withDuration: 2,
                                           delay: 0.5 * Double(i),
                                           usingSpringWithDamping: 0.8,
                                           initialSpringVelocity: 0.2,
                                           options: [],
                                           animations: {
                                            nextCell.transform = CGAffineTransform(translationX: nextCell.bounds.origin.x - (deleteCell.bounds.width - nextCell.transform.tx), y: nextCell.bounds.origin.y)
                            }, completion: { (_) in })
                            tempCell = nextCell
                        }
                    }
                }
            })
        }
    }
}


