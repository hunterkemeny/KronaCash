//
//  SettingsLabelTableViewController.swift
//  Krona
//
//  Created by Alek  Kemeny on 7/18/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//
/*
import UIKit

private let reuseIdentifier = "ProfileTableViewCell"

class SettingsLabelTableViewController: UITableViewController {

    //MARK: Properties
    
    var userInfoHeader: UserInfoHeader!
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        //Load labels
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
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return SettingsSection.allCases.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let section = SettingsSection(rawValue: section) else {
            return 0
        }
        
        
        switch section {
            case .History: return HistoryOptions.allCases.count
            case .SocialMedia: return SocialMediaOptions.allCases.count
            case .Account: return AccountOptions.allCases.count
            case .Administrative: return AdministrativeOptions.allCases.count
            case .Logout: return LogoutOptions.allCases.count
        }
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        //TODO: fix  color
        view.backgroundColor = UIColor(red: 55/255, green: 12/255, blue: 250/255, alpha: 1)
        
        let title = UILabel()
        title.font = UIFont.boldSystemFont(ofSize: 16)
        title.text = SettingsSection(rawValue: section)?.description
        title.textColor = .white
        view.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        title.leftAnchor.constraint(equalTo: view.leftAnchor, constraint: 16).isActive = true
        
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

/*        let cellIdentifier = "ProfileTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ProfileTableViewCell  else {
            fatalError("The dequeued cell is not an instance of ProfileTableViewCell.")
        }
 */
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ProfileTableViewCell
    
        guard let section = SettingsSection(rawValue: indexPath.section) else {
            return UITableViewCell()
            
        }
 
        switch section {
        case .History:
            let history = HistoryOptions(rawValue: indexPath.row)
            cell.textLabel?.text = history?.description
        case .SocialMedia:
            let social = SocialMediaOptions(rawValue: indexPath.row)
            cell.textLabel?.text = social?.description
        case .Account:
            let account = AccountOptions(rawValue: indexPath.row)
            cell.textLabel?.text = account?.description
        case .Administrative:
            let administrative = AdministrativeOptions(rawValue: indexPath.row)
            cell.textLabel?.text = administrative?.description
        case .Logout:
            let logout = LogoutOptions(rawValue: indexPath.row)
            cell.textLabel?.text = logout?.description
        }

        return cell
    }

    
    //MARK: Private Methods

    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}
 
 */
