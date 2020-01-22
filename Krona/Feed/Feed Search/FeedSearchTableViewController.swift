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
    var bizDealArray = [Business]()
    var rewardArray = [Reward]()
    var currRewardArray = [Reward]()
    var bizRewardArray = [Business]()
    var promotionArray = [Promotion]()
    var currPromotionArray = [Promotion]()
    var bizPromotionArray = [Business]()
    var businessIcon: UIImage!
    var dealImage: UIImage!
    var promotionImage: UIImage!
    var rewardImage: UIImage!
    
    static var typing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bizArray = List.getList()
        currBizArray = bizArray
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
        currDealArray = dealArray
        currRewardArray = rewardArray
        currPromotionArray = promotionArray
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
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if FeedSearchTableViewController.typing { return 4 }
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
        if indexPath.section == 0 {
            businessIcon = currBizArray[indexPath.row].icon
            dealImage = currBizArray[indexPath.row].deals[0].image
            promotionImage = currBizArray[indexPath.row].promotions[0].image
            rewardImage = currBizArray[indexPath.row].rewards[0].image
            self.performSegue(withIdentifier: "FeedShowBusiness", sender: self)
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
           if segue.identifier == "FeedShowBusiness" {
            let detailVC = segue.destination as! BusinessTableViewController
            detailVC.business = businessIcon
            detailVC.deal = dealImage
            detailVC.promotion = promotionImage
            detailVC.reward = rewardImage
           }
       }
    
    
    // TODO: Can't get links to match up with businesses
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
            // Attempted solution for searchbar link issues
            for deal in currDealArray {
                for biz in bizArray {
                    if deal.name == biz.name {
                        bizDealArray.append(biz)
                    }
                }
            }
            return true
        }
        
        
        currPromotionArray = promotionArray.filter { promotion in
            for term in searchTerms {
                if !(promotion.name!.lowercased().contains(term.lowercased()) || promotion.description!.lowercased().contains(term.lowercased()))
                { return false }
            }
            for promotion in currPromotionArray {
                for biz in bizArray {
                    if promotion.name == biz.name {
                        bizPromotionArray.append(biz)
                    }
                }
            }
            return true
        }
        
        currRewardArray = rewardArray.filter { reward in
            for term in searchTerms {
                if !(reward.name!.lowercased().contains(term.lowercased()) || reward.description!.lowercased().contains(term.lowercased()))
                { return false }
            }
            for reward in currRewardArray {
                for biz in bizArray {
                    if reward.name == biz.name {
                        bizRewardArray.append(biz)
                        print(biz.name)
                    }
                }
            }
            return true
        }
        
        tableView.reloadData()
    }
}
