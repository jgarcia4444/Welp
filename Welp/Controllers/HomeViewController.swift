//
//  HomeViewController.swift
//  Welp
//
//  Created by Jake Garcia on 9/6/19.
//  Copyright © 2019 Jake Garcia. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {
    
    var loggedInUser: User?
    
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
    
    @IBOutlet weak var welcomeLabel: UILabel!
    

}
