//
//  Payment.swift
//  Krona
//
//  Created by Hunter Kemeny on 8/4/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class Payment {
    var cardIcon: UIImage
    var cardNum: String
    
    init(cardIcon: UIImage, cardNum: String) {
        self.cardIcon = cardIcon
        self.cardNum = cardNum
    }
}
