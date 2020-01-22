//
//  Business.swift
//  Krona
//
//  Created by Bilal Kapadya on 8/4/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class Business {
    
    // MARK: - Properties
    
    var name: String?
    var icon: UIImage?
    var distance: Double?
    var category: String?
    var classification: Classification?
    var isFavorite: Bool?

    // Declare lists of objects associated with a Business object.
    var deals = [Deal]()
    var rewards = [Reward]()
    var promotions = [Promotion]()
    
    // MARK: - INIT
    init (name: String, icon: UIImage, distance: Double, category: String, classification: Classification) {
        self.name = name
        self.icon = icon
        self.distance = distance
        self.category = category
        self.classification = classification
        self.isFavorite = false // changed from true
    }
    
    // MARK: - Methods
    
    func addDeal(deal: Deal) {
        deals.append(deal)
    }
    
    func addReward(reward: Reward) {
        rewards.append(reward)
    }
    
    func addPromotion(promotion: Promotion) {
        promotions.append(promotion)
    }
    
}

enum Classification {
    case sponsored
    case suggested
}
