//
//  ImageViewController.swift
//  HIQ-Test-CaoPhuocThanh
//
//  Created by Cao Phuoc Thanh on 10/26/17.
//  Copyright © 2017 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

class ImageViewController: ViewController {
    
    fileprivate let collectionView: ImageViewCollectionView = ImageViewCollectionView()
    fileprivate let headerImageView: HeaderImageView = HeaderImageView()
    
    fileprivate var sectionImageViewModel: [SectionImageViewModel] = {
        let sectionImageViewModel1 = SectionImageViewModel(
            sectionName: "MY IMPIRARION",
            images: [
                ImageModel(imageURLString: "https://s-media-cache-ak0.pinimg.com/236x/14/b6/e2/14b6e2791e19809613e3ad67f636dc24.jpg",
                           height: 400,
                           width: 700,
                           toneColor: UIColor.red),
                ImageModel(imageURLString: "https://s-media-cache-ak0.pinimg.com/474x/90/d0/3f/90d03fc5ab177f876db613703c6b97e3.jpg",
                           height: 400,
                           width: 700,
                           toneColor: UIColor.red),
                ImageModel(imageURLString: "https://s-media-cache-ak0.pinimg.com/474x/93/89/17/938917a98b1aeb2e32daf6a1f8b5f3b4.jpg",
                           height: 700,
                           width: 400,
                           toneColor: UIColor.red),
                ImageModel(imageURLString: "https://s-media-cache-ak0.pinimg.com/474x/ff/e8/5f/ffe85feb88087d62571eef2cc2d9cfa9.jpg",
                           height: 400,
                           width: 700,
                           toneColor: UIColor.red),
                ImageModel(imageURLString: "https://s-media-cache-ak0.pinimg.com/474x/16/c9/37/16c9371d6188227a4a7a8c6f5df86816.jpg",
                           height: 700,
                           width: 400,
                           toneColor: UIColor.red)])
        let sectionImageViewModel2 = SectionImageViewModel(
            sectionName: "COLORS",
            images: [ImageModel(imageURLString: "https://s-media-cache-ak0.pinimg.com/474x/4d/d6/b8/4dd6b87b7fba7448edc64656223482a9.jpg",
                                height: 400,
                                width: 700,
                                toneColor: UIColor.red),
                     ImageModel(imageURLString: "https://s-media-cache-ak0.pinimg.com/564x/f6/6c/a4/f66ca4288f5fce57992bd13db742c8d2.jpg",
                                height: 400,
                                width: 700,
                                toneColor: UIColor.red),
                     ImageModel(imageURLString: "https://s-media-cache-ak0.pinimg.com/564x/ee/47/be/ee47be7b84b4002ebf500e77d03380ab.jpg",
                                height: 700,
                                width: 400,
                                toneColor: UIColor.red),
                     ImageModel(imageURLString: "https://s-media-cache-ak0.pinimg.com/236x/3c/8e/8f/3c8e8f8e545df7b67436f0f593f20311.jpg",
                                height: 400,
                                width: 700,
                                toneColor: UIColor.red),
                     ImageModel(imageURLString: "https://s-media-cache-ak0.pinimg.com/474x/f6/ed/9e/f6ed9e479ee7eb73ff11639bfe4d6d60.jpg",
                                height: 700,
                                width: 400,
                                toneColor: UIColor.red)
            ])
        return [sectionImageViewModel1, sectionImageViewModel2]
    }()
    
    override func loadView() {
        super.loadView()
        self.addConstraints()
        
        self.collectionView.sectionImageViewModel = self.sectionImageViewModel
        
        self.collectionView.didSelectedAtCell { [weak self] (indexPath) in
            guard let `self` = self else { return }
            let vc = MenuImageModalViewController()
            vc.modalPresentationStyle = .overCurrentContext
            
            vc.didSelectedAtButton(completion: { [weak self]  (menuImage) in
                guard let `self` = self else { return }
                switch menuImage {
                case .close:
                    print("CLOSE")
                case .delete:
                    print("DELETE")
                    self.collectionView.sectionImageViewModel[indexPath.section].images.remove(at: indexPath.row)
                    self.collectionView.deleteItemAnimation(indexPath: indexPath)
                case .share:
                    print("SHARE")
                case .edit:
                    print("EDIT")
                case .location:
                    print("LOCATION")
                case .write:
                    print("WIRITE")
                }
            })
            
            if let cell = self.collectionView.cellForItem(at: indexPath) {
                vc.sourceView = cell
                //vc.sourceRect = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y, width: 0, height: 0)
                if let popoverController = vc.popoverPresentationController {
                    popoverController.sourceView = cell
                    popoverController.sourceRect = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y, width: 0, height: 0)
                    popoverController.permittedArrowDirections = []
                }
            }
            self.present(vc, animated: false, completion: nil)
        }
    }
    
    func addConstraints() {
        self.view.addSubviews(self.headerImageView, self.collectionView)
        self.view.visual("H:|-0-[v]-0-|", views: ["v": headerImageView])
        self.view.visual("H:|-0-[v]-0-|", views: ["v": collectionView])
        self.view.visual("V:|-64-[v]-0-[v1]-0-|", views: ["v": headerImageView, "v1": collectionView])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.collectionView.animateTable(withDuration: 2.0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.isShowCloseButton = true
        self.collectionView.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
