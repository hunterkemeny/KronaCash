//
//  Promotion.swift
//  Krona
//
//  Created by Hunter Kemeny on 1/20/20.
//  Copyright © 2020 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class Promotion {
    
    // MARK: - Properties
    
    var name: String?
    var description: String?
    var image: UIImage?

    // MARK: - INIT
    
    init(name: String, description: String, image: UIImage?) {
        self.name = name
        self.description = description
        self.image = image
    }
}

