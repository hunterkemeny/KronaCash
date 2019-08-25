//
//  ShopIconsCollectionViewCell.swift
//  Krona
//
//  Created by Aditya Gadiyar on 8/2/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class ShopIconsCollectionViewCell: UICollectionViewCell
{
    @IBOutlet weak var companyIcon: UIImageView!
    
    func setAttributes(biz: Business)
    {
        companyIcon.image = biz.icon
    }
}
