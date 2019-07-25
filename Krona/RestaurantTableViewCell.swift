//
//  RestaurantTableViewCell.swift
//  Krona
//
//  Created by Bilal Kapadya on 7/21/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
   
    //MARK: Properties

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var restaurantPicture: UIImageView!
    
    func setAttributes(restaurant:Restaurant){
        nameLabel.text = restaurant.name
        restaurantPicture.image = restaurant.icon
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
