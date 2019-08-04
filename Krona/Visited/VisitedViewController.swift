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
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
        navigationItem.title = "Visited"
    }
    
    private func loadRestaurants() {
        let restaurant1 =  Restaurant(name: "restaurant1", icon: UIImage(named: "defaultRestImage")!, isFavorite: true)
        let restaurant2 =  Restaurant(name: "restaurant2", icon: UIImage(named: "defaultRestImage")!, isFavorite: false)
        let restaurant3 =  Restaurant(name: "restaurant3", icon: UIImage(named: "defaultRestImage")!, isFavorite: true)
        let restaurant4 =  Restaurant(name: "restaurant4", icon: UIImage(named: "defaultRestImage")!, isFavorite: false)
        restaurantList += [restaurant1, restaurant2, restaurant3,  restaurant4]
    }
}
    extension VisitedViewController : UITableViewDataSource, UITableViewDelegate {
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            return restaurantList.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           /* let cellIdentifier = "RestaurantTableViewCell"
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? RestaurantTableViewCell else {
                fatalError("The dequeued is not an instance of RestaurantTableViewCell.")
            }*/
            
            // Configure the cell...
            
            let cell = tableView.dequeueReusableCell(withIdentifier:  "RestaurantTableViewCell") as! RestaurantTableViewCell
            
            let restaurant = restaurantList[indexPath.row]
            cell.setAttributes(restaurant:  restaurant)
            return cell
        }
    }
