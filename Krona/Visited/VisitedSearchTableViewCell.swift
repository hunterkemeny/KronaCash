//
//  VisitedSearchTableViewCell.swift
//  Krona
//
//  Created by Aditya Gadiyar on 9/10/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class VisitedSearchTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var iconImg: UIImageView!
    
    // MARK: - Methods
    
    func setAttributes(biz: Business) {
        // Set attributes for each business that appears in the Searchbar.
        
        nameLabel.text = biz.name
        iconImg.image = biz.icon
    }
}
