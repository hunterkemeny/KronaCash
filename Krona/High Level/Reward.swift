//
//  Reward.swift
//  Krona
//
//  Created by Bilal Kapadya on 8/4/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class Reward
{
    var name: String?
    var progress: Double?
    var total: Double?
    var type: rewardType?
    var URL: String?
    
    init(name:String, progress:Double, total:Double, type:rewardType)
    {
        self.name = name
        self.progress = progress
        self.total = total
        self.type = type
    }
}

enum rewardType
{
    case survey
    case spendGoal
    case visitGoal
    case signUp
}
