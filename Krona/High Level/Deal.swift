//
//  Deal.swift
//  Krona
//
//  Created by Bilal Kapadya on 8/4/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class Deal {
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
