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
    
    //MARK: Helper Functions
    
    func configureTableView() {
        let frame = CGRect(x: 0, y: 88, width: view.frame.width, height: 100)
        userInfoHeader = UserInfoHeader(frame: frame)
        tableView.tableHeaderView = userInfoHeader
    }
    
    func configureUI() {
        configureTableView()
        
        //TODO: Fix Colors and style
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = UIColor(red: 55/255, green: 120/255, blue: 250/255, alpha: 1)
        navigationItem.title = "Settings"
    }
 /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ProfileTableViewCell

        return cell
    }
*/
}
