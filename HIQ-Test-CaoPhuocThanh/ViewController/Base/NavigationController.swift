//
//  NavigationViewController.swift
//  HIQ-Test-CaoPhuocThanh
//
//  Created by Cao Phuoc Thanh on 10/26/17.
//  Copyright © 2017 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14), NSAttributedStringKey.foregroundColor: UIColor.darkGray]
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.backIndicatorImage = UIImage(named: "back-icon")!
        self.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "back-icon")!
        self.navigationBar.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(0, -60), for:UIBarMetrics.default)
    }

    override var preferredStatusBarStyle : UIStatusBarStyle {
        if self.topViewController != nil {
            return self.topViewController!.preferredStatusBarStyle
        }
        return .default
    }
    
    override func setNavigationBarHidden(_ hidden: Bool, animated: Bool) {
        super.setNavigationBarHidden(hidden, animated: animated)
        self.interactivePopGestureRecognizer?.delegate = self
    }
    
    typealias HandleClose = () -> ()
    fileprivate var _handleClose: HandleClose?
    
    func close(completion: @escaping HandleClose) {
        self._handleClose = completion
    }
    
    func showDismissButton(_ show: Bool) {
        if show {
            self.viewControllers.first?.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back-icon"), style: .done, target: self, action: #selector(didTouchCloseButton))
            self.viewControllers.first?.navigationItem.leftBarButtonItem?.tintColor = UIColor.darkGray
        } else {
            self.viewControllers.first?.navigationItem.leftBarButtonItem = nil
        }
    }
    
    @objc private func didTouchCloseButton() {
        self._handleClose?()
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension NavigationController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if self.viewControllers.count > 1 {
            return true
        }
        return false
    }
}
