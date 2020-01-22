//
//  ViewController.swift
//  Krona
//
//  Created by Alek Kemeny on 7/15/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit
import CoreData

class FeedViewController: UIViewController {
    //ERROR 1: When you download the app, there is sometimes two of every store. In the search bar, there are two/three of every store on the first download, then when the app is closed and reopened there are the correct amount
    //ERROR 2: the last collection view is cut off by the icons at the bottom
    
    
    var list = [Business]()
    var eatList = [Business]()
    var shopList = [Business]()
    
    var showBusiness = "ShowBusiness"
    
    var businessIcon: UIImage!
    var dealImage: UIImage!
    var promotionImage: UIImage!
    var rewardImage: UIImage!
    
    let feedSearchController = UISearchController(searchResultsController: nil)
    
    @IBOutlet weak var feedTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        List.loadBusinesses()
        eatList = List.getEatList()
        shopList = List.getShopList()
        list = List.getList()
        feedTableView.dataSource = self
        feedTableView.delegate = self
        
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = UIColor(red: 107/255, green: 31/255, blue: 236/255, alpha: 1)
        feedSearchController.searchResultsController?.view.isHidden = false
        navigationItem.title = "Feed"

        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let searchResults = storyboard.instantiateViewController(withIdentifier: "FeedSearchTableViewController") as! FeedSearchTableViewController
        let feedSearchController = UISearchController(searchResultsController: searchResults)
        feedSearchController.delegate = searchResults
        feedSearchController.searchBar.delegate = searchResults
        
        self.navigationItem.searchController = feedSearchController
        feedSearchController.searchBar.placeholder = "What are you looking for?"
        
        self.definesPresentationContext = true
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.searchController?.searchBar.tintColor = UIColor.white
    }
}

extension FeedViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = feedTableView.dequeueReusableCell(withIdentifier: "EatIconsTableViewCell", for: indexPath) as! EatIconsTableViewCell
            cell.setAttributes(category: "Places to Eat")
            return cell
        } else if indexPath.row == 1 {
            let cell = feedTableView.dequeueReusableCell(withIdentifier: "ShopIconsTableViewCell", for: indexPath) as! ShopIconsTableViewCell
            cell.setAttributes(category: "Places to Shop")
            return cell
        } else if indexPath.row == 2 {
            let cell = feedTableView.dequeueReusableCell(withIdentifier: "PostTableViewCell") as! PostTableViewCell
            cell.setAttributes(save: "Deals")
            return cell
        } else if indexPath.row == 3 {
            let cell = feedTableView.dequeueReusableCell(withIdentifier: "PostTableViewCell") as! PostTableViewCell
            cell.setAttributes(save: "Promotions")
            return cell
        } else {
            let cell = feedTableView.dequeueReusableCell(withIdentifier: "PostTableViewCell") as! PostTableViewCell
            cell.setAttributes(save: "Rewards")
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if let cell = cell as? EatIconsTableViewCell
            {
                cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
            }
        } else if indexPath.row == 1 {
            if let cell = cell as? ShopIconsTableViewCell
            {
                cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
            }
        } else {
            if let cell = cell as? PostTableViewCell {
                cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
            }
        }
    }
}



extension FeedViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return eatList.count
        } else if collectionView.tag == 1 {
            return shopList.count
        } else {
            return list.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EatIconsCollectionViewCell", for: indexPath) as! EatIconsCollectionViewCell
            cell.setAttributes(biz: eatList[indexPath.row])
            return cell
        } else if collectionView.tag == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopIconsCollectionViewCell", for: indexPath) as! ShopIconsCollectionViewCell
            cell.setAttributes(biz: shopList[indexPath.row])
            return cell
        } else if collectionView.tag == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCollectionViewCell", for: indexPath) as! PostCollectionViewCell
            cell.setAttributes(biz: list[indexPath.row], saveIndex: 0)
            return cell
        } else if collectionView.tag == 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCollectionViewCell", for: indexPath) as! PostCollectionViewCell
            cell.setAttributes(biz: list[indexPath.row], saveIndex: 1)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCollectionViewCell", for: indexPath) as! PostCollectionViewCell
            cell.setAttributes(biz: list[indexPath.row], saveIndex: 2)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 0 {
            businessIcon = eatList[indexPath.row].icon
            dealImage = eatList[indexPath.row].deals[0].image
            promotionImage = eatList[indexPath.row].promotions[0].image
            rewardImage = eatList[indexPath.row].rewards[0].image
            performSegue(withIdentifier: showBusiness, sender: nil)
        } else if collectionView.tag == 1 {
            businessIcon = shopList[indexPath.row].icon
            dealImage = shopList[indexPath.row].deals[0].image
            promotionImage = shopList[indexPath.row].promotions[0].image
            rewardImage = shopList[indexPath.row].rewards[0].image
            performSegue(withIdentifier: showBusiness, sender: nil)
        } else {
            businessIcon = list[indexPath.row].icon
            dealImage = list[indexPath.row].deals[0].image
            promotionImage = list[indexPath.row].promotions[0].image
            rewardImage = list[indexPath.row].rewards[0].image
            performSegue(withIdentifier: showBusiness, sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == showBusiness {
            let detailVC = segue.destination as! BusinessTableViewController
            detailVC.business = businessIcon
            detailVC.deal = dealImage
            detailVC.promotion = promotionImage
            detailVC.reward = rewardImage
        }
    }
}


