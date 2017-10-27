//
//  ImageModel.swift
//  HIQ-Test-CaoPhuocThanh
//
//  Created by Cao Phuoc Thanh on 10/26/17.
//  Copyright © 2017 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

class ImageModel: Model {
    
    var imageURLString: String
    var height: Double
    var width: Double
    var toneColor: UIColor
    
    init(imageURLString: String, height: Double, width: Double, toneColor: UIColor) {
        self.imageURLString = imageURLString
        self.height = height
        self.width = width
        self.toneColor = toneColor
    }
}
