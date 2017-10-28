//
//  UIView+Animation+Pop.swift
//  HIQ-Test-CaoPhuocThanh
//
//  Created by Cao Phuoc Thanh on 10/26/17.
//  Copyright © 2017 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

extension UIView {
    
    func pop(_ force: CGFloat = 0.1) {
        let animation = CAKeyframeAnimation(keyPath: "transform.scale")
        animation.values = [0, 0.1*force, -0.1*force, 0.1*force, 0]
        animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.duration = 0.8
        animation.isAdditive = true
        animation.repeatCount = 1
        animation.isRemovedOnCompletion = true
        self.layer.add(animation, forKey: "pop")
    }
    
    func shake() {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [0, 10, -10, 10, -5, 5, -5, 0 ]
        animation.keyTimes = [0, 0.125, 0.25, 0.375, 0.5, 0.625, 0.75, 0.875, 1]
        animation.duration = 0.8
        animation.isAdditive = true
        self.layer.add(animation, forKey: "shake")
    }
    
    func rotate360(duration: CFTimeInterval = 1.5, completionDelegate: AnyObject? = nil) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.fromValue = 0.0
        animation.toValue = CGFloat(.pi * 2.0)
        animation.duration = duration
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        animation.repeatCount = 1
        self.layer.add(animation, forKey: nil)
    }
    
    func zoom(duration: CFTimeInterval = 1.5, force: CGFloat = 0.1) {
        let animation = CAKeyframeAnimation(keyPath: "transform.scale")
        animation.values = [-0.4*force, -0.3*force ,-0.2*force ,-0.1*force, 0]
        animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.duration = 1.5
        animation.isAdditive = true
        animation.repeatCount = 1
        animation.isRemovedOnCompletion = true
        self.layer.add(animation, forKey: "zoom")
    }
    
    func moveImage() {
        let toPoint: CGPoint = CGPoint(x: -self.center.x, y: self.center.y)
        let fromPoint : CGPoint = self.center
        let movement = CABasicAnimation(keyPath: "movement")
        movement.isAdditive = true
        movement.fromValue =  fromPoint
        movement.toValue =  toPoint
        movement.duration = 1.5
        self.layer.add(movement, forKey: "move")
    }
    
    func expandingCircelLayerAnimation(view: View, duration: CFTimeInterval = 1.5) {
        
        let bounds = CGRect(
            x: view.frame.origin.x,
            y: view.frame.origin.y,
            width: 60,
            height: 60)
        
        let rectShape = CAShapeLayer()
        rectShape.bounds = bounds
        rectShape.position = view.center
        rectShape.cornerRadius = 30
        self.layer.addSublayer(rectShape)
        
        rectShape.fillColor = UIColor.blue.withAlphaComponent(0.4).cgColor
        
        let startShape = UIBezierPath(roundedRect: bounds, cornerRadius: 30).cgPath
        let endShape = UIBezierPath(roundedRect: CGRect(
            x: -UIScreen.main.bounds.height,
            y: -UIScreen.main.bounds.height,
            width: UIScreen.main.bounds.height*2.5,
            height: UIScreen.main.bounds.height*2.5), cornerRadius: UIScreen.main.bounds.height).cgPath
        
        rectShape.path = startShape
        let animation = CABasicAnimation(keyPath: "path")
        animation.toValue = endShape
        animation.duration = duration
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        animation.fillMode = kCAFillModeBoth
        animation.isRemovedOnCompletion = false
        rectShape.add(animation, forKey: animation.keyPath)
    }
}
