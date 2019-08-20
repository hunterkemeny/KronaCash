//
//  TutorialViewController.swift
//  Krona
//
//  Created by Aditya Gadiyar on 8/19/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    
    @IBAction func skipTouched(_ sender: UIButton)
    {
        performSegue(withIdentifier: "tutorialToMainSegue", sender: self)
    }
}
