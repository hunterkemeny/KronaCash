//
//  OnboardingViewController.swift
//  Krona
//
//  Created by Aditya Gadiyar on 8/19/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController
{
    @IBOutlet weak var firstNameTextField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    @IBAction func continueTouched(_ sender: UIButton)
    {
    UserDefaults.standard.set(firstNameTextField.text, forKey: "firstName")
        
        performSegue(withIdentifier: "toTutorialSegue", sender: self)
    }
}
