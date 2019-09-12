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
    
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var messageTextField: UITextView!
    
    
    let usersRef = Database.database().reference(withPath: "users")
    let communityRef = Database.database().reference(withPath: "communityMessages")
    let loggedInUserID = Auth.auth().currentUser?.uid
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadUserInfo()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
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
        
        
        
    }
    
   
    
    //MARK: - UIUpdate Functions
    
    // Update Messsage Label
    func updateMessageLabel(name: String) {
        welcomeLabel.text = "Hello \(name)"
    }
    //MARK: - Save to database
    
    // Load User Info
    
    func loadUserInfo() {
        if let userID = loggedInUserID {
            usersRef.child(userID).observe(.value) { (snapshot) in
                let value = snapshot.value as? NSDictionary
                if let userDict = value {
                    let fName = userDict["firstName"] as! String
                    self.updateMessageLabel(name: fName)
                }
            }
        }
    }
    
    // Save Share Message
    func saveMessage(newMessage: String) {
        
        communityRef.child(<#T##pathString: String##String#>)
        
    }
    
}
