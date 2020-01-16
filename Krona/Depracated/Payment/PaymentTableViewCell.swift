//
//  PaymentTableViewCell.swift
//  Krona
//
//  Created by Hunter Kemeny on 8/4/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class PaymentTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var cardNumber: UILabel!
    
    func setAttributes(payment: Payment){
        cardNumber.text = payment.cardNum
        cardImage.image = payment.cardIcon
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
