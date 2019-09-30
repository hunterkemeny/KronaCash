//
//  OnboardingViewController.swift
//  Krona
//
//  Created by Aditya Gadiyar on 8/19/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit
import CoreData
import FirebaseDatabase
import FirebaseAuth
import Firebase

class OnboardingViewController: UIViewController
{

    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupElements()
    }
    
    func setupElements() {
        // Hide the error label
        errorLabel.alpha = 0
        
    }
    
    //Check the fields and validate that the data is correct. If everythign is correct, method returns nil
    //Otherwise, it returns the error message as a String
    func validateFields() -> String? {
        //Check that all fields are filled in
        
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields."
        }
        
        //Check if the password is secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if OnboardingViewController.isPasswordValid(cleanedPassword) == false {
            //pasword isn't secure enough
            return "Plase make sure your password is at least 8 characters, contains a special character and a number."
        }
        return nil
    }
    
    
    @IBAction func signUp(_ sender: UIButton) {
        
        let error = validateFields()
               let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
               
               if error != nil {
                   showError(error!)
               } else {
                   //Create cleaned versions of the data
                   let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                   let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                   let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                   let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                   
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
                
                   let tutorialViewController = (mainStoryboard.instantiateViewController(withIdentifier: "TutorialViewController") as? TutorialViewController)!
                   self.navigationController?.pushViewController(tutorialViewController, animated: true)
                   
                   //Create the user
                   Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                       //Check for errors
                       if err != nil {
                           // There was an error
                           print(err)
                           self.showError("Error creating user")
                           //TODO: make the error halt the continue button from working
                       } else {
                           // User was created successfully, now store the first name and last name
                           let db = Firestore.firestore()
                           db.collection("users").addDocument(data: ["firstname": firstName, "lastname": lastName, "uid": result!.user.uid]) { (error) in
                               if error != nil {
                                   //Show error message
                                   self.showError("Try again at a later time.")
                               }
                            
                            print("New user stored in database")
                           }
                       }
                   }
                   
               }
    }
    
    
    func showError(_ message : String)  {
        errorLabel.text! = message
        errorLabel.alpha = 1
        
    }

    //TODO: Make the tab view controller the home

    
    static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    

}
