//
//  TransactionHistory.swift
//  Krona
//
//  Created by Hunter Kemeny on 8/3/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class TransactionHistory
{
    var name: String
    var icon: UIImage?
    var earned: String
    var date: String
    var points: String
    
    init (name: String, icon: UIImage, earned: String, date: String, points: String) {
        //TODO: Change so that it is easier to automate
        self.name = name
        self.icon = icon
        self.earned = earned
        self.date = date
        self.points = points
    }
    
    
    
    
}

