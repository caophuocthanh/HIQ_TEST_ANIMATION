//
//  FistCollectionViewModel.swift
//  HIQ-Test-CaoPhuocThanh
//
//  Created by Cao Phuoc Thanh on 10/27/17.
//  Copyright © 2017 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

struct FistCollectionViewModel {

    var imageURLHeaderString: String
    var menuViewModels: [MenuViewModel] = []
    
    init(imageURLHeaderString: String, menuViewModels: [MenuViewModel]) {
        self.imageURLHeaderString = imageURLHeaderString
        self.menuViewModels = menuViewModels
    }
}
