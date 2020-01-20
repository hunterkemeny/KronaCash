//
//  FeedSearchTableViewController.swift
//  Krona
//
//  Created by Aditya Gadiyar on 9/3/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

//TODO: Add links to business page from searchbar

class FeedSearchTableViewController: UITableViewController, UISearchControllerDelegate, UISearchBarDelegate
{
    var categories = ["Most Popular", "New to Krona", "Food", "Shopping", "Apparel", "Groceries", "Entertainment", "Education", "Accessories", "Finance"]
    var bizArray = [Business]()
    var currBizArray = [Business]()
    var dealArray = [Deal]()
    var currDealArray = [Deal]()
    
    static var typing = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        bizArray = List.getList()
        currBizArray = bizArray
        for biz in bizArray
        {
            for deal in biz.deals
            {
                dealArray.append(deal)
            }
        }
        currDealArray = dealArray
    }
    
    // TODO: Implement suggestion cells when not typing
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool
    {
        FeedSearchTableViewController.typing = true
        return true
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar)
    {
        FeedSearchTableViewController.typing = true
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool
    {
        FeedSearchTableViewController.typing = false
        return true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar)
    {
        FeedSearchTableViewController.typing = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar)
    {
        FeedSearchTableViewController.typing = false
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        if FeedSearchTableViewController.typing { return 2 }
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if FeedSearchTableViewController.typing
        {
            if section == 0 { return currBizArray.count }
            else { return currDealArray.count }
        }
        return categories.count/2 //Showing up twice error solved by dividing by 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if FeedSearchTableViewController.typing
        {
            if indexPath.section == 0
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "FeedSearchBizTableViewCell") as! FeedSearchBizTableViewCell
                cell.setAttributes(biz: currBizArray[indexPath.row])
                return cell
            }
            else
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "FeedSearchDealTableViewCell") as! FeedSearchDealTableViewCell
                cell.setAttributes(deal: currDealArray[indexPath.row])
                return cell
            }
        }
     
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedSearchLabelTableViewCell") as! FeedSearchLabelTableViewCell
        cell.setAttributes(name: categories[indexPath.row])
        return cell
    }
    
    // search bar:
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        let searchTerms = searchText.components(separatedBy: " ").filter { $0 != "" }
        
        currBizArray = bizArray.filter { biz in
            for term in searchTerms {
                if !(biz.name!.lowercased().contains(term.lowercased()))
                { return false }
            }
            return true
        }
        
        currDealArray = dealArray.filter { deal in
            for term in searchTerms {
                if !(deal.name!.lowercased().contains(term.lowercased()) || deal.description!.lowercased().contains(term.lowercased()))
                { return false }
            }
            return true
        }
        
        tableView.reloadData()
    }
}
