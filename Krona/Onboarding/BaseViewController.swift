//
//  BaseViewController.swift
//  Krona
//
//  Created by Hunter Kemeny on 9/26/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit
import FirebaseUI

class BaseViewController: UIViewController {

    @IBOutlet weak var mainLogin: UIButton!
    @IBOutlet weak var mainSignup: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    /*
    @IBAction func loginTapped(_ sender: UIButton) {
        // Get the default auth UI object
        let authUI = FUIAuth.defaultAuthUI()
        
        guard authUI != nil else {
            //Log the error
            return
        }
        
        //set ourselves as the delegate
        authUI?.delegate = self
        
        //Get a reference to the auth UI view controller
        let authViewController = authUI!.authViewController()
        //Show it
        
        present(authViewController, animated: true, completion: nil)
    }
*/
}

/*
extension UIViewController: FUIAuthDelegate {
    public func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        //Check if there was an error
        
        guard error == nil else {
            //Log the error
            return
        }
        
     //   authDataResult?.user.uid
        
        performSegue(withIdentifier: "toLoginSegue", sender: self)
    }
}
*/
