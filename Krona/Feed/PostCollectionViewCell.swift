//
//  PostCollectionViewCell.swift
//  Krona
//
//  Created by Aditya Gadiyar on 8/2/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell
{
    @IBOutlet weak var companyIcon: UIImageView!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var classification: UILabel!
    
    func setAttributes(biz: Business)
    {
        companyIcon.image = biz.icon
        companyName.text = biz.name
        distanceLabel.text = "\(biz.distance!) mi"
        var classtxt = ""
        if biz.classification == .sponsored
        {
           classtxt = "Sponsored Content"
        }
        
        else
        {
            classtxt = "For You"
        }
        classification.text = classtxt
        
        postImageView.image = biz.deals[0].image
    }
    
}
