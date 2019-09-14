//
//  CommunityTableViewController.swift
//  Welp
//
//  Created by Jake Garcia on 9/7/19.
//  Copyright © 2019 Jake Garcia. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class CommunityTableViewController: UITableViewController {
    var messages : [Message]? = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadMessages()
    }
    


    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages?.count ?? 1
    }
    
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//
//        if let messageArr = messages {
//
//            let cellMessageObject = messageArr[indexPath.row]
//
//            if let message = cellMessageObject.message {
//                cell.textLabel?.text = "\(message)"
//            }
//
//        } else {
//            cell.textLabel?.text = "No messages here yet."
//        }
//
//        return cell
//    }
    
    // MARK: Database functions
    
    // Load messages array of Message objects
    func loadMessages() {
        let communityRef = Database.database().reference().child("communityMessages")
        
        communityRef.observe(.value) { (snapshot) in
            
            guard let valueDict = snapshot.value as? NSDictionary else {
                fatalError("Unable to cast snapshot into a dictionary")
            }
            
            
            let messageAutoIDValues = valueDict.allValues as! [[String: String]]
            
            for messageDict in messageAutoIDValues {
                let messageObject = Message().toMessageObject(from: messageDict)
                
                self.messages?.append(messageObject)
                
            }
            
        }
        tableView.reloadData()
    }
}
