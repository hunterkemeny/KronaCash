//
//  FeedSearchDealTableViewCell.swift
//  Krona
//
//  Created by Aditya Gadiyar on 9/10/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class FeedSearchDealTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descripLabel: UILabel!
    
    // MARK: - Methods
    
    func setAttributes(deal: Deal) {
        // Set attributes for each deal that appears in the Searchbar.
        
        nameLabel.text = deal.name
        descripLabel.text = deal.description
    }
    
    func setAttributes(promotion: Promotion) {
        // Set attributes for each promotion that appears in the Searchbar.
        
        nameLabel.text = promotion.name
        descripLabel.text = promotion.description
    }
    
    func setAttributes(reward: Reward) {
        // Set attributes for each reward that appears in the Searchbar.
        
        nameLabel.text = reward.name
        descripLabel.text = reward.description
    }
}
