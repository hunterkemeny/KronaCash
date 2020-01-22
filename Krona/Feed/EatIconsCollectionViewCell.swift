//
//  EatIconsCollectionViewCell.swift
//  Krona
//
//  Created by Aditya Gadiyar on 8/2/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class EatIconsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var companyIcon: UIImageView!
    
    // MARK: - Methods
    
    func setAttributes(biz: Business) {
        // Sets the company icon for each collectoinViewCell.
        
        companyIcon.image = biz.icon
    }
    
}
