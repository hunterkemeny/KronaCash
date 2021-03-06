//
//  VisitedSearchTableViewCell.swift
//  Krona
//
//  Created by Aditya Gadiyar on 9/3/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class DealsSearchTableViewCell: UITableViewCell
{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descripLabel: UILabel!
    
    func setAttributes(deal: Deal)
    {
        nameLabel.text = deal.name
        descripLabel.text = deal.description
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
}
