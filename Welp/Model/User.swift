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
    var age : Int?
    
    init(userEmail: String, userFName: String, userLName: String, userAge: Int) {
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
    
}
