//
//  HistoryTableViewController.swift
//  Krona
//
//  Created by Hunter Kemeny on 8/3/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class HistoryTableViewController: UITableViewController {
    
    var transactionList  = [TransactionHistory]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTransactions()
        configureUI()
    }
    
    func configureUI() {
        
        //TODO: Fix Colors and style
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
        navigationItem.title = "Transaction History"
    }
    
    private func loadTransactions() {
        let transaction1 =  TransactionHistory(name: "transaction1", icon: UIImage(named: "defaultRestImage")!, earned: "Rewarded", date: "10/02/2000", points: "100")
        let transaction2 =  TransactionHistory(name: "transaction2", icon: UIImage(named: "defaultRestImage")!, earned: "Rewarded", date: "10/02/2000", points: "100")
        let transaction3 =  TransactionHistory(name: "transaction3", icon: UIImage(named: "defaultRestImage")!, earned: "Rewarded", date: "10/02/2000", points: "100")
        let transaction4 =  TransactionHistory(name: "transaction4", icon: UIImage(named: "defaultRestImage")!, earned: "Rewarded", date: "10/02/2000", points: "100")
        transactionList += [transaction1, transaction2, transaction3,  transaction4]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return transactionList.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: Make Sections Maked on Day
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell", for: indexPath) as? HistoryTableViewCell  else {
            fatalError("The dequeued cell is not an instance of HistoryTableViewCell.")
        }
        
        let transaction = transactionList[indexPath.row]
        cell.setAttributes(transaction: transaction)
        return cell
    }


}
