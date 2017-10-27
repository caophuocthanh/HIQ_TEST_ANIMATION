//
//  ImageView.swift
//  HIQ-Test-CaoPhuocThanh
//
//  Created by Cao Phuoc Thanh on 10/26/17.
//  Copyright © 2017 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

class ImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init() {
        let frame:CGRect = CGRect.zero
        self.init(frame: frame)
    }
    
    func loadImage(_ stringUrl: String,_ comletion: ((Bool)->())?) {
        if let url = URL(string: stringUrl) {
            self.pin_updateWithProgress = true
            self.pin_setImage(from: url) { (imageManagerResult) in
                if imageManagerResult.error == nil {
                    comletion?(true)
                } else {
                    comletion?(false)
                }
            }
        } else {
            comletion?(false)
        }
    }
}

