//
//  PostTableViewCell.swift
//  Krona
//
//  Created by Aditya Gadiyar on 8/1/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet weak var postCollectionView: UICollectionView!
    @IBOutlet private weak var collectionLabel: UILabel!
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
        postCollectionView.delegate = dataSourceDelegate
        postCollectionView.dataSource = dataSourceDelegate
        postCollectionView.tag = row
        postCollectionView.reloadData()
    }
    
    // MARK: - Methods
    
    func setAttributes(save: String) {
        // Sets the label for EatIconsTableViewCell.
        
        collectionLabel.text = save
    }
}


