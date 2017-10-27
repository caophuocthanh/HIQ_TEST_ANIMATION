//
//  FirstViewController.swift
//  HIQ-Test-CaoPhuocThanh
//
//  Created by Cao Phuoc Thanh on 10/26/17.
//  Copyright © 2017 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

class FirstViewController: ViewController {
    
    fileprivate let collectionView: FirstCollectionView = FirstCollectionView()
    
    fileprivate var firstViewModel: FistCollectionViewModel = {
        let menuViewModels = [MenuViewModel(name: "Documents", image: UIImage(named: "pencil-icon")!, color: UIColor.red),
                              MenuViewModel(name: "Images", image: UIImage(named: "search-icon")!, color: UIColor.orange),
                              MenuViewModel(name: "Videos", image: UIImage(named: "pencil-icon")!, color: UIColor.lightGray),
                              MenuViewModel(name: "System", image: UIImage(named: "setting-icon")!, color: UIColor.purple),
                              MenuViewModel(name: "Contacts", image: UIImage(named: "share-icon")!, color: UIColor.green)]
        let imageURLHeaderString = DummyData.dumpImage
        let firstViewModel = FistCollectionViewModel(imageURLHeaderString: imageURLHeaderString, menuViewModels: menuViewModels)
        return firstViewModel
    }()
    
    override func loadView() {
        super.loadView()
        
        self.collectionView.translatesAutoresizingMaskIntoConstraints = true
        self.collectionView.fistCollectionViewModel = self.firstViewModel
        
        self.view = self.collectionView
        
        self.collectionView.didSelectedAtCell { [weak self] (indexPath) in
            switch indexPath.row {
            case 1:
                guard let `self` = self else { return }
                let vc = ImageViewController()
                let nv = NavigationController(rootViewController: vc)
                self.present(nv, animated: true, completion: nil)
            default: break
            }
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.collectionView.animateTable(withDuration: 1.5)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionView.isHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
}
