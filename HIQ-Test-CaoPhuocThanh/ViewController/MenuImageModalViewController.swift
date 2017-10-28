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
    
    var sourceRect: CGRect = CGRect(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.width/2, width: 120, height: 120)
    
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
        
        var x = sourceRect.origin.x
        var y = sourceRect.origin.y
        
        if x + 170 > UIScreen.main.bounds.width {
            x = UIScreen.main.bounds.width -  (170 + 36)
        } else if x <= 170 {
            x = x + 36
        }
        
        if (y + 170) > UIScreen.main.bounds.height {
            y = UIScreen.main.bounds.height -  (170 + 36)
        } else if y <= 170 {
            y = y + 36
        }
        
        self.view.visual("H:|-(x)-[v]", metrics: ["x": x] ,views: ["v": self.circelMenuView])
        self.view.visual("V:|-(y)-[v]", metrics: ["y": y] ,views: ["v": self.circelMenuView])
        
        self.circelMenuView.isHidden = true
        self.view.isUserInteractionEnabled = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.circelMenuView.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.125) {
            UIView.animate(withDuration: 5.0, delay: 0.125, options: [.repeat, .curveLinear] , animations: {
                self.circelMenuView.isHidden = false
                self.menuImageModalView.expandingCircelLayerAnimation(view: self.circelMenuView, duration: 1.5)
                self.circelMenuView.zoom(duration: 1.0, force: 2)
                self.circelMenuView.rotate360()
            })
        }
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
