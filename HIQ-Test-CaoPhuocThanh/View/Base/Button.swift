//
//  Button.swift
//  HIQ-Test-CaoPhuocThanh
//
//  Created by Cao Phuoc Thanh on 10/26/17.
//  Copyright © 2017 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

class Action {
    
    private var _action: () -> ()
    
    required init(_ target: Any, _ action: @escaping () -> ()) {
        self._action = action
        objc_setAssociatedObject(target, String(format: "[%d]", arc4random()), self, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
    
    @objc dynamic func selector() {
        self._action()
    }
    
}

class Button: UIButton {

    typealias HandleButtionTouchUpInside = () -> ()
    @objc private dynamic var handleButtionTouchUpInside: HandleButtionTouchUpInside?
    
    @objc override init(frame: CGRect) {
        super.init(frame: frame)
        self.imageView?.contentMode = .scaleAspectFit
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func tap(_ controlEvents: UIControlEvents, _ closure: @escaping () -> ()) {
        self.removeTarget(nil, action: #selector(Action.selector), for: controlEvents)
        let action = Action(self, closure)
        self.addTarget(action, action: #selector(Action.selector), for: controlEvents)
    }

}
