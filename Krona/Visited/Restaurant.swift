//
//  Restaurant.swift
//  Krona
//
//  Created by Bilal Kapadya on 7/22/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class Restaurant
{
    var name:String
    var icon: UIImage?
    var isFavorite:Bool
    
    init (name:String, icon:UIImage, isFavorite:Bool){
        self.name = name
        self.icon = icon
        self.isFavorite = isFavorite
    }    
}
