//
//  OnboardingViewController.swift
//  Krona
//
//  Created by Aditya Gadiyar on 8/19/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit
import CoreData

class OnboardingViewController: UIViewController
{
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    @IBAction func continueTouched(_ sender: UIButton)
    {
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let context = appDel.persistentContainer.viewContext
        
        let ent = NSEntityDescription.entity(forEntityName: "User", in: context)
        
        let newUser = User(entity: ent!, insertInto: context)
        newUser.firstName = firstNameTextField.text!
        newUser.lastName = lastNameTextField.text!
        newUser.email = emailTextField.text!
        newUser.password = passwordTextField.text!
        
        do
        {
            try context.save()
        }
        catch
        {
            fatalError("Failure to save context: \(error)")
        }
        
        UserDefaults.standard.set(firstNameTextField.text, forKey: "firstName")
        performSegue(withIdentifier: "toTutorialSegue", sender: self)
    }
}
