//
//  PostCollectionViewCell.swift
//  Krona
//
//  Created by Aditya Gadiyar on 8/2/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell
{
    @IBOutlet weak var companyIcon: UIImageView!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var classification: UILabel!
    
    func setAttributes(post: Post)
    {
        companyIcon.image = post.createdBy.iconImage
        companyName.text = post.createdBy.companyName
        postImageView.image = post.image
        distanceLabel.text = "\(post.distance!) mi"
        classification.text = post.classify
    }
    
}
