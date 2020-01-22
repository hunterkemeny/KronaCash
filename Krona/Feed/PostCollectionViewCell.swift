//
//  PostCollectionViewCell.swift
//  Krona
//
//  Created by Aditya Gadiyar on 8/2/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var companyIcon: UIImageView!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var classification: UILabel!
    
    // MARK: - Methods
    
    func setAttributes(biz: Business, saveIndex: Int) {
        // Sets attributes for each PostCollectionViewCell
        
        // Customizes cell for each business.
        companyIcon.image = biz.icon
        companyName.text = biz.name
        distanceLabel.text = "\(biz.distance!) mi"
        
        // Cuztomizes cell based on whether the advertisement was paid or generated from user data.
        var classtxt = ""
        if biz.classification == .sponsored {
           classtxt = "Sponsored Content"
        } else {
            classtxt = "For You"
        }
        classification.text = classtxt
        
        // Customizes cell based on the type of advertisement. 
        if saveIndex == 0 {
            postImageView.image = biz.deals[0].image
        } else if saveIndex == 1 {
            postImageView.image = biz.promotions[0].image
        } else {
            postImageView.image = biz.rewards[0].image
        }
    }
}
