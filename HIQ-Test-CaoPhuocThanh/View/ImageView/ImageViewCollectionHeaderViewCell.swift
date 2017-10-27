//
//  ImageViewCollectionHeaderViewCell.swift
//  HIQ-Test-CaoPhuocThanh
//
//  Created by Cao Phuoc Thanh on 10/26/17.
//  Copyright © 2017 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

class ImageViewCollectionHeaderViewCell: CollectionViewCell {
    
    fileprivate let titleLabel: Label = Label()
    
    var titleString: String! {
        didSet{
            guard let `titleString` = self.titleString else { return }
            self.titleLabel.text = titleString
        }
    }
    
    override func loadView() {
        super.loadView()
        
        self.addSubviews(self.titleLabel)
        self.titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    override func addContraints() {
        super.addContraints()
        
        self.visual("H:|-24-[v]-24-|", views: ["v": titleLabel])
        self.visual("V:|-24-[v]-|", views: ["v": titleLabel])
    }
}
