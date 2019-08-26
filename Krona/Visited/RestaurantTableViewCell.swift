//
//  RestaurantTableViewCell.swift
//  Krona
//
//  Created by Bilal Kapadya on 7/21/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    @IBOutlet weak var visitedLabel: UILabel!
    @IBOutlet weak var restaurantPicture: UIImageView!
    
    func setAttributes(biz: Business){
        visitedLabel.text = biz.name
        restaurantPicture.image = biz.icon
        
        //Image View setup
        restaurantPicture.layer.borderWidth = 0
        restaurantPicture.layer.masksToBounds = false
        restaurantPicture.layer.cornerRadius = restaurantPicture.frame.height/3
        restaurantPicture.clipsToBounds = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
