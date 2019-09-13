//
//  User.swift
//  Welp
//
//  Created by Jake Garcia on 9/7/19.
//  Copyright © 2019 Jake Garcia. All rights reserved.
//

import Foundation


class User {
    
    var email: String?
//    var password: String?
    var fName : String?
    var lName : String?
    var age : String?
    
    
    convenience init(userEmail: String, userFName: String, userLName: String, userAge: String) {
        self.init()
        self.email = userEmail
        self.fName = userFName
        self.lName = userLName
        self.age = userAge
    }
    
    func toAnyObject(user: User) -> [String: String] {
        
        let userDict = [
            "firstName": user.fName!,
            "lastName": user.lName!,
            "email": user.email!,
            "age": String(user.age!)
        ]
        return userDict
    }
    
    func toUserObject(userDict: [String: Any]) -> User {
        
        
        guard let dictFName = userDict["firstName"] as? String else {
            fatalError("No value for the first name was found")
        }
        guard let dictLName = userDict["lastName"] as? String else {
            fatalError("No value for the last name was found")
        }
        guard let dictEmail = userDict["email"] as? String else {
            fatalError("No value for the email was found")
        }
        guard let dictAge = userDict["age"] as? String else {
            fatalError("No value for the age was found")
        }
        let userValue = User(userEmail: dictEmail, userFName: dictFName, userLName: dictLName, userAge: dictAge)
        
        return userValue
    }
    
}
