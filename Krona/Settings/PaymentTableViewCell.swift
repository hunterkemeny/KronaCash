//
//  PaymentTableViewCell.swift
//  Krona
//
//  Created by Hunter Kemeny on 8/4/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class PaymentTableViewCell: UITableViewCell {

    
    func setAttributes(payment: Payment){
        visitedLabel.text = restaurant.name
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
