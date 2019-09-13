//
//  Message.swift
//  Welp
//
//  Created by Jake Garcia on 9/12/19.
//  Copyright © 2019 Jake Garcia. All rights reserved.
//

import Foundation

class Message {
    
    var message: String?
    var userFullName: String?
    var dateCreated: Date?
    var userID : String?
    
    
    init(shareMessage: String, userShareName: String, creationDate: Date, userID: String) {
        self.message = shareMessage
        self.userFullName = userShareName
        self.dateCreated = creationDate
        self.userID = userID
    }
    
    func toAnyObject(message: Message) -> [String: Any] {
        guard let shareMessage = message.message else {
            fatalError("No message was given")
        }
        guard let fullName = message.userFullName else {
            fatalError("No Full name was given")
        }
        guard let dateCreated = message.dateCreated else {
            fatalError("No date was given")
        }
        guard let userID = message.userID else {
            fatalError("No userID was given")
        }
        
        let messageDict: [String: Any] = [
            "message": shareMessage,
            "fullName": fullName,
            "dateCreated": dateCreated,
            "userID": userID
        ]
        return messageDict
    }
    
}
