//
//  Post.swift
//  Krona
//
//  Created by Aditya Gadiyar on 8/1/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

struct Company
{
    var companyName: String?
    var iconImage: UIImage?
}

struct Post
{
    var category: String?
    var createdBy: Company
    var image: UIImage?
    var distance: Float?
    var classify: String? // sponsored or suggested
    
    static func fetchPosts() -> [Post]
    {
        
        var posts = [Post]()
        
        let chipotle = Company(companyName: "Chipotle", iconImage: UIImage(named: "Chipotle"))
        let postChip = Post(category: "Deals", createdBy: chipotle, image: UIImage(named: "chipotleDeal"), distance: 0.3, classify: "Sponsored Content")
        
        let starbucks = Company(companyName: "Starbucks", iconImage: UIImage(named: "starbucks"))
        let postSB = Post(category: "Deals", createdBy: starbucks, image: UIImage(named: "starbucksDeal"), distance: 0.3, classify: "For You")
        
        let mcdonalds = Company(companyName: "McDonald's", iconImage: UIImage(named: "mcdonalds"))
        let postMcD = Post(category: "Deals", createdBy: mcdonalds, image: UIImage(named: "mcdonaldsDeal"), distance: 1.3, classify: "For You")
        
        let nobu = Company(companyName: "Nobu", iconImage: UIImage(named: "Nobu"))
        let postNobu = Post(category: "Deals", createdBy: nobu, image: UIImage(named: "NobuDeal"), distance: 3.7, classify: "Popular Nearby")
        
        let walmart = Company(companyName: "Walmart", iconImage: UIImage(named: "walmart"))
        let postWal = Post(category: "Deals", createdBy: walmart, image: UIImage(named: "walmartDeal"), distance: 5.4, classify: "For You")
        
        posts.append(postChip)
        posts.append(postSB)
        posts.append(postMcD)
        posts.append(postNobu)
        posts.append(postWal)
        
        return posts
    }
}
