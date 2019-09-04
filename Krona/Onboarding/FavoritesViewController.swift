//
//  FavoritesViewController.swift
//  Krona
//
//  Created by Aditya Gadiyar on 8/26/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit
import CoreData

class FavoritesViewController: UIViewController
{
    var list = [Business]()
    var favBiz = [Int]()
    
    @IBOutlet weak var favoritesTableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        List.loadBusinesses() // initialize businesses
        list = List.getList()
        favoritesTableView.dataSource = self
        favoritesTableView.delegate = self
    }
    
    func goToSegue(sender: UIBarButtonItem)
    {
        performSegue(withIdentifier: "favoritesToMainSegue", sender: self)
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(true)
        for i in 0..<list.count
        {
            let biz = list[i]
            if biz.isFavorite == true
            {
                favBiz.append(i)
            }
        }
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let context = appDel.persistentContainer.viewContext
        
        let request: NSFetchRequest<User> = User.fetchRequest()
        request.returnsObjectsAsFaults = false // return ref to obj
        
        var results: [User]
        do
        {
            try results = context.fetch(request)
        }
        catch
        {
            fatalError("Failure to fetch: \(error)")
        }
        
        if results.count > 0
        {
            for user in results
            {
                //let thisUser = user as User
                user.favList = favBiz
            }
        }
        
        do
        {
            try context.save()
        }
        catch
        {
            fatalError("Failure to save context: \(error)")
        }
    }
}

extension FavoritesViewController: UITableViewDataSource, UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = favoritesTableView.dequeueReusableCell(withIdentifier: "FavoritesTableViewCell") as! FavoritesTableViewCell
        let biz = list[indexPath.section]
        cell.setAttributes(biz: biz)
        
        //JAMESIFICATION
        cell.layer.cornerRadius = 20
        let shadowPath2 = CGRect(x:0, y:0, width:374, height: 100)
        let rounded = UIBezierPath(roundedRect: shadowPath2, cornerRadius: 30)
        cell.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: CGFloat(1.0), height: CGFloat(10.0))
        cell.layer.shadowOpacity = 0.3
        cell.layer.shadowPath = rounded.cgPath
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
            let biz = list[indexPath.section]
            biz.isFavorite = false
        }
        else
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
            let biz = list[indexPath.section]
            biz.isFavorite = true
        }
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
}
