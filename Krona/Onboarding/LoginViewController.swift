//
//  LoginViewController.swift
//  Krona
//
//  Created by Hunter Kemeny on 9/26/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit
import CoreData
import FirebaseAuth

class LoginViewController: UIViewController, UITextFieldDelegate {

    // MARK: - IBOutlets
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupElements()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    // MARK: - IBAction
    
    @IBAction func loginTapped(_ sender: UIButton) {
        // Login existing user stored in Firestore DB.
        
        // Create reference to storyboard.
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Check that textFields are filled in and contain usable, correctly formatted data.
        let error = validateFields()
        if error != nil {
            showError(error!)
        } else {
            // Create cleaned versions of the data.
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Create reference to Core Data "User" Entity
            let appDel = UIApplication.shared.delegate as! AppDelegate
            let context = appDel.persistentContainer.viewContext
            let ent = NSEntityDescription.entity(forEntityName: "User", in: context)
            
            // Create new User in Core Data
            let newUser = User(entity: ent!, insertInto: context)
            newUser.email = emailTextField.text!
            newUser.password = passwordTextField.text!
            
            // Save new user to Core Data
            do {
                try context.save()
            } catch {
                fatalError("Failure to save context: \(error)")
            }
            
            // Save firstNameTextField to UserDefaults in order to change the initial ViewController condition in AppDelegate.
            UserDefaults.standard.set(emailTextField.text, forKey: "firstName")
            
            // Signin user.
            Auth.auth().signIn(withEmail: email, password: password) { (result, err) in
                // Check for errors.
                if err != nil {
                    // Couldn't sign in.
                    print(err!)
                    self.showError(err!.localizedDescription)
                } else {
                    // User was signed in successfully. Now move on to the app tutorial.
                    let tutorialViewController = (mainStoryboard.instantiateViewController(withIdentifier: "TutorialViewController") as? TutorialViewController)!
                    self.navigationController?.pushViewController(tutorialViewController, animated: true)
                }
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Enable functionality for return key.
        
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
    
    //MARK: - Text Field Validation
    
    func setupElements() {
        // Hide the error label.
        
        errorLabel.alpha = 0
    }
    
    func validateFields() -> String? {
        // Check all fields and validate that the input data is correct. If correct, method returns nil. Otherwise, it returns an error message as a String.
        
        // Check that all fields are filled in.
        if  emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields."
        }
        
        // Check if the password is secure. If password is not secure enough, return error message.
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if LoginViewController.isPasswordValid(cleanedPassword) == false {
            // Pasword is not secure enough.
            return "Plase make sure your password is at least 8 characters, contains a special character and a number."
        }
        return nil
    }
    
    func showError(_ message : String)  {
        // If called, makes error message visible.
        
        errorLabel.text! = message
        errorLabel.alpha = 1
    }
    
    static func isPasswordValid(_ password : String) -> Bool {
        // Determines if password meets basic standards using Regular Expressions.
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
}
