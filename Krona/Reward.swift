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
    
    var progress: Double?
    var total: Double?
    var type: rewardType?
    
    init()
    {
        
    }
}

enum rewardType
{
    case survey
    case spendGoal
    case visitGoal
    case signUp
}
