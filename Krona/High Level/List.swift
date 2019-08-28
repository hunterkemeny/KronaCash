//
//  List.swift
//  Krona
//
//  Created by Bilal Kapadya on 8/24/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class List
{
    
    static var list = [Business]()
    
    /*init(){
        loadBusinesses()
    }*/
    
    static func loadBusinesses()
    {
        let chipotle = Business(name: "Chipotle", icon: UIImage(named: "Chipotle")!, distance: 0.3, category: "Deals", classification: .sponsored)
        chipotle.addDeal(deal: Deal(img: UIImage(named: "chipotleDeal")))
        list.append(chipotle)
        
        let starbucks = Business(name: "Starbucks", icon: UIImage(named: "starbucks")!, distance: 0.3, category: "Deals", classification: .suggested)
        starbucks.addDeal(deal: Deal(img: UIImage(named: "starbucksDeal")))
        list.append(starbucks)
        
        let mcd = Business(name: "McDonald's", icon: UIImage(named: "mcdonalds")!, distance: 1.3, category: "Deals", classification: .suggested)
        mcd.addDeal(deal: Deal(img: UIImage(named: "mcdonaldsDeal")))
        list.append(mcd)
        
        let nobu = Business(name: "Nobu", icon: UIImage(named: "Nobu")!, distance: 3.7, category: "Deals", classification: .suggested)
        nobu.addDeal(deal: Deal(img: UIImage(named: "NobuDeal")))
        list.append(nobu)
        
        let walmart = Business(name: "Wal-Mart", icon: UIImage(named: "walmart")!, distance: 5.4, category: "Deals", classification: .suggested)
        walmart.addDeal(deal: Deal(img: UIImage(named: "walmartDeal")))
        list.append(walmart)
    }
    
    static func getList() -> [Business]{
        return self.list
    }
    
    static func count() -> Int
    {
        return list.count
    }
    
    static func getBiz(i: Int) -> Business
    {
        return list[i]
    }
}
