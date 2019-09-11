//
//  VisitedSearchTableViewController.swift
//  Krona
//
//  Created by Aditya Gadiyar on 9/3/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class DealsSearchTableViewController: UITableViewController, UISearchControllerDelegate, UISearchBarDelegate
{
    var bp = BusinessPage()
    var dealArray = [Deal]()
    var currDealArray = [Deal]()
        
    override func viewDidLoad()
    {
        super.viewDidLoad()
        dealArray = bp.getDeals()
        currDealArray = dealArray
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return currDealArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DealsSearchTableViewCell") as! DealsSearchTableViewCell
        cell.setAttributes(deal: currDealArray[indexPath.row])
        return cell
    }
    
    // search bar:
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        let searchTerms = searchText.components(separatedBy: " ").filter { $0 != "" }
        currDealArray = dealArray.filter { deal in
            for term in searchTerms {
                if !(deal.name!.lowercased().contains(term.lowercased()) || deal.description!.lowercased().contains(term.lowercased())) {
                    return false
                }
            }
            return true
        }
        tableView.reloadData()
    }
}

/*extension DealsSearchTableViewController: UISearchBarDelegate
{
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int)
    {
        
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar)
    {
        performSegue(withIdentifier: "bizToSearchSegue", sender: nil)
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool
    {
        searchBar.setShowsCancelButton(true, animated: true)
        return true
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool
    {
        searchBar.setShowsCancelButton(false, animated: true)
        return true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar)
    {
        dismiss(animated: true, completion: nil)
    }
}*/
