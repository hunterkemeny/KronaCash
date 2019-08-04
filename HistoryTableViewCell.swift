//
//  HistoryTableViewCell.swift
//  Krona
//
//  Created by Hunter Kemeny on 8/3/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    
    @IBOutlet weak var storeIcon: UIImageView!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var earned: UILabel!
    @IBOutlet weak var reward: UILabel!
    
    func setAttributes(transaction: TransactionHistory){
        storeName.text = transaction.name
        storeIcon.image = transaction.icon
        earned.text = transaction.earned
        reward.text = transaction.points
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
