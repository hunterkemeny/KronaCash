//
//  BusinessTableViewController.swift
//  Krona
//
//  Created by Hunter Kemeny on 1/16/20.
//  Copyright © 2020 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class BusinessTableViewController: UITableViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var businessImage: UIImageView!
    @IBOutlet weak var dealsImage: UIImageView!
    @IBOutlet weak var promotionsImage: UIImageView!
    @IBOutlet weak var rewardsImage: UIImageView!
    
    // MARK: - Properties
    
    var business: UIImage!
    var deal: UIImage!
    var promotion: UIImage!
    var reward: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sets each image in viewController to the image given by the respective property.
        businessImage.image = business
        dealsImage.image = deal
        promotionsImage.image = promotion
        rewardsImage.image = reward
    }

    

}
