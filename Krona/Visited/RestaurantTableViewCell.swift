//
//  RestaurantTableViewCell.swift
//  Krona
//
//  Created by Bilal Kapadya on 7/21/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var visitedLabel: UILabel!
    @IBOutlet weak var restaurantPicture: UIImageView!
    
    // MARK: - Methods
    
    func setAttributes(biz: Business){
        // Set attributes for each business section with the business name and icon.
        visitedLabel.text = biz.name
        restaurantPicture.image = biz.icon
        
        // Stylize the icon for each business.
        restaurantPicture.layer.borderWidth = 0
        restaurantPicture.layer.masksToBounds = false
        restaurantPicture.layer.cornerRadius = restaurantPicture.frame.height/3
        restaurantPicture.clipsToBounds = true
    }
}
