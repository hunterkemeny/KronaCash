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
        navigationController?.navigationBar.prefersLargeTitles = true
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
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return favoriteList.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
            let cell = tableView.dequeueReusableCell(withIdentifier:  "RestaurantTableViewCell") as! RestaurantTableViewCell
            
            let biz = favoriteList[indexPath.row]
            cell.setAttributes(biz: biz)
            return cell
        }
}
