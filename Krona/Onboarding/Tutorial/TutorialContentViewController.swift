//
//  TutorialContentViewController.swift
//  Krona
//
//  Created by Aditya Gadiyar on 8/19/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class TutorialContentViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet var headingLabel: UILabel! {
        didSet {
            headingLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet var contentImageView: UIImageView!
    
    // MARK: - Properties
    
    var index = 0
    var heading = ""
    var subheading = ""
    var imageFile = ""

    override func viewDidLoad() {
        // Setup ViewController
        
        super.viewDidLoad()
        
        headingLabel.text = heading
        contentImageView.image = UIImage(named: imageFile)
    }
    
}
