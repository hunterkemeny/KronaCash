//
//  EatIconsTableViewCell.swift
//  Krona
//
//  Created by Aditya Gadiyar on 8/1/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class EatIconsTableViewCell: UITableViewCell
{
    @IBOutlet private weak var eatIconsCollectionView: UICollectionView!
    @IBOutlet private weak var collectionLabel: UILabel!
    
    func setAttributes(category: String)
    {
        collectionLabel.text = category
    }
}

extension EatIconsTableViewCell
{
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int)
    {
        eatIconsCollectionView.delegate = dataSourceDelegate
        eatIconsCollectionView.dataSource = dataSourceDelegate
        eatIconsCollectionView.tag = row
        eatIconsCollectionView.reloadData()
    }
}

