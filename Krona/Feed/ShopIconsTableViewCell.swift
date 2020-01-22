//
//  ShopIconsTableViewCell.swift
//  Krona
//
//  Created by Aditya Gadiyar on 8/2/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class ShopIconsTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var shopIconsCollectionView: UICollectionView!
    @IBOutlet private weak var collectionLabel: UILabel!
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
        shopIconsCollectionView.delegate = dataSourceDelegate
        shopIconsCollectionView.dataSource = dataSourceDelegate
        shopIconsCollectionView.tag = row
        shopIconsCollectionView.reloadData()
    }
    
    // MARK: - Methods
    
    func setAttributes(category: String) {
        // Sets the label for ShopIconsTableViewCell.
        
        collectionLabel.text = category
    }
}
