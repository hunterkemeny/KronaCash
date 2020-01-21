//
//  VisitedSearchTableViewController.swift
//  Krona
//
//  Created by Aditya Gadiyar on 9/10/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class VisitedSearchTableViewController: UITableViewController, UISearchControllerDelegate, UISearchBarDelegate
{
    //ERROR: On the first download, there tends to be three of every store, but after closing and reopening the app, it goes back to the correct amount
    var bizArray = [Business]()
    var currBizArray = [Business]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        bizArray = List.getList()
        currBizArray = bizArray
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return currBizArray.count/2 //Solution to two of every store problem is currently to divide by 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VisitedSearchTableViewCell") as! VisitedSearchTableViewCell
        cell.setAttributes(biz: currBizArray[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        businessIcon = currBizArray[indexPath.row].icon
        dealImage = currBizArray[indexPath.row].deals[0].image
        promotionImage = currBizArray[indexPath.row].promotions[0].image
        rewardImage = currBizArray[indexPath.row].rewards[0].image
        self.performSegue(withIdentifier: "VisitedSearchBusinessSegue", sender: self)
        tableView.deselectRow(at: indexPath, animated: false)
    }
       
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "VisitedSearchBusinessSegue" {
            let detailVC = segue.destination as! BusinessTableViewController
            detailVC.business = businessIcon
            detailVC.deal = dealImage
            detailVC.promotion = promotionImage
            detailVC.reward = rewardImage
           }
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
        tableView.reloadData()
    }
}
