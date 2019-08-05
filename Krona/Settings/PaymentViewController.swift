//
//  PaymentViewController.swift
//  Krona
//
//  Created by Hunter Kemeny on 8/4/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {
    
    @IBOutlet weak var paymentTableView: UITableView!

    
    var paymentList  = [Restaurant]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        loadPayments()
        paymentTableView.delegate = self
        paymentTableView.dataSource = self
    }
    
    func configureUI() {
        
        //TODO: Fix Colors and style
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
        navigationItem.title = "Payment"
    }
    
    private func loadPayments() {
        let payment1 =  Payment(cardIcon: UIImage(named: "defaultRestImage")!, cardNum: "1234")
        let payment2 =  Payment(cardIcon: UIImage(named: "defaultRestImage")!, cardNum: "1234")
        let payment3 =  Payment(cardIcon: UIImage(named: "defaultRestImage")!, cardNum: "1234")
        let payment4 =  Payment(cardIcon: UIImage(named: "defaultRestImage")!, cardNum: "1234")
        
        paymentList += [payment1, payment2, payment3, payment4]
        
        
    }
}
extension PaymentViewController : UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paymentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier:  "PaymentTableViewCell") as! PaymentTableViewCell
        
        let payment = paymentList[indexPath.row]
        cell.setAttributes(payment:  payment)
        return cell
    }
}

