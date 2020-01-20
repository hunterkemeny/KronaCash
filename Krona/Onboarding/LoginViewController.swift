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
    

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupElements()
        // Do any additional setup after loading the view.
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        
        //Validate text fields
        let error = validateFields()
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        if error != nil {
            showError(error!)
        } else {
            //Create cleaned versions of the data
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            let appDel = UIApplication.shared.delegate as! AppDelegate
            let context = appDel.persistentContainer.viewContext
            
            do
            {
                try context.save()
            }
            catch
            {
                fatalError("Failure to save context: \(error)")
            }
            
            UserDefaults.standard.set(emailTextField.text, forKey: "firstName")
            
            
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if error != nil {
                    //Couldn't sign in
                    self.errorLabel.text = error!.localizedDescription
                    self.errorLabel.alpha = 1
                } else {
                    self.makeHome()
                    let homeViewController = (mainStoryboard.instantiateViewController(withIdentifier: "HomeVC") as? TabBarController)!
                    homeViewController.modalPresentationStyle = .fullScreen
                    self.navigationController?.present(homeViewController, animated: true , completion: nil)
                }
            }
            
            
    }
        
        

    }
    
    func makeHome() {
        let homeViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? TabBarController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
    
    func setupElements() {
        // Hide the error label
        errorLabel.alpha = 0
        
    }
    
    func validateFields() -> String? {
        //Check that all fields are filled in
        
        if  emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
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
    
    func showError(_ message : String)  {
        errorLabel.text! = message
        errorLabel.alpha = 1
        
    }
    

}
