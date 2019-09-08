//
//  HomeViewController.swift
//  Welp
//
//  Created by Jake Garcia on 9/6/19.
//  Copyright © 2019 Jake Garcia. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class HomeViewController: UIViewController {
    
    var loggedInUser: User?
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var messageTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                self.welcomeLabel.text = "Hello \(user.email!)"
            } else {
                self.welcomeLabel.text = "Hello (blank)"
            }
        }
    }
    
    // MARK: - IBActions
    @IBAction func signoutButtonPressed(_ sender: UIButton) {
        
        do {
            try Auth.auth().signOut()
        } catch {
            print("Error signing out: \(error)")
        }
        
        navigationController?.popToRootViewController(animated: true) 
        
    }
    
    @IBAction func shareButtonPressed(_ sender: UIButton) {
        
        guard let message = messageTextField.text else {
            fatalError("No message was given")
        }
        guard let userEmail = loggedInUser?.email else {
            fatalError("No email was found for the logged in user")
        }
        
        let newMessage = ["message": message, "email": userEmail]
        
        Database.database().reference().child("messages").setValue(newMessage) { (error, ref) in
            
            // Show spinner
            
            self.performSegue(withIdentifier: "goToCommunity", sender: Any?.self)
            
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}
