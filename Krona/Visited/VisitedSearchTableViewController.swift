//
//  VisitedSearchTableViewController.swift
//  Krona
//
//  Created by Aditya Gadiyar on 9/10/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class VisitedSearchTableViewController: UITableViewController, UISearchControllerDelegate, UISearchBarDelegate {
    //ERROR: On the first download, there tends to be three of every store, but after closing and reopening the app, it goes back to the correct amount.
    
    // MARK: - Properties
    
    // Initialize list to store all businesses.
    var bizArray = [Business]()
    
    // Initialize list to store businesses that currently appear in the search.
    var currBizArray = [Business]()
    
    // Declare image types for each business that appears in the search.
    var businessIcon: UIImage!
    var dealImage: UIImage!
    var promotionImage: UIImage!
    var rewardImage: UIImage!
    
    override func viewDidLoad() {
        // Setup Searchbar view controller.
        
        super.viewDidLoad()
        
        // Generate list of all businesses.
        bizArray = List.getList()
        currBizArray = bizArray
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - Setup TableView
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // Return one section per search.
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows that corresponds to the number of items that match the search criteria.
        return currBizArray.count/2 //Solution to ERROR is currently to divide by 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Instantiate a TableViewCell for each business and set its attributes to correspond to the respective business.
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VisitedSearchTableViewCell") as! VisitedSearchTableViewCell
        cell.setAttributes(biz: currBizArray[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*
         Associates corresponding business image attributes with every row.
         If tapped, each cell will utilize the VisitedShowBusiness segue to instantiate a unique BusinessTableViewController.
        */
        
        // Associate business attributes with each TableViewCell.
        businessIcon = currBizArray[indexPath.row].icon
        dealImage = currBizArray[indexPath.row].deals[0].image
        promotionImage = currBizArray[indexPath.row].promotions[0].image
        rewardImage = currBizArray[indexPath.row].rewards[0].image
        
        // Perform segue to instantiate a BusinessTableViewController using the previously initialized business attributes.
        self.performSegue(withIdentifier: "VisitedSearchBusinessSegue", sender: self)
        
        // Deselect the row so that it does not stay highlighted after segue.
        tableView.deselectRow(at: indexPath, animated: false)
    }
       
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Sets up unique BusinessTableViewController after collectionViewCell is tapped.
        
        if segue.identifier == "VisitedSearchBusinessSegue" {
            let detailVC = segue.destination as! BusinessTableViewController
            detailVC.business = businessIcon
            detailVC.deal = dealImage
            detailVC.promotion = promotionImage
            detailVC.reward = rewardImage
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Sets values for currBizArray based on which businesses in bizArray correspond to the search.
        
        let searchTerms = searchText.components(separatedBy: " ").filter { $0 != "" }
        currBizArray = bizArray.filter { biz in
            for term in searchTerms {
                if !(biz.name!.lowercased().contains(term.lowercased())) {
                    return false
                }
            }
            return true
        }
        tableView.reloadData()
    }
}
