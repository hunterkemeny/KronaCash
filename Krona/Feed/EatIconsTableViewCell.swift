//
//  EatIconsTableViewCell.swift
//  Krona
//
//  Created by Aditya Gadiyar on 8/1/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class EatIconsTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var eatIconsCollectionView: UICollectionView!
    @IBOutlet private weak var collectionLabel: UILabel!
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
        eatIconsCollectionView.delegate = dataSourceDelegate
        eatIconsCollectionView.dataSource = dataSourceDelegate
        eatIconsCollectionView.tag = row
        eatIconsCollectionView.reloadData()
    }
    
    // MARK: - Methods
    
    func setAttributes(category: String) {
        // Sets the label for EatIconsTableViewCell.
        
        collectionLabel.text = category
    }
}

