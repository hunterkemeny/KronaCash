//
//  FeedSearchTableViewController.swift
//  Krona
//
//  Created by Aditya Gadiyar on 9/3/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class FeedSearchTableViewController: UITableViewController, UISearchControllerDelegate, UISearchBarDelegate {
    // ERROR: Can't get searchbar links to segue to the correct business page.
    // TODO: Implement suggestion cells with not typing.
    
    // MARK: - Properties
    
    // Categories for types of businesses.
    var categories = ["Most Popular", "New to Krona", "Food", "Shopping", "Apparel", "Groceries", "Entertainment", "Education", "Accessories", "Finance"]
    
    // Initialize lists that correspond to each business/deal/promotion/reward.
    var bizArray = [Business]()
    var dealArray = [Deal]()
    var rewardArray = [Reward]()
    var promotionArray = [Promotion]()
    
    // Initialize lists that correspond to each business/deal/promotion/reward appearing in search.
    var currBizArray = [Business]()
    var currDealArray = [Deal]()
    var currRewardArray = [Reward]()
    var currPromotionArray = [Promotion]()
    
    // Initialize lists that correspond to each business associated with a deal/promotion/reward.
    var bizDealArray = [Business]()
    var bizRewardArray = [Business]()
    var bizPromotionArray = [Business]()
    
    // Declare image types for each business that appears in the search.
    var businessIcon: UIImage!
    var dealImage: UIImage!
    var promotionImage: UIImage!
    var rewardImage: UIImage!
    
    // User has not started typing.
    static var typing = false
    
    override func viewDidLoad() {
        // Setup Searchbar view controller.
        
        super.viewDidLoad()
        
        // Generate a list of all businesses.
        bizArray = List.getList()
        currBizArray = bizArray
        
        // Setup lists for each type of advertisement.
        for biz in bizArray {
            for deal in biz.deals {
                dealArray.append(deal)
            }
            for reward in biz.rewards {
                rewardArray.append(reward)
            }
            for promotion in biz.promotions {
                promotionArray.append(promotion)
            }
        }
        
        // create a copy of each advertisement list to modify based on search criteria.
        currDealArray = dealArray
        currRewardArray = rewardArray
        currPromotionArray = promotionArray
    }
    
    // MARK: - Typing LifeCycle Functions
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        FeedSearchTableViewController.typing = true
        return true
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        FeedSearchTableViewController.typing = true
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        FeedSearchTableViewController.typing = false
        return true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        FeedSearchTableViewController.typing = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        FeedSearchTableViewController.typing = false
    }
    
    // MARK: - Setup TableView
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // Return four sections when typing that correspond to business/deal/promotion/reward types.
        
        if FeedSearchTableViewController.typing { return 4 }
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows per section based on the type of section (business/deal/promotion/reward).
        
        if FeedSearchTableViewController.typing {
            if section == 0 {
                return currBizArray.count
            } else if section == 1 {
                return currDealArray.count
            } else if section == 2 {
                return currPromotionArray.count
            } else {
                return currRewardArray.count
            }
        }
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*
        Instantiate a TableViewCell for each business/deal/promotion/reward and set its attributes to correspond to the respective type.
        */
        
        if FeedSearchTableViewController.typing {
            if indexPath.section == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "FeedSearchBizTableViewCell") as! FeedSearchBizTableViewCell
                cell.setAttributes(biz: currBizArray[indexPath.row])
                return cell
            } else if indexPath.section == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "FeedSearchDealTableViewCell") as! FeedSearchDealTableViewCell
                cell.setAttributes(deal: currDealArray[indexPath.row])
                return cell
            } else if indexPath.section == 2 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "FeedSearchDealTableViewCell") as! FeedSearchDealTableViewCell
                cell.setAttributes(promotion: currPromotionArray[indexPath.row])
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "FeedSearchDealTableViewCell") as! FeedSearchDealTableViewCell
                cell.setAttributes(reward: currRewardArray[indexPath.row])
                return cell
            }
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedSearchLabelTableViewCell") as! FeedSearchLabelTableViewCell
        cell.setAttributes(name: categories[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*
         Associates corresponding business image attributes with every row.
         If tapped, each cell will utilize the FeedShowBusiness segue to instantiate a unique BusinessTableViewController.
        */
        
        // Determine if section corresponds to business/deal/promotion/reward.
        if indexPath.section == 0 {
            // Associate business attributes with each TableViewCell.
            businessIcon = currBizArray[indexPath.row].icon
            dealImage = currBizArray[indexPath.row].deals[0].image
            promotionImage = currBizArray[indexPath.row].promotions[0].image
            rewardImage = currBizArray[indexPath.row].rewards[0].image
            
            // Perform segue to instantiate a BusinessTableViewController using the previously initialized business attributes.
            self.performSegue(withIdentifier: "FeedShowBusiness", sender: self)
            
            // Deselect the row so that it does not stay highlighted after segue.
            tableView.deselectRow(at: indexPath, animated: false)
        } else if indexPath.section == 1 {
            businessIcon = bizDealArray[indexPath.row].icon
            dealImage = bizDealArray[indexPath.row].deals[0].image
            promotionImage = bizDealArray[indexPath.row].promotions[0].image
            rewardImage = bizDealArray[indexPath.row].rewards[0].image
            self.performSegue(withIdentifier: "FeedShowBusiness", sender: self)
            tableView.deselectRow(at: indexPath, animated: false)
        } else if indexPath.section == 2 {
            businessIcon = bizPromotionArray[indexPath.row].icon
            dealImage = bizPromotionArray[indexPath.row].deals[0].image
            promotionImage = bizPromotionArray[indexPath.row].promotions[0].image
            rewardImage = bizPromotionArray[indexPath.row].rewards[0].image
            self.performSegue(withIdentifier: "FeedShowBusiness", sender: self)
            tableView.deselectRow(at: indexPath, animated: false)
        } else {
            businessIcon = bizRewardArray[indexPath.row].icon
            dealImage = bizRewardArray[indexPath.row].deals[0].image
            promotionImage = bizRewardArray[indexPath.row].promotions[0].image
            rewardImage = bizRewardArray[indexPath.row].rewards[0].image
            self.performSegue(withIdentifier: "FeedShowBusiness", sender: self)
            tableView.deselectRow(at: indexPath, animated: false)
        }
    }
       
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Sets up unique BusinessTableViewController after collectionViewCell is tapped.
        
        if segue.identifier == "FeedShowBusiness" {
            let detailVC = segue.destination as! BusinessTableViewController
            detailVC.business = businessIcon
            detailVC.deal = dealImage
            detailVC.promotion = promotionImage
            detailVC.reward = rewardImage
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Sets values for each currArray based on which business/deal/reward/promotion corresponds to the search.
        
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
        
        
        currPromotionArray = promotionArray.filter { promotion in
            for term in searchTerms {
                if !(promotion.name!.lowercased().contains(term.lowercased()) || promotion.description!.lowercased().contains(term.lowercased()))
                { return false }
            }
            return true
        }
        
        currRewardArray = rewardArray.filter { reward in
            for term in searchTerms {
                if !(reward.name!.lowercased().contains(term.lowercased()) || reward.description!.lowercased().contains(term.lowercased()))
                { return false }
            }
            return true
        }
        tableView.reloadData()
    }
}
