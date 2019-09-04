//
//  BusinessPage.swift
//  Krona
//
//  Created by Bilal Kapadya on 8/12/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class BusinessPage: UIViewController, UICollectionViewDelegate,  UICollectionViewDataSource {
    
    let dealsSearchController = UISearchController(searchResultsController: nil)
    
    //COLLECTIONVIEW STUFF
    var dealArray = [Deal(name: "Deal1", description: "This is only a placeholder deal that is being used to test the code as well as constraints. That is why this message is particularly long."), Deal(name: "Deal2", description: "This is only a placeholder deal that is being used to test the code as well as constraints. That is why this message is particularly long."), Deal(name: "Deal3", description: "This is only a placeholder deal that is being used to test the code as well as constraints. That is why this message is particularly long."), Deal(name: "Deal4", description: "This is only a placeholder deal that is being used to test the code as well as constraints. That is why this message is particularly long."), Deal(name: "Deal5", description: "This is only a placeholder deal that is being used to test the code as well as constraints. That is why this message is particularly long.")]
    
   /* var rewardArray = [Reward(name: "Reward1", progress: 30, total: 100, type: .spendGoal), Reward(name: "Reward2", progress: 30, total: 100, type: .spendGoal), Reward(name: "Reward3", progress: 30, total: 100, type: .spendGoal), Reward(name: "Reward4", progress: 30, total: 100, type: .spendGoal), Reward(name: "Reward5", progress: 30, total: 100, type: .spendGoal)]*/
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dealArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DealCell", for: indexPath) as! DealCell
       
        cell.setAttributes(deal: dealArray[indexPath.row])
        
        return cell
    }
    
    @IBOutlet weak var dealsCollectionView: UICollectionView!
    @IBOutlet weak var rewardTableView: UITableView!
    //viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dealsCollectionView.dataSource = self
        dealsCollectionView.delegate = self
        self.dealsSearchController.searchBar.delegate = self
        self.navigationItem.searchController = dealsSearchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.searchController?.searchBar.tintColor = UIColor.white
        /*rewardTableView.dataSource = self
        rewardTableView.delegate = self*/

    }
}

extension BusinessPage: UISearchBarDelegate
{
    
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
