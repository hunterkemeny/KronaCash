//
//  EatIconsCollectionViewCell.swift
//  Krona
//
//  Created by Aditya Gadiyar on 8/2/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class EatIconsCollectionViewCell: UICollectionViewCell
{
    @IBOutlet weak var companyIcon: UIImageView!
    
    func setAttributes(post: Post)
    {
        companyIcon.image = post.createdBy.iconImage
    }
    
}
