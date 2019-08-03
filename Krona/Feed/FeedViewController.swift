//
//  ViewController.swift
//  Krona
//
//  Created by Alek Kemeny on 7/15/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import Foundation
import UIKit

class FeedViewController: UIViewController
{
    
    @IBOutlet weak var feedTableView: UITableView!
    
    var posts = [Post]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        loadPosts()
        feedTableView.dataSource = self
        feedTableView.delegate = self
    }
    
    func loadPosts()
    {
        posts = Post.fetchPosts()
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
        return posts.count + 2 // for icons scroll at top
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
            let post = posts[indexPath.row - 2]
            cell.setAttributes(post: post)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
    //    print(indexPath.row)

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
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        print(collectionView.tag)
        var num = collectionView.tag

        if num == 0
        {
            // goes here
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EatIconsCollectionViewCell", for: indexPath) as! EatIconsCollectionViewCell
            let post = posts[indexPath.row]
            cell.setAttributes(post: post)
            return cell
        }
        else if num == 1
        {
            // goes here
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopIconsCollectionViewCell", for: indexPath) as! ShopIconsCollectionViewCell
            let post = posts[indexPath.row]
            cell.setAttributes(post: post)
            return cell
        }
        else
        {
            // never goes here
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCollectionViewCell", for: indexPath) as! PostCollectionViewCell
            let post = posts[indexPath.row]
            cell.setAttributes(post: post)
            return cell
        }
    }
}

