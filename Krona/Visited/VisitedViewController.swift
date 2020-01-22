//
//  VisitedViewController.swift
//  Krona
//
//  Created by Alek  Kemeny on 7/15/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit
import CoreData

class VisitedViewController: UIViewController {
    //ERROR: Because of weird checkmark problem, only the first 7 favorited restaurants are showing up in the favorites.
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    // Initialize list that contains every business.
    var fullList = [Business]()
    
    // Initialize list that will contain favorites.
    var favoriteList = [Business]()
    
    // Initialize string for segue to business page.
    var showBusiness = "VisitedShowBusiness"
    
    // Declare image types associated with each business.
    var businessIcon: UIImage!
    var dealImage: UIImage!
    var promotionImage: UIImage!
    var rewardImage: UIImage!
    
    override func viewDidLoad() {
        // Setup Visited.
        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Generate a list of favorited businesses.
        loadBusinesses()
        
        // Link Searchbar to Visited.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let searchResults = storyboard.instantiateViewController(withIdentifier: "VisitedSearchTableViewController") as! VisitedSearchTableViewController
        let visitedSearchController = UISearchController(searchResultsController: searchResults)
        visitedSearchController.delegate = searchResults
        visitedSearchController.searchBar.delegate = searchResults
        visitedSearchController.searchBar.placeholder = "Search stores and restaurants"
        
        // Stylize Searchbar.
        self.definesPresentationContext = true
        self.navigationItem.searchController = visitedSearchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.searchController?.searchBar.tintColor = UIColor.white
        
        // Stylize Feed.
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = UIColor(red: 107/255, green: 31/255, blue: 236/255, alpha: 1)
        navigationItem.title = "Favorites"
        
    }
    
    private func loadBusinesses() {
        // Generate a list of favorited businesses.
        
        // Generate a list of all businesses.
        fullList = List.getList()
        
        // Access Core Data and create a reference to the "User" object.
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let context = appDel.persistentContainer.viewContext
        let request: NSFetchRequest<User> = User.fetchRequest()
        request.returnsObjectsAsFaults = false
        
        // Fetch the "User" object.
        var results: [User]
        do {
            try results = context.fetch(request)
        } catch {
            fatalError("Failure to fetch: \(error)")
        }
        
        // Using the full list and the list of favorites stored in Core Data, generate a new list of favorties.
        if results.count > 0 {
            for user in results {
                let indices = user.favList!
                for i in indices {
                    favoriteList.append(fullList[i])
                }
            }
        }
    }
}

extension VisitedViewController: UITableViewDataSource, UITableViewDelegate {
    // Define TableView attributes of Visited.
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // Returns a section for each business in favorites.
        return favoriteList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Returns a single row for each section which contains a business.
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        // Sets the space between each business section.
        return 15
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Generates a customized cell for each business in favorites.
        
        // Generate a cell.
        let cell = tableView.dequeueReusableCell(withIdentifier:  "RestaurantTableViewCell") as! RestaurantTableViewCell
        let biz = favoriteList[indexPath.section]
        // Set attributes based on the properties of each business.
        cell.setAttributes(biz: biz)
       
        // Stylize each cell.
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // Stylize each header so that they appear only as space between each business section.
        
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*
         Associates corresponding business image attributes with every row.
         If tapped, each cell will utilize the VisitedShowBusiness segue to instantiate a unique BusinessTableViewController.
        */
        
        // Associate business attributes with each TableViewCell.
        businessIcon = favoriteList[indexPath.section].icon
        dealImage = favoriteList[indexPath.section].deals[0].image
        promotionImage = favoriteList[indexPath.section].promotions[0].image
        rewardImage = favoriteList[indexPath.section].rewards[0].image
        
        // Perform segue to instantiate a BusinessTableViewController using the previously initialized business attributes.
        self.performSegue(withIdentifier: "VisitedShowBusiness", sender: self)
        
        // Deselect the row so that it does not stay highlighted after segue.
        tableView.deselectRow(at: indexPath, animated: false)
    }
       
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Sets up unique BusinessTableViewController after collectionViewCell is tapped.
        
        if segue.identifier == "VisitedShowBusiness" {
            let detailVC = segue.destination as! BusinessTableViewController
            detailVC.business = businessIcon
            detailVC.deal = dealImage
            detailVC.promotion = promotionImage
            detailVC.reward = rewardImage
           }
       }
}



