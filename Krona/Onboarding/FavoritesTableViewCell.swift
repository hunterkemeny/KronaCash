//
//  FavoritesTableViewCell.swift
//  Krona
//
//  Created by Aditya Gadiyar on 8/26/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet weak var bizNameLabel: UILabel!
    @IBOutlet weak var bizIconImage: UIImageView!
    
    // MARK: - Methods
    
    func setAttributes(biz: Business) {
        // Set the values and style for each cell the in the FavoritesViewController.
        
        // Set the name and icon for each business. 
        bizNameLabel.text = biz.name
        bizIconImage.image = biz.icon
        
        // Stylize the icon for each business.
        bizIconImage.layer.borderWidth = 0
        bizIconImage.layer.masksToBounds = false
        bizIconImage.layer.cornerRadius = bizIconImage.frame.height/3
        bizIconImage.clipsToBounds = true
    }
}
