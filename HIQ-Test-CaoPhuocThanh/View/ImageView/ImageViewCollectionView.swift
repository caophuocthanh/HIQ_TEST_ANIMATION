//
//  ImageViewCollectionView.swift
//  HIQ-Test-CaoPhuocThanh
//
//  Created by Cao Phuoc Thanh on 10/26/17.
//  Copyright © 2017 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

class ImageViewCollectionView: CollectionView {
    
    var sectionImageViewModel: [SectionImageViewModel] = []
    
    override func loadView() {
        super.loadView()
        
        self.register(ImageViewCollectionViewCell.self, forCellWithReuseIdentifier: ImageViewCollectionViewCell.reuseIdentifier())
        self.register(ImageViewCollectionHeaderViewCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: ImageViewCollectionHeaderViewCell.reuseIdentifier())
        
        self.delegate = self
        self.dataSource = self
        
        self.layout.minimumLineSpacing = 0
        self.layout.minimumInteritemSpacing = 0
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
    }
    
    typealias HandleDidSelectedAtCell = (IndexPath) -> ()
    fileprivate var _handleDidSelectedAtCell: HandleDidSelectedAtCell?
    func didSelectedAtCell(completion: @escaping HandleDidSelectedAtCell) {
        self._handleDidSelectedAtCell = completion
    }
    
}

extension ImageViewCollectionView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.cellForItem(at: indexPath)?.pop(0.5)
        self._handleDidSelectedAtCell?(indexPath)
    }
    
}

extension ImageViewCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.row {
        case 0, 1:
            return CGSize(width: self.bounds.width/2, height: self.bounds.width/3)
        case 3:
            return CGSize(width: (self.bounds.width - 4)/2, height: self.bounds.width/3)
        case 2 ,4:
            return CGSize(width: (self.bounds.width - 4)/4, height: self.bounds.width/3)
        case 6, 7, 8:
            return CGSize(width: self.bounds.width/2, height: self.bounds.width/3)
        default:
            return CGSize(width: self.bounds.width/2, height: self.bounds.width/3)
        }
    }
    
}

extension ImageViewCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ImageViewCollectionHeaderViewCell.reuseIdentifier(), for: indexPath) as! ImageViewCollectionHeaderViewCell
        cell.titleString = self.sectionImageViewModel[indexPath.section].sectionName
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.bounds.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ImageViewCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageViewCollectionViewCell.reuseIdentifier(), for: indexPath) as! ImageViewCollectionViewCell
        cell.imageURLString = self.sectionImageViewModel[indexPath.section].images[indexPath.row].imageURLString
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.sectionImageViewModel[section].images.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.sectionImageViewModel.count
    }
    
}
