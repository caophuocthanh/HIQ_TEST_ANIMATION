//
//  ViewController.swift
//  HIQ-Test-CaoPhuocThanh
//
//  Created by Cao Phuoc Thanh on 10/26/17.
//  Copyright © 2017 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.tintColor = UIColor.darkGray
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        if statusBar.responds(to: #selector(setter: UIView.backgroundColor)) {
            statusBar.backgroundColor = UIColor.white
        }
        (self.navigationController as? NavigationController)?.showDismissButton(self.isShowCloseButton)
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return UIStatusBarAnimation.fade
    }
    
    var isShowCloseButton: Bool = false {
        didSet{
            (self.navigationController as? NavigationController)?.showDismissButton(self.isShowCloseButton)
        }
    }
    
    func close(completion: @escaping NavigationController.HandleClose) {
        (self.navigationController as? NavigationController)?.close(completion: completion)
    }
    
    // MARK: - Layout
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        // resize navigation items
        self.navigationItem.leftBarButtonItem?.customView?.sizeToFit()
        self.navigationItem.rightBarButtonItem?.customView?.sizeToFit()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func didReceiveMemoryWarning() {
        //Log.error("Memory warning...")
    }
    
    deinit {
    }

}
