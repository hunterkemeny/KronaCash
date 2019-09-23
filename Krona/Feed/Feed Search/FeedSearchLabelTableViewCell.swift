//
//  FeedSearchLabelTableViewCell.swift
//  Krona
//
//  Created by Aditya Gadiyar on 9/3/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class FeedSearchLabelTableViewCell: UITableViewCell
{
    @IBOutlet private weak var nameLabel: UILabel! /*{
        didSet {
            print("nameLabel: \(nameLabel)")
        }
    }*/
    
    func setAttributes(name: String)
    {
        nameLabel.text = name
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
}
