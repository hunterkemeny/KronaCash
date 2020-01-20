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
    var description: String?
    var image: UIImage?
    
    init(name:String, description: String, image: UIImage)
    {
        self.name = name
        self.description = description
        self.image = image
    }
}
