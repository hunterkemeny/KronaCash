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
    
    @IBOutlet weak var favoriteSwitch: UISwitch!
    
    var loadNonFavorites = true
    
    @IBAction func switchClicked(_ sender: Any)
    {
        if favoriteSwitch.isOn
        {
            loadNonFavorites = false
        }
        else
        {
            loadNonFavorites  = true
        }
        viewDidLoad()
        tableView.reloadData()
        
    }
    
    var restaurantList  = [Restaurant]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        loadRestaurants()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configureUI() {
        
        //TODO: Fix Colors and style
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = UIColor(red: 107/255, green: 31/255, blue: 236/255, alpha: 1)
        navigationItem.title = "Visited"
    }
    
    private func loadRestaurants() {
        let restaurant1 =  Restaurant(name: "restaurant1", icon: UIImage(named: "defaultRestImage")!, isFavorite: true)
        let restaurant2 =  Restaurant(name: "restaurant2", icon: UIImage(named: "defaultRestImage")!, isFavorite: false)
        let restaurant3 =  Restaurant(name: "restaurant3", icon: UIImage(named: "defaultRestImage")!, isFavorite: true)
        let restaurant4 =  Restaurant(name: "restaurant4", icon: UIImage(named: "defaultRestImage")!, isFavorite: false)
        
       var fullRestaurantList  = [Restaurant]()
       fullRestaurantList += [restaurant1, restaurant2, restaurant3, restaurant4]
        
        if loadNonFavorites  == true
        {
            restaurantList = fullRestaurantList
        }
        else
        {
            restaurantList = [Restaurant]()
            for rest in fullRestaurantList
            {
                if rest.isFavorite == true
                {
                    restaurantList += [rest]
                }
            }
        }
    }
}
    extension VisitedViewController : UITableViewDataSource, UITableViewDelegate {
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return restaurantList.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
            let cell = tableView.dequeueReusableCell(withIdentifier:  "RestaurantTableViewCell") as! RestaurantTableViewCell
            
            let restaurant = restaurantList[indexPath.row]
            cell.setAttributes(restaurant:  restaurant)
            return cell
        }
    }
