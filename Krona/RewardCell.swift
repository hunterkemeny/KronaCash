//
//  RewardCell.swift
//  Krona
//
//  Created by Bilal Kapadya on 8/12/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class RewardCell: UITableViewCell {

    @IBOutlet weak var rewardName: UILabel!
    @IBOutlet weak var rewardProgress: UIProgressView!
    @IBOutlet weak var percentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
