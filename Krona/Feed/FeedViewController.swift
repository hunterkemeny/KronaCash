//
//  ViewController.swift
//  Krona
//
//  Created by Alek Kemeny on 7/15/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit
import CoreData

class FeedViewController: UIViewController
{
    //THIS IS WHERE THE GOD-LIST IS CREATED
    var list = [Business]()
    
    @IBOutlet weak var feedTableView: UITableView!
    
    let feedSearchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.definesPresentationContext = true
        self.feedSearchController.searchBar.delegate = self
        self.navigationItem.searchController = feedSearchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.searchController?.searchBar.tintColor = UIColor(red: 107/255, green: 31/255, blue: 236/255, alpha: 1)
        List.loadBusinesses()
        list = List.getList()
        feedTableView.dataSource = self
        feedTableView.delegate = self
    }
}

extension FeedViewController: UISearchBarDelegate
{
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar)
    {
        performSegue(withIdentifier: "feedToSearchSegue", sender: nil)
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
}

extension FeedViewController: UITableViewDataSource, UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return list.count + 2 // for icons scroll at top
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if indexPath.row == 0
        {
            let cell = feedTableView.dequeueReusableCell(withIdentifier: "EatIconsTableViewCell", for: indexPath) as! EatIconsTableViewCell
            cell.setAttributes(category: "Places to Eat")
            return cell
        }
        else if indexPath.row == 1
        {
            let cell = feedTableView.dequeueReusableCell(withIdentifier: "ShopIconsTableViewCell", for: indexPath) as! ShopIconsTableViewCell
            cell.setAttributes(category:
                "Places to Shop")
            return cell
        }
        else
        {
            let cell = feedTableView.dequeueReusableCell(withIdentifier: "PostTableViewCell") as! PostTableViewCell
            let biz = list[indexPath.row - 2]
            cell.setAttributes(biz: biz)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        if indexPath.row == 0
        {
            if let cell = cell as? EatIconsTableViewCell
            {
                cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
            }
        }
        else if indexPath.row == 1
        {
            if let cell = cell as? ShopIconsTableViewCell
            {
                cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
            }
        }
        else
        {
            if let cell = cell as? PostTableViewCell
            {
                cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
            }
        }
    }
}

extension FeedViewController: UICollectionViewDataSource, UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {

        if collectionView.tag == 0
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EatIconsCollectionViewCell", for: indexPath) as! EatIconsCollectionViewCell
            cell.setAttributes(biz: list[indexPath.row])
            return cell
        }
        else if collectionView.tag == 1
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopIconsCollectionViewCell", for: indexPath) as! ShopIconsCollectionViewCell
            cell.setAttributes(biz: list[indexPath.row])
            return cell
        }
        else
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCollectionViewCell", for: indexPath) as! PostCollectionViewCell
            cell.setAttributes(biz: list[indexPath.row])
            return cell
        }
    }
}

