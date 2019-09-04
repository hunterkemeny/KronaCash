//
//  FeedSearchTableViewController.swift
//  Krona
//
//  Created by Aditya Gadiyar on 9/3/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class FeedSearchTableViewController: UITableViewController
{
    var categories = ["Most Popular", "New to Krona", "Food", "Shopping", "Apparel", "Groceries", "Entertainment", "Education", "Accessories", "Finance"]
    var list = List.getList()
}
