//
//  SectionImageViewModel.swift
//  HIQ-Test-CaoPhuocThanh
//
//  Created by Cao Phuoc Thanh on 10/27/17.
//  Copyright © 2017 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

struct SectionImageViewModel {
    
    var sectionName: String
    var images: [ImageModel]
    
    init(sectionName: String, images: [ImageModel]) {
        self.sectionName = sectionName
        self.images = images
    }

}
