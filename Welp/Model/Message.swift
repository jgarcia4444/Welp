//
//  Message.swift
//  Welp
//
//  Created by Jake Garcia on 9/12/19.
//  Copyright © 2019 Jake Garcia. All rights reserved.
//

import Foundation

class Message: NSObject {
    
    var message: String?
    var userFullName: String?
    var dateCreated: String?
    var userID : String?
    
    
    convenience init(shareMessage: String, userShareName: String, creationDate: String, userID: String) {
        self.init()
        self.message = shareMessage
        self.userFullName = userShareName
        self.dateCreated = creationDate
        self.userID = userID
    }
    
    func toAnyObject(message: Message) -> [String: String] {
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
        
        let messageDict: [String: String] = [
            "message": shareMessage,
            "fullName": fullName,
            "dateCreated": dateCreated,
            "userID": userID
        ]
        return messageDict
    }
    
    func toMessageObject(from messageDictionary: [String: String]) -> Message {
        
        guard let fullName = messageDictionary["fullName"] else {
            fatalError("No full name was found.")
        }
        guard let message = messageDictionary["message"] else {
            fatalError("No message was found.")
        }
        guard let messageUserID = messageDictionary["userID"] else {
            fatalError("No userId was found.")
        }
        
        guard let dateCreated = messageDictionary["dateCreated"] else {
            fatalError("No userId was found.")
        }
        
        let messageObject = Message(shareMessage: message, userShareName: fullName, creationDate: dateCreated, userID: messageUserID)
        
        return messageObject
    }
    
}
