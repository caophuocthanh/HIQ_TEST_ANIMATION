//
//  CircelMenuView.swift
//  HIQ-Test-CaoPhuocThanh
//
//  Created by Cao Phuoc Thanh on 10/27/17.
//  Copyright © 2017 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

class CircelMenuView: View {
    
    fileprivate let centerCircleView: View = View()
    fileprivate let closeButton: Button = Button()
    
    fileprivate let deleteButton: Button = Button()
    fileprivate let editButton: Button = Button()
    fileprivate let shareButton: Button = Button()
    fileprivate let keepButton: Button = Button()
    fileprivate let writeButton: Button = Button()
    
    
    override func loadView() {
        super.loadView()
        self.backgroundColor = UIColor.white.withAlphaComponent(0.6)
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowRadius = 1
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        self.addSubview(self.centerCircleView)
        self.centerCircleView.backgroundColor = UIColor.white.withAlphaComponent(0.6)
        self.centerCircleView.layer.cornerRadius = 30
        
        self.centerCircleView.addSubview(self.closeButton)
        self.closeButton.backgroundColor = UIColor.white.withAlphaComponent(0.6)
        self.closeButton.layer.cornerRadius = 20
        self.closeButton.setImage(UIImage(named: "close-dark"), for: .normal)
        
        self.addSubviews(self.deleteButton,
                         self.editButton,
                         self.shareButton,
                         self.keepButton,
                         self.writeButton)
        
        self.closeButton.isUserInteractionEnabled = true
        self.closeButton.backgroundColor = UIColor.white.withAlphaComponent(0.6)
        self.closeButton.layer.cornerRadius = 24
        self.closeButton.setImage(UIImage(named: "close-dark"), for: .normal)
        
        self.deleteButton.backgroundColor = UIColor.white
        self.deleteButton.layer.cornerRadius = 24
        self.deleteButton.setImage(UIImage(named: "trash-icon"), for: .normal)
        
        self.editButton.backgroundColor = UIColor.white
        self.editButton.layer.cornerRadius = 24
        self.editButton.setImage(UIImage(named: "setting-icon"), for: .normal)
        
        self.keepButton.backgroundColor = UIColor.white
        self.keepButton.layer.cornerRadius = 24
        self.keepButton.setImage(UIImage(named: "location-icon"), for: .normal)
        
        self.writeButton.backgroundColor = UIColor.white
        self.writeButton.layer.cornerRadius = 24
        self.writeButton.setImage(UIImage(named: "pencil-icon"), for: .normal)
        
        self.shareButton.backgroundColor = UIColor.white
        self.shareButton.layer.cornerRadius = 24
        self.shareButton.setImage(UIImage(named: "share-icon"), for: .normal)
    }
    
    override func addContraints() {
        super.addContraints()
        self.visualSquare(.width)
        self.centerCircleView.visualCenter(self)
        self.centerCircleView.visualSquare(.width, constant: 60)
        self.closeButton.visualCenter(self)
        self.closeButton.visualSquare(.width, constant: 40)
        self.visualSquare(.width, constant: 170)
        self.layer.cornerRadius = 170/2
        
        self.visual("H:|-(-22)-[v]", views: ["v": editButton])
        self.visual("V:|-(30)-[v]" ,views: ["v": editButton])
        self.editButton.visualSquare(.width, constant: 48)
        
        self.visual("H:|-(60)-[v]", views: ["v": deleteButton])
        self.visual("V:|-(-24)-[v]" ,views: ["v": deleteButton])
        self.deleteButton.visualSquare(.width, constant: 48)
        
        self.visual("H:|-(8)-[v]", views: ["v": keepButton])
        self.visual("V:[v]-(-2)-|" ,views: ["v": keepButton])
        self.keepButton.visualSquare(.width, constant: 48)
        
        self.visual("H:[v]-(-22)-|", views: ["v": shareButton])
        self.visual("V:|-(30)-[v]" ,views: ["v": shareButton])
        self.shareButton.visualSquare(.width, constant: 48)
        
        self.visual("H:[v]-(8)-|", views: ["v": writeButton])
        self.visual("V:[v]-(-2)-|" ,views: ["v": writeButton])
        self.writeButton.visualSquare(.width, constant: 48)
    }
    
    func didSelectedAtCloseButton(completion: @escaping () -> ()) {
        self.closeButton.tap(.touchUpInside, completion)
    }
    
    func didSelectedAtEditButton(completion: @escaping () -> ()) {
        self.editButton.tap(.touchUpInside, completion)
    }
    
    func didSelectedAtShareButton(completion: @escaping () -> ()) {
        self.shareButton.tap(.touchUpInside, completion)
    }
    
    func didSelectedAtLocationButton(completion: @escaping () -> ()) {
       self.keepButton.tap(.touchUpInside, completion)
    }
    
    func didSelectedAtWriteButton(completion: @escaping () -> ()) {
        self.writeButton.tap(.touchUpInside, completion)
    }
    
    func didSelectedAtDeleteButton(completion: @escaping () -> ()) {
        self.deleteButton.tap(.touchUpInside, completion)
    }
    
}
