//
//  User.swift
//  Welp
//
//  Created by Jake Garcia on 9/7/19.
//  Copyright © 2019 Jake Garcia. All rights reserved.
//

import Foundation
import RealmSwift


class User: Object {
    
    @objc dynamic var email: String?
    @objc dynamic var password: String?
    @objc dynamic var fName : String?
    @objc dynamic var lName : String?
    var age : Int?
    
}
