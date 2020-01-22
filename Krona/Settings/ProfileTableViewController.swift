//
//  ProfileTableViewController.swift
//  Krona
//
//  Created by Hunter Kemeny on 7/29/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

//private let reuseIdentifier = "ProfileTableViewCell"

class ProfileTableViewController: UITableViewController {
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: IBAction

    @IBAction func didTapFacebook(_ sender: Any) {
        UIApplication.shared.openURL(URL(string: "http://www.facebook.com/officialkrona/")!)
    }
    
    @IBAction func didTapInstagram(_ sender: Any) {
        UIApplication.shared.openURL(URL(string: "https://www.instagram.com/officialkrona/")!)
    }
    
    @IBAction func didTapTwitter(_ sender: Any) {
        UIApplication.shared.openURL(URL(string: "https://twitter.com/kronaofficial")!)
    }
    
    @IBAction func didTapDonate(_ sender: Any) {
        UIApplication.shared.openURL(URL(string: "https://www.paypal.com/donate/?token=a2t0dPo1_bBqJoO4SYm56YI1bwWn4JW93uTB3liO8B43QJZsbY4mx4vZdvjY6yq_C_EZM0&fromUL=true&country.x=US&locale.x=en_US")!)
    }
}
