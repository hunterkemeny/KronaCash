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
    
    init (name:String, icon:UIImage, isFavorite:Bool, offersGroup:Bool)
    {
        self.name = name
        self.icon = icon
        self.isFavorite = isFavorite
        self.offersGroup = offersGroup
    }
}
