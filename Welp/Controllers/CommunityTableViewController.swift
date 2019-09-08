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
    
    let ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ref.child("messages").key?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        guard let message = ref.child("messages").value(forKey: "message") else {
            fatalError("unable to retrieve message")
        }
        
        cell.textLabel?.text = message as? String
        
        return cell
    }

}
