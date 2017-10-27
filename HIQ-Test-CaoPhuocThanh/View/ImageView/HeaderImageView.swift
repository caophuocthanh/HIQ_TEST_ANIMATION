//
//  HeaderImageView.swift
//  HIQ-Test-CaoPhuocThanh
//
//  Created by Cao Phuoc Thanh on 10/26/17.
//  Copyright © 2017 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

class HeaderImageView: View {

    fileprivate let titleLabel: Label = Label()
    fileprivate let searchButton: Button = Button()
    
    override func loadView() {
        super.loadView()
        
        self.addSubviews(self.titleLabel, searchButton)
        
        self.titleLabel.text = "IMAGES"
        self.titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        self.searchButton.setImage(UIImage(named:"search-icon"), for: .normal)
    }

    override func addContraints() {
        super.addContraints()
        
        self.visual("H:|-24-[v]-(>=8)-[v1]-24-|", views: ["v": titleLabel, "v1": searchButton])
        self.visual("V:|-[v]-|", views: ["v": titleLabel])
        self.visual("V:|-[v]-|", views: ["v": searchButton])
    }
}
