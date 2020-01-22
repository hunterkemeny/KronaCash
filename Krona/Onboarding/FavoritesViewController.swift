//
//  FavoritesViewController.swift
//  Krona
//
//  Created by Aditya Gadiyar on 8/26/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit
import CoreData

class FavoritesViewController: UIViewController {
    
    // MARK: IBOutlet
    @IBOutlet weak var favoritesTableView: UITableView!
    
    // MARK: - Properties
    
    // List of all business partners and their properties.
    var list = [Business]()
    // List of all businesses that the user chooses as favorites.
    var favBiz = [Int]()
    
    // MARK: - INIT
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialize Business objects for all businesses; initialize current Deal objects, Promotion objects, and Reward objects associated with each Business object.
        List.loadBusinesses()
        // Get the list of Business objects.
        list = List.getList()
        
        favoritesTableView.dataSource = self
        favoritesTableView.delegate = self
    }
    
    // MARK: - Helper Functions
    
    func goToSegue(sender: UIBarButtonItem) {
        // Segue from FavoritesViewController to FeedViewController.
        
        performSegue(withIdentifier: "favoritesToMainSegue", sender: self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // Save the favorites to Core Data after the user chooses.
        
        super.viewWillDisappear(true)
        
        // Load favorited businesses into favBiz list.
        for i in 0..<list.count {
            let biz = list[i]
            if biz.isFavorite == true {
                favBiz.append(i)
            }
        }
        
        // Access Core Data.
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let context = appDel.persistentContainer.viewContext
        
        // Request User object from Core Data.
        let request: NSFetchRequest<User> = User.fetchRequest()
        request.returnsObjectsAsFaults = false
        
        // Fetch user object.
        var results: [User]
        do {
            try results = context.fetch(request)
        } catch {
            fatalError("Failure to fetch: \(error)")
        }
        
        if results.count > 0 {
            for user in results {
                // Make favList in Core Data equal to the list of favorited businesses.
                user.favList = favBiz
            }
        }
        
        // Save favorites list to Core Data
        do {
            try context.save()
        } catch {
            fatalError("Failure to save context: \(error)")
        }
    }
    
}

// MARK: - TableView Setup

extension FavoritesViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        // Create a new section in the table view for each business.
        return list.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return only one business per section.
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        // Space between business sections.
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Instantiate a FavoritesTableViewCell for each row in the table view.
        let cell = favoritesTableView.dequeueReusableCell(withIdentifier: "FavoritesTableViewCell") as! FavoritesTableViewCell
        // Each cell corresponds to a business in list.
        let biz = list[indexPath.section]
        // Customize the cell using the information from each Business object.
        cell.setAttributes(biz: biz)
        
        // Stylize the cells.
        cell.layer.cornerRadius = 20
        let shadowPath2 = CGRect(x:0, y:0, width:374, height: 100)
        let rounded = UIBezierPath(roundedRect: shadowPath2, cornerRadius: 30)
        cell.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: CGFloat(1.0), height: CGFloat(10.0))
        cell.layer.shadowOpacity = 0.3
        cell.layer.shadowPath = rounded.cgPath
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // If the user selects the business, put a checkmark in the cell.
        // ERROR: Selects multiple stores with one tap.
        
        // If there is already a checkmark on the cell, uncheck it, otherwise, check the cell and add the business to the favorite's list.
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
            let biz = list[indexPath.section]
            biz.isFavorite = false
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
            let biz = list[indexPath.section]
            biz.isFavorite = true
        }
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // Make the headers clear so that each cell looks like it stands alone.
        
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
}
