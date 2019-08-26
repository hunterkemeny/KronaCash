//
//  VisitedViewController.swift
//  Krona
//
//  Created by Alek  Kemeny on 7/15/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class VisitedViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var favoriteList  = [Business]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        loadBusinesses()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configureUI() {
        
        //TODO: Fix Colors and style
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = UIColor(red: 107/255, green: 31/255, blue: 236/255, alpha: 1)
        navigationItem.title = "Favorites"
    }
    
    private func loadBusinesses()
    {
        let x  = List()
        let fullList = x.getList()
        for biz in fullList
        {
            if biz.isFavorite == true
                {
                    favoriteList += [biz]
                }
        }
    }
}
    extension VisitedViewController : UITableViewDataSource, UITableViewDelegate {
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return favoriteList.count
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 15
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
            let cell = tableView.dequeueReusableCell(withIdentifier:  "RestaurantTableViewCell") as! RestaurantTableViewCell
            let biz = favoriteList[indexPath.section]
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
        
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView()
            headerView.backgroundColor = UIColor.clear
            return headerView
        }
}
