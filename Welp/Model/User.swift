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
    var password: String?
    var fName : String?
    var lName : String?
    var age : Int?
    
    init(email: String, password: String, fName: String, lName: String, age: Int) {
        self.email = email
        self.password = password
        self.fName = fName
        self.lName = lName
        self.age = age
    }
    
}
