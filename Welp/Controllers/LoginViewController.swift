//
//  LoginViewController.swift
//  Welp
//
//  Created by Jake Garcia on 9/5/19.
//  Copyright © 2019 Jake Garcia. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        // Do any additional setup after loading the view.
    }
    

   // Login User
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        guard let userEmail = emailTextField.text else {
            fatalError("There was no email given")
        }
        guard let userPassword = passwordTextField.text else {
            fatalError("There was no password given")
        }
        
        Auth.auth().signIn(withEmail: userEmail, password: userPassword) { (authresult, error) in
            
            if error != nil {
                fatalError("Unable to sign in")
            } else {
                self.performSegue(withIdentifier: "goToHomepage", sender: Any?.self)
            }
            
        }
        
    }
    
    
}
