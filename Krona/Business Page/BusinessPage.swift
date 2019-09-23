//
//  BusinessPage.swift
//  Krona
//
//  Created by Bilal Kapadya on 8/12/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class BusinessPage: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var dealsCollectionView: UICollectionView!
    @IBOutlet weak var rewardTableView: UITableView!
    
    // TODO: DEALS EVENTUALLY NEED TO BE PULLED FROM LIST CLASS WHEN BUTTON PROBLEM SOLVED
    
    var dealArray = [Deal(name: "Free", description: "This is only a placeholder deal that is beingz used to test the code as well as constraints. That is why this message is particularly long."), Deal(name: "Buy 1, Get 1 Free", description: "This is only a placeholder deal that is being used to test the code as well as constraints. That is why this message is particularly long."), Deal(name: "10% off", description: "This is only a placeholder deal that is being used to test the code as well as constraints. That is why this message is particularly long."), Deal(name: "First Meal Free", description: "This is only a placeholder deal that is being used to test the code as well as constraints. That is why this message is particularly long."), Deal(name: "Appetizer - FREE", description: "This is only a placeholder deal that is being used to test the code as well as constraints. That is why this message is particularly long.")]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let searchResults = storyboard.instantiateViewController(withIdentifier: "DealsSearchTableViewController") as! DealsSearchTableViewController
        let dealsSearchController = UISearchController(searchResultsController: searchResults)
        dealsSearchController.delegate = searchResults
        dealsSearchController.searchBar.delegate = searchResults
        dealsSearchController.searchBar.placeholder = "Search deals and offers"

        
        self.definesPresentationContext = true
        self.navigationItem.searchController = dealsSearchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.searchController?.searchBar.tintColor = UIColor.white
        
        
        dealsCollectionView.dataSource = self
        dealsCollectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dealArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DealCell", for: indexPath) as! DealCell
       
        cell.setAttributes(deal: dealArray[indexPath.row])
        
        return cell
    }
    
    public func getDeals() -> [Deal]
    {
        return dealArray
    }
    
    /* var rewardArray = [Reward(name: "Reward1", progress: 30, total: 100, type: .spendGoal), Reward(name: "Reward2", progress: 30, total: 100, type: .spendGoal), Reward(name: "Reward3", progress: 30, total: 100, type: .spendGoal), Reward(name: "Reward4", progress: 30, total: 100, type: .spendGoal), Reward(name: "Reward5", progress: 30, total: 100, type: .spendGoal)]*/
}

/*//TABLEVIEW STUFF
extension BusinessPage: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rewardArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = rewardTableView.dequeueReusableCell(withIdentifier: "RewardCell")  as! RewardCell
        
        cell.rewardName.text = rewardArray[indexPath.row].name
        
        return cell
    }
    
    func numberOfSections(in rewardTableView: UITableView) -> Int {
        return 1
    }
}*/
