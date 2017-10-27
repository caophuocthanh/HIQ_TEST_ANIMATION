//
//  ImageViewCollectionViewCell.swift
//  HIQ-Test-CaoPhuocThanh
//
//  Created by Cao Phuoc Thanh on 10/26/17.
//  Copyright © 2017 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

class ImageViewCollectionViewCell: CollectionViewCell {
    
    var imageURLString: String! {
        didSet{
            guard let imageURLString = self.imageURLString else { return }
            self.imageView.loadImage(imageURLString) { (success) in
                self.imageView.backgroundColor = UIColor.lightGray
            }
        }
    }
    
    let imageView: ImageView = ImageView()
    fileprivate var rightContrainstImage: NSLayoutConstraint!
    fileprivate var leftContrainstImage: NSLayoutConstraint!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
    }
    
    override func loadView() {
        super.loadView()
        
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.layer.masksToBounds = true
        self.imageView.layer.cornerRadius = 4
        self.imageView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.6)
        self.contentView.addSubview(self.imageView)
        self.contentView.layer.masksToBounds = true
    }
    
    override func addContraints() {
        super.addContraints()
        
        self.contentView.visual("H:|-4-[v]", views: ["v": self.imageView])
        
        let left = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-4-[v]",
            options: [],
            metrics: nil,
            views: ["v": self.imageView])
        self.leftContrainstImage = left[0]
        self.contentView.addConstraints(left)
        
        let right = NSLayoutConstraint.constraints(
            withVisualFormat: "H:[v]-4-|",
            options: [],
            metrics: nil,
            views: ["v": self.imageView])
        self.rightContrainstImage = right[0]
        self.contentView.addConstraints(right)
        
        self.contentView.visual("V:|-4-[v]-4-|", views: ["v": self.imageView])
    }
    
    func deleteAnimation(completion: @escaping (Bool) -> ()) {
        UIView.animate(withDuration: 2,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0.2,
                       options: [],
                       animations: {
                        self.imageView.transform = CGAffineTransform(translationX: -self.contentView.frame.width, y: 0)
        }, completion: completion)
        
    }
}
