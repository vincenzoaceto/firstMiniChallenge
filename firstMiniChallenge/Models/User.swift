//
//  UserModel.swift
//  firstMiniChallenge
//
//  Created by Vincenzo Aceto on 14/12/2017.
//  Copyright © 2017 Vincenzo Aceto. All rights reserved.
//

import Foundation

class User : BaseEntity{
    
    let username : String
    let password : String
    
    var name : String?
    var surname: String?
    var age: Int?
    var city: String?
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
        
        super.init(entityId: NSUUID().uuidString)
    }
    
}
