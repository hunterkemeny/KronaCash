//
//  FeedSearchBizTableViewCell.swift
//  Krona
//
//  Created by Aditya Gadiyar on 9/3/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class FeedSearchBizTableViewCell: UITableViewCell
{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var iconImg: UIImageView!
    
    func setAttributes(biz: Business)
    {
        nameLabel.text = biz.name
        iconImg.image = biz.icon
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
}
