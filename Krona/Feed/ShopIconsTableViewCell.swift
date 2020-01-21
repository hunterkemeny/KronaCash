//
//  ShopIconsTableViewCell.swift
//  Krona
//
//  Created by Aditya Gadiyar on 8/2/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class ShopIconsTableViewCell: UITableViewCell
{
    @IBOutlet private weak var shopIconsCollectionView: UICollectionView!
    @IBOutlet private weak var collectionLabel: UILabel!
    
    func setAttributes(category: String)
    {
        collectionLabel.text = category
    }
}

extension ShopIconsTableViewCell
{
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int)
    {
        shopIconsCollectionView.delegate = dataSourceDelegate
        shopIconsCollectionView.dataSource = dataSourceDelegate
        shopIconsCollectionView.tag = row
        shopIconsCollectionView.reloadData()
    }
}
