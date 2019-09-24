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
    var bizArray = [Business]()
    var currBizArray = [Business]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        bizArray = List.getList()
        currBizArray = bizArray
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return currBizArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VisitedSearchTableViewCell") as! VisitedSearchTableViewCell
        cell.setAttributes(biz: currBizArray[indexPath.row])
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
        tableView.reloadData()
    }
}