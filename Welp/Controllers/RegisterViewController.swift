//
//  RegisterViewController.swift
//  Welp
//
//  Created by Jake Garcia on 9/5/19.
//  Copyright © 2019 Jake Garcia. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    let newUser = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Register"
        // Do any additional setup after loading the view.
    }
    
    

    @IBAction func registerButtonPressed(_ sender: UIButton) {
        
        guard let email = emailTextField?.text else {
            fatalError("Email was found to be nil")
        }
        
        guard let password = passwordTextField?.text, let confirmPassword = confirmPasswordTextField?.text else {
            fatalError("password or confirm password text field were found nil")
        }
        
        if password == confirmPassword {
            Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
                if error != nil {
                    fatalError("error creating new user \(error!)")
                } else {
                    self.newUser.email = email
                    self.newUser.password = password
                }
            }
        }
        
        performSegue(withIdentifier: "goToHomepage", sender: Any?.self)
        
    }

}
