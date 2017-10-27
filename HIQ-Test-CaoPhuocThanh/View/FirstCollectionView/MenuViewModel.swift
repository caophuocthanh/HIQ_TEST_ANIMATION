//
//  MenuViewModel.swift
//  HIQ-Test-CaoPhuocThanh
//
//  Created by Cao Phuoc Thanh on 10/27/17.
//  Copyright © 2017 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

struct MenuViewModel {
    
    var name: String
    var image: UIImage
    var color: UIColor
    
    init(name: String, image: UIImage, color: UIColor) {
        self.name = name
        self.image = image
        self.color = color
    }
    
}
