//
//  DealCell.swift
//  Krona
//
//  Created by Bilal Kapadya on 8/12/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class DealCell: UICollectionViewCell
{
    
    @IBOutlet weak var dealName: UILabel!
    
    @IBOutlet weak var dealDescription: UILabel!
    
    func setAttributes(deal: Deal){
        dealName.text = deal.name
        dealDescription.text = deal.description
        dealDescription.sizeToFit()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
