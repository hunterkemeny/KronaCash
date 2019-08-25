//
//  Business.swift
//  Krona
//
//  Created by Bilal Kapadya on 8/4/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class Business
{
    var name: String?
    var icon: UIImage?
    var isFavorite: Bool?
    var offersGroup: Bool?
    var deals = [Deal]()
    var rewards = [Reward]()
    var distance: Double?
    var classification: Classification?
    var category: String?
    
    init (name:String, icon:UIImage, distance: Double, category:String, classification: Classification)
    {
        self.name = name
        self.icon = icon
        self.distance = distance
        self.category = category
        self.classification = classification
        self.isFavorite = true
    }
    
    func addDeal(deal: Deal)
    {
        deals.append(deal)
    }
    
    func addReward(reward:Reward)
    {
        rewards.append(reward)
    }
}

enum Classification{
    case sponsored
    case suggested
}
