//
//  FirstCollectionView.swift
//  HIQ-Test-CaoPhuocThanh
//
//  Created by Cao Phuoc Thanh on 10/26/17.
//  Copyright © 2017 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

class FirstCollectionView: CollectionView {
    
    var fistCollectionViewModel: FistCollectionViewModel! {
        didSet{
            guard (self.fistCollectionViewModel) != nil else { return }
            self.animateTable(withDuration: 1.0)
        }
    }
    
    override func loadView() {
        super.loadView()
        
        self.register(HeaderFirstCollectionViewCell.self, forCellWithReuseIdentifier: HeaderFirstCollectionViewCell.reuseIdentifier())
        self.register(MenuFirstCollectionViewCell.self, forCellWithReuseIdentifier: MenuFirstCollectionViewCell.reuseIdentifier())
        
        self.delegate = self
        self.dataSource = self
        
        self.layout.minimumLineSpacing = 10
        self.layout.minimumInteritemSpacing = 8
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
    }
    
    enum Section: Int {
        case header
        case menus
        static let numberOfSections: Int = 2
    }
    
    typealias HandleDidSelectedAtCell = (IndexPath) -> ()
    fileprivate var _handleDidSelectedAtCell: HandleDidSelectedAtCell?
    func didSelectedAtCell(completion: @escaping HandleDidSelectedAtCell) {
        self._handleDidSelectedAtCell = completion
    }
    
}

extension FirstCollectionView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self._handleDidSelectedAtCell?(indexPath)
    }
    
}

extension FirstCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let section: Section = Section(rawValue: indexPath.section)!
        switch section {
        case .header:
            return CGSize(width: self.bounds.width, height: (self.bounds.height - 80)/2)
        case .menus:
            return CGSize(width: (self.bounds.width - 16)/3, height: self.bounds.width/3)
        }
    }
    
}

extension FirstCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section: Section = Section(rawValue: indexPath.section)!
        switch section {
        case .header:
            let cell: HeaderFirstCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: HeaderFirstCollectionViewCell.reuseIdentifier(), for: indexPath) as! HeaderFirstCollectionViewCell
            if let fistCollectionViewModel = self.fistCollectionViewModel {
                cell.imageURLString = fistCollectionViewModel.imageURLHeaderString
            }
            return cell
        case .menus:
            let cell: MenuFirstCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuFirstCollectionViewCell.reuseIdentifier(), for: indexPath) as! MenuFirstCollectionViewCell
            if let menuViewModel = self.fistCollectionViewModel?.menuViewModels[indexPath.row] {
                cell.image = menuViewModel.image
                cell.imageBackgroudColor = menuViewModel.color
                cell.labelString = menuViewModel.name
            }
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let section: Section = Section(rawValue: section)!
        switch section {
        case .header:
            return 1
        case .menus:
            return self.fistCollectionViewModel?.menuViewModels.count ?? 0
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Section.numberOfSections
    }
    
}
