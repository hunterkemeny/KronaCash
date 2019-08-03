//
//  PostTableViewCell.swift
//  Krona
//
//  Created by Aditya Gadiyar on 8/1/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell
{

    @IBOutlet weak var postCollectionView: UICollectionView!
    @IBOutlet private weak var collectionLabel: UILabel!
    
    func setAttributes(post: Post)
    {
        collectionLabel.text = post.category
    }
}

extension PostTableViewCell
{
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int)
    {
        postCollectionView.delegate = dataSourceDelegate
        postCollectionView.dataSource = dataSourceDelegate
        postCollectionView.tag = row
        postCollectionView.reloadData()
    }
}


