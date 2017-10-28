//
//  ImageViewCollectionViewCellAnimation.swift
//  HIQ-Test-CaoPhuocThanh
//
//  Created by Cao Phuoc Thanh on 10/28/17.
//  Copyright © 2017 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

extension ImageViewCollectionViewCell {

    func deleteAnimation(completion: @escaping (Bool) -> ()) {
        UIView.animate(withDuration: 0.8,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0.2,
                       options: [],
                       animations: {
                        self.imageView.transform = CGAffineTransform(translationX: -self.contentView.frame.width, y: 0)
        }, completion: completion)
    }

}
