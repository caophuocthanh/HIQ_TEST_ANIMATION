//
//  MenuFirstCollectionViewCell.swift
//  HIQ-Test-CaoPhuocThanh
//
//  Created by Cao Phuoc Thanh on 10/26/17.
//  Copyright © 2017 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

class MenuFirstCollectionViewCell: CollectionViewCell {
    
    var image: UIImage! {
        didSet{
            guard let `image` = self.image else { return }
            self.imageView.image = image
        }
    }
    
    var imageBackgroudColor: UIColor! {
        didSet{
            guard let `imageBackgroudColor` = self.imageBackgroudColor else { return }
            self.contentImageView.backgroundColor = imageBackgroudColor.withAlphaComponent(0.5)
        }
    }
    
    var labelString: String! {
        didSet{
            guard let `labelString` = self.labelString else { return }
            self.labelLabel.text = labelString
        }
    }
    
    fileprivate let imageView: ImageView = ImageView()
    fileprivate let labelLabel: Label = Label()
    fileprivate let contentImageView: View = View()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
        self.labelLabel.text = nil
    }
    
    override func loadView() {
        super.loadView()
        
        // Config image
        self.contentImageView.layer.masksToBounds = true
        self.contentImageView.layer.cornerRadius = self.bounds.height/4
        self.contentImageView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.6)
        
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.backgroundColor = UIColor.clear
        
        // Config label
        self.labelLabel.textAlignment = .center
        self.labelLabel.font = UIFont.boldSystemFont(ofSize: 14)
        self.labelLabel.textColor = UIColor.darkGray
        
        // Add subviews
        self.contentView.addSubviews(self.contentImageView, self.labelLabel)
        self.contentImageView.addSubview(self.imageView)
        
    }
    
    override func addContraints() {
        super.addContraints()
        
        // Image
        self.contentImageView.visualSquare(.width)
        self.contentImageView.visualCenterX(self.contentView)
        
        self.contentImageView.visual("H:|-18-[v]-18-|", views: ["v": self.imageView])
        self.contentImageView.visual("V:|-18-[v]-18-|", views: ["v": self.imageView])
        
        // Label
        self.contentView.visual("H:|-[v]-|", views: ["v": self.labelLabel])
        self.contentView.visual("V:|-[v(h)]-(>=0)-[v1]-|",
                                metrics: ["h": self.bounds.width/2],
                                views: ["v": self.contentImageView, "v1": self.labelLabel])
        
    }
}
