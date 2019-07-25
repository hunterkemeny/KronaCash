//
//  RestaurantTableView.swift
//  Krona
//
//  Created by Bilal Kapadya on 7/22/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class RestaurantTableView: UITableView {
    var restaurantList  = [Restaurant]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadRestaurants()
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "RestaurantTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? RestaurantTableViewCell else {
            fatalError("The dequeued is not an instance of RestaurantTableViewCell.")
        }
        
        // Configure the cell...
        
        let restaurant = restaurantList[indexPath.row]
        cell.nameLabel.text = restaurant.name
        cell.restaurantPicture.image = restaurant.icon
        return cell
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    //MARK:  Private Methods
    private func loadRestaurants() {
        let restaurant1 =  Restaurant(name: "restaurant1", icon: UIImage(named: "defaultRestImage")!, isFavorite: true)
        let restaurant2 =  Restaurant(name: "restaurant2", icon: UIImage(named: "defaultRestImage")!, isFavorite: false)
        let restaurant3 =  Restaurant(name: "restaurant3", icon: UIImage(named: "defaultRestImage")!, isFavorite: true)
        let restaurant4 =  Restaurant(name: "restaurant4", icon: UIImage(named: "defaultRestImage")!, isFavorite: false)
        restaurantList += [restaurant1, restaurant2, restaurant3,  restaurant4]
    }
}
