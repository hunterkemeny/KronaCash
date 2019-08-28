//
//  FavoritesTableViewCell.swift
//  Krona
//
//  Created by Aditya Gadiyar on 8/26/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell
{
    @IBOutlet weak var bizNameLabel: UILabel!
    @IBOutlet weak var bizIconImage: UIImageView!
    
    func setAttributes(biz: Business)
    {
        bizNameLabel.text = biz.name
        bizIconImage.image = biz.icon
        
        //Image View setup
        bizIconImage.layer.borderWidth = 0
        bizIconImage.layer.masksToBounds = false
        bizIconImage.layer.cornerRadius = bizIconImage.frame.height/3
        bizIconImage.clipsToBounds = true
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

}
