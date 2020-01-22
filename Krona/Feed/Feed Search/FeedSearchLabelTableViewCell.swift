//
//  FeedSearchLabelTableViewCell.swift
//  Krona
//
//  Created by Aditya Gadiyar on 9/3/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class FeedSearchLabelTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var nameLabel: UILabel!
    
    // MARK: - Methods
    
    func setAttributes(name: String) {
        // Set attributes for each label that appears in the Searchbar.
        
        nameLabel.text = name
    }
}
