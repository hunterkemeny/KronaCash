//
//  Deal.swift
//  Krona
//
//  Created by Bilal Kapadya on 8/4/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class Deal
{
    //TYPE1
    var name: String?
    var description: String?
    
    //TYPE2
    var image: UIImage?
    
    
    //TYPE1
    init(name:String, description:String)
    {
        self.name = name
        self.description = description
    }
    
    //TYPE2
    init(image: UIImage?){
        self.image = image
    }
    
    //TYPE3
    init(name: String, description: String, image: UIImage?)
    {
        self.name = name
        self.description = description
        self.image = image
    }
}
