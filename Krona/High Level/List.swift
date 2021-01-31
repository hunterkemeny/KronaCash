//
//  List.swift
//  Krona
//
//  Created by Bilal Kapadya on 8/24/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class List {
    
    // MARK: - Properties
    
    // Declare lists for each type of business.
    
    static var eatList = [Business]()
    static var shopList = [Business]()
    
    // Declare list for all businesses.
    static var list = [Business]()
    
    // MARK: - Methods
    
    static func loadBusinesses() {
        /* Create Business object for each business. Create deals, promotions, and rewards for each business. Add each business to the list of the category
           it corresponds to, as well as the list of all businesses.
        */
        
        let chipotle = Business(name: "Chipotle", icon: UIImage(named: "Chipotle")!, distance: 0.3, category: "Eat", classification: .sponsored)
        chipotle.addDeal(deal: Deal(name: "Chipotle", description: "Free guac or queso", image: UIImage(named: "chipotleDeal")!))
        chipotle.addPromotion(promotion: Promotion(name: "Chipotle", description: "FREE Chipotle at 1250 points", image: UIImage(named: "ChipotleReward")!))
        chipotle.addReward(reward: Reward(name: "Chipotle", description: "Get 10 points per $1 spent", image: UIImage(named: "ChipotlePromotion")!))
        eatList.append(chipotle)
        list.append(chipotle)
        
        let starbucks = Business(name: "Starbucks", icon: UIImage(named: "starbucks")!, distance: 0.4, category: "Eat", classification: .suggested)
        starbucks.addDeal(deal: Deal(name: "Starbucks", description: "Half-price Happy Hour", image: UIImage(named: "starbucksDeal")))
        starbucks.addPromotion(promotion: Promotion(name: "Starbucks", description: "Exclusive Personalized Offers", image: UIImage(named: "StarbucksPromotion")))
        starbucks.addReward(reward: Reward(name: "Starbucks", description: "Get FREE food and drinks", image: UIImage(named: "StarbucksReward")!))
        eatList.append(starbucks)
        list.append(starbucks)
        
        let mcd = Business(name: "McDonald's", icon: UIImage(named: "mcdonalds")!, distance: 1.3, category: "Eat", classification: .suggested)
        mcd.addDeal(deal: Deal(name: "McDonald's", description: "Pick 2 for $5", image: UIImage(named: "mcdonaldsDeal")))
        mcd.addPromotion(promotion: Promotion(name: "McDonald's", description: "$1 off fries", image: UIImage(named: "McDonaldsPromotion")))
        mcd.addReward(reward: Reward(name: "McDonald's", description: "FREE McCafe", image: UIImage(named: "McDonaldsReward")!))
        eatList.append(mcd)
        list.append(mcd)
        
        let walmart = Business(name: "Walmart", icon: UIImage(named: "walmart")!, distance: 5.4, category: "Shop", classification: .suggested)
        walmart.addDeal(deal: Deal(name: "Walmart", description: "BLACK FRIDAY Specials", image: UIImage(named: "walmartDeal")))
        walmart.addPromotion(promotion: Promotion(name: "Walmart", description: "$350 off a TV!", image: UIImage(named: "WalmartPromotion")))
        walmart.addReward(reward: Reward(name: "Walmart", description: "$30 off Airpods", image: UIImage(named: "WalmartReward")!))
        shopList.append(walmart)
        list.append(walmart)
        
        let wendys = Business(name: "Wendy's", icon: UIImage(named: "wendys")!, distance: 8.0, category: "Eat", classification: .suggested)
        wendys.addDeal(deal: Deal(name: "Wendy's", description: "2 for $5 MEAL DEAL", image: UIImage(named: "WendysDeal")))
        wendys.addPromotion(promotion: Promotion(name:"Wendy's", description: "Jr. Cheeseburger 4 for $4", image: UIImage(named: "WendysPromotion")))
        wendys.addReward(reward: Reward(name: "Wendy's", description: "Crispy Chicken Sandwich 4 for $4", image: UIImage(named: "WendysReward")!))
        eatList.append(wendys)
        list.append(wendys)
        
        let red_lobster = Business(name: "Red Lobster", icon: UIImage(named: "redlobster")!, distance: 3.1, category: "Eat", classification: .suggested)
        red_lobster.addDeal(deal: Deal(name: "Red Lobster", description: "Earn 1 point for every $1", image: UIImage(named: "RedLobsterDeal")))
        red_lobster.addPromotion(promotion: Promotion(name: "Red Lobster", description: "EARN. EAT. REPEAT.", image: UIImage(named: "RedLobsterPromotion")))
        red_lobster.addReward(reward: Reward(name: "Red Lobster", description: "5 days. 5 deals. $15 dollars.", image: UIImage(named: "RedLobsterReward")!))
        eatList.append(red_lobster)
        list.append(red_lobster)
        
        let walgreens = Business(name: "Walgreens", icon: UIImage(named: "walgreens")!, distance: 10.7, category: "Shop", classification: .suggested)
        walgreens.addDeal(deal: Deal(name: "Walgreens", description: "2 Ziplocs for %6", image: UIImage(named: "WalgreensDeal")))
        walgreens.addPromotion(promotion: Promotion(name: "Walgreens", description: "Save $1 on Dixie", image: UIImage(named: "WalgreensPromotion")))
        walgreens.addReward(reward: Reward(name: "Walgreens", description: "Get on the path to rewards!", image: UIImage(named: "WalgreensReward")!))
        shopList.append(walgreens)
        list.append(walgreens)
        
        let frys = Business(name: "Fry's", icon: UIImage(named: "frys")!, distance: 11.7, category: "Shop", classification: .suggested)
        frys.addDeal(deal: Deal(name: "Fry's", description: "Discount on Beer!", image: UIImage(named: "FrysDeal")!))
        frys.addPromotion(promotion: Promotion(name: "Fry's", description: "4X more fuel points", image: UIImage(named: "FrysPromotion")))
        frys.addReward(reward: Reward(name: "Fry's", description: "Save $1 on cereal", image: UIImage(named: "FrysReward")!))
        shopList.append(frys)
        list.append(frys)
        
        let macys = Business(name: "Macy's", icon: UIImage(named: "macys")!, distance: 14.0, category: "Shop", classification: .suggested)
        macys.addDeal(deal: Deal(name: "Macy's", description: "Save on Tommy Hilfiger", image: UIImage(named: "MacysDeal")))
        macys.addPromotion(promotion: Promotion(name: "Macy's", description: "Open a Macy's Card to save!", image: UIImage(named: "MacysPromotion")))
        macys.addReward(reward: Reward(name: "Macy's", description: "Get rewarded with a Macy's Card!", image: UIImage(named: "MacysReward")!))
        shopList.append(macys)
        list.append(macys)
        
        let nordstrom = Business(name: "Nordstrom", icon: UIImage(named: "nordstrom")!, distance: 4.5, category: "Shop", classification: .suggested)
        nordstrom.addDeal(deal: Deal(name: "Nordstrom", description: "33% off women's shoes!", image: UIImage(named: "NordstromDeal")))
        nordstrom.addPromotion(promotion: Promotion(name: "Nordstrom", description: "50% off card holder!", image: UIImage(named: "NordstromPromotion")))
        nordstrom.addReward(reward: Reward(name: "Nordstrom", description: "40% off Nike", image: UIImage(named: "NordstromReward")!))
        shopList.append(nordstrom)
        list.append(nordstrom)
    }
    
    static func getEatList() -> [Business] {
        return self.eatList
    }
    
    static func getShopList() -> [Business] {
        return self.shopList
    }
    
    static func getList() -> [Business] {
        return self.list
    }
    
    static func eatCount() -> Int {
        return eatList.count
    }
    
    static func shopCount() -> Int {
        return shopList.count
    }
    
    static func listCount() -> Int {
        return list.count
    }
    
}
