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
import RealmSwift

class HomeViewController: UIViewController {
    
    let realm = try! Realm()
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var messageTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let loggedInUser = realm.objects(User.self).first {
            welcomeLabel.text = "Hello \(loggedInUser.fName!)."
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
        
//        guard let message = messageTextField.text else {
//            fatalError("No message was given")
//        }
//        
//        
//        let newMessage = ["message": message, "email": loggedInUser?.email]
//        
//        Database.database().reference().child("messages").setValue(newMessage) { (error, ref) in
//            
//            // Show spinner
//            
//            self.performSegue(withIdentifier: "goToCommunity", sender: Any?.self)
//            
//        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}
