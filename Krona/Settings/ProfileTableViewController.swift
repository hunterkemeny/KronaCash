//
//  ProfileTableViewController.swift
//  Krona
//
//  Created by Hunter Kemeny on 7/29/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ProfileTableViewCell"

class ProfileTableViewController: UITableViewController {


    //MARK: Properties
    
    var userInfoHeader: UserInfoHeader!
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
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
    
    //MARK: Helper Functions
    
    func configureTableView() {
        let frame = CGRect(x: 0, y: 88, width: view.frame.width, height: 100)
        userInfoHeader = UserInfoHeader(frame: frame)
        tableView.tableHeaderView = userInfoHeader
    }
    
    func configureUI() {
        configureTableView()
        
        //TODO: Fix Colors and style
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = UIColor(red: 107/255, green: 31/255, blue: 236/255, alpha: 1)
        navigationItem.title = "Profile"
    }
 /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ProfileTableViewCell

        return cell
    }
*/
}
