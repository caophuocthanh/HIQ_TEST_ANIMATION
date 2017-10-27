//
//  MenuImagePopperViewController.swift
//  HIQ-Test-CaoPhuocThanh
//
//  Created by Cao Phuoc Thanh on 10/26/17.
//  Copyright © 2017 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

class MenuImageModalViewController: UIViewController {
    
    fileprivate let circelMenuView = CircelMenuView()
    fileprivate let menuImageModalView = MenuImageModalView()
    
    enum MenuImage: Int {
        case close = 0
        case delete
        case location
        case write
        case share
        case edit
    }
    
    override func loadView() {
        super.loadView()
        
        self.view.addSubviews(menuImageModalView, circelMenuView)
        
        self.menuImageModalView.visualInside(self.view, edgeInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        
        self.circelMenuView.visualCenter(self.view)
        self.circelMenuView.isHidden = true
        self.view.isUserInteractionEnabled = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.circelMenuView.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.125) {
            UIView.animate(withDuration: 5.0, delay: 0.125, options: [.repeat, .curveLinear] , animations: {
                self.circelMenuView.isHidden = false
                self.menuImageModalView.expandingCircelLayerAnimation()
                self.circelMenuView.zoom(duration: 1.5, force: 2)
                self.circelMenuView.rotate360()
            })
        }
    }
    
    private func expandingCircelLayerAnimation(view: UIView) {
        
        let bounds = CGRect(x: 0, y: 0, width: 60, height: 60)
        let rectShape = CAShapeLayer()
        rectShape.bounds = bounds
        rectShape.position = CGPoint(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2)
        rectShape.cornerRadius = bounds.width / 2
        view.layer.addSublayer(rectShape)
        
        rectShape.fillColor = UIColor.blue.withAlphaComponent(0.4).cgColor
        
        let startShape = UIBezierPath(roundedRect: bounds, cornerRadius: 30).cgPath
        let endShape = UIBezierPath(roundedRect: CGRect(x: -450, y: -450, width: 1000, height: 1000), cornerRadius: 500).cgPath
        
        rectShape.path = startShape
        let animation = CABasicAnimation(keyPath: "path")
        animation.toValue = endShape
        animation.duration = 1.5
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        animation.fillMode = kCAFillModeBoth
        animation.isRemovedOnCompletion = false
        rectShape.add(animation, forKey: animation.keyPath)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as? UIView {
            if statusBar.responds(to: #selector(setter: UIView.backgroundColor)) {
                statusBar.backgroundColor = UIColor.clear
            }
        }
    }
    
    func didSelectedAtButton(completion: @escaping (MenuImage) -> ()) {
        
        self.circelMenuView.didSelectedAtCloseButton {
            self.dismiss(animated: false, completion: { 
                completion(MenuImage.close)
            })
        }
        
        self.circelMenuView.didSelectedAtShareButton { [weak self] in
            guard let `self` = self else { return }
            self.dismiss(animated: false, completion: {
                completion(MenuImage.close)
            })
        }
        
        self.circelMenuView.didSelectedAtEditButton {[weak self] in
            guard let `self` = self else { return }
            self.dismiss(animated: false, completion: {
                completion(MenuImage.edit)
            })
        }
        
        self.circelMenuView.didSelectedAtLocationButton {[weak self] in
            guard let `self` = self else { return }
            self.dismiss(animated: false, completion: {
                completion(MenuImage.location)
            })
        }
        
        self.circelMenuView.didSelectedAtDeleteButton {[weak self] in
            guard let `self` = self else { return }
            self.dismiss(animated: false, completion: {
                completion(MenuImage.delete)
            })
        }
        
        self.circelMenuView.didSelectedAtWriteButton {[weak self] in
            guard let `self` = self else { return }
            self.dismiss(animated: false, completion: {
                completion(MenuImage.write)
            })
        }

    }
    
}
