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
        let chipotle = Business(name: "Chipotle", icon: UIImage(named: "Chipotle")!, distance: 0.3, category: "Deals", classification: .sponsored, deal: UIImage(named: "chipotleDeal")!)
        
        //chipotle.addDeal(deal: Deal(name: "Chipotle", description: "Add 3-day-old guac for just $10", img: UIImage(named: "chipotleDeal")))
        list.append(chipotle)
        
        
        let starbucks = Business(name: "Starbucks", icon: UIImage(named: "starbucks")!, distance: 0.3, category: "Deals", classification: .suggested, deal: UIImage(named: "starbucksDeal")!)
        
        //starbucks.addDeal(deal: Deal(name: "Starbucks", description: "Just $100 for a cup of ice!", img: UIImage(named: "starbucksDeal")))
        list.append(starbucks)
        
        
        let mcd = Business(name: "McDonald's", icon: UIImage(named: "mcdonalds")!, distance: 1.3, category: "Deals", classification: .suggested, deal: UIImage(named: "mcdonaldsDeal")!)
        
        //mcd.addDeal(deal: Deal(name: "McDonald's", description: "Free side of nuggets", img: UIImage(named: "mcdonaldsDeal")))
        list.append(mcd)
        
        
        let nobu = Business(name: "Nobu", icon: UIImage(named: "Nobu")!, distance: 3.7, category: "Deals", classification: .suggested, deal: UIImage(named: "NobuDeal")!)
        
        //nobu.addDeal(deal: Deal(name: "Nobu", description: "Eat with LeBron", img: UIImage(named: "NobuDeal")))
        list.append(nobu)
        
        
        let walmart = Business(name: "Wal-Mart", icon: UIImage(named: "walmart")!, distance: 5.4, category: "Deals", classification: .suggested, deal: UIImage(named: "walmartDeal")!)
        
        //walmart.addDeal(deal: Deal(name: "Wal-Mart", description: "Lose money. Live worse.", img: UIImage(named: "walmartDeal")))
        list.append(walmart)
        
    }
    
    static func getList() -> [Business]{
        return self.list
    }
    
    static func count() -> Int
    {
        return list.count
    }
    
    /*static func getFavorites() -> [Business]
    {
        var favList = [Business]()
        for biz in list
        {
            if biz.isFavorite == true
            {
                favList.append(biz)
            }
        }
        return favList
    }*/
}
