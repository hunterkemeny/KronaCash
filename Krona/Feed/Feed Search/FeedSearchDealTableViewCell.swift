//
//  FeedSearchDealTableViewCell.swift
//  Krona
//
//  Created by Aditya Gadiyar on 9/10/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class FeedSearchDealTableViewCell: UITableViewCell
{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descripLabel: UILabel!
    
    func setAttributes(deal: Deal) {
        nameLabel.text = deal.name
        descripLabel.text = deal.description
    }
    
    func setAttributes(promotion: Promotion) {
        nameLabel.text = promotion.name
        descripLabel.text = promotion.description
    }
    
    func setAttributes(reward: Reward) {
        nameLabel.text = reward.name
        descripLabel.text = reward.description
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
}
