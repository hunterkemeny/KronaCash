//
//  PaymentTableViewController.swift
//  Krona
//
//  Created by Hunter Kemeny on 8/4/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class PaymentTableViewController: UITableViewController {
    
    var paymentList  = [Payment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPayments()
    }
    
    private func loadPayments() {
        let payment1 =  Payment(cardIcon: UIImage(named: "defaultRestImage")!, cardNum: "Add Card")
        let payment2 =  Payment(cardIcon: UIImage(named: "defaultRestImage")!, cardNum: "1234")
        let payment3 =  Payment(cardIcon: UIImage(named: "defaultRestImage")!, cardNum: "1234")
        let payment4 =  Payment(cardIcon: UIImage(named: "defaultRestImage")!, cardNum: "1234")
        
        paymentList += [payment1, payment2, payment3, payment4]
        
        
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paymentList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier:  "PaymentTableViewCell") as! PaymentTableViewCell
        
        let payment = paymentList[indexPath.row]
        cell.setAttributes(payment:  payment)
        return cell
    }



}
