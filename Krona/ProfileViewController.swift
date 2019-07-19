//
//  SettingsViewController.swift
//  Krona
//
//  Created by Alek  Kemeny on 7/15/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    
    @IBOutlet weak var profileTableView: UITableView!
    
    let profileArray = ["Profile + Membership Status", "Linked Cards", "History", "Settings", "Membership", "Social","Support", "TOS/Privacy"]
    
//    func parts(labels: [String]) -> String {
 //       for title in labels {
            
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        profileTableView.dataSource = self
        profileTableView.delegate = self
        
    }
    
    // MARK - TABLEVIEW DELEGATE & DATASORUCE
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        cell.textLabel!.text = profileArray[indexPath.row]

        return cell
    }
    

    
}
