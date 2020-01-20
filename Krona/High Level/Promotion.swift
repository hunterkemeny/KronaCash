//
//  Promotion.swift
//  Krona
//
//  Created by Hunter Kemeny on 1/20/20.
//  Copyright © 2020 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class Promotion {
    
    //TYPE1
    var name: String?
    var description: String?
    
    //TYPE2
    var image: UIImage?
    
    //TYPE1
    init(name:String, description:String) {
        self.name = name
        self.description = description
    }
    
    //TYPE2
    init(image: UIImage?) {
        self.image = image
    }
    
    //TYPE3
    init(name: String, description: String, image: UIImage?) {
        self.name = name
        self.description = description
        self.image = image
    }
}

