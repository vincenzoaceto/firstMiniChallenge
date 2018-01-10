//
//  UserModel.swift
//  firstMiniChallenge
//
//  Created by Vincenzo Aceto on 14/12/2017.
//  Copyright © 2017 Vincenzo Aceto. All rights reserved.
//

import Foundation

class User : IdentifiableEntity{
    let firstName : String?
    let lastName: String?
    var phone : String?
    var email: String?
    var username : String?
    var password : String?
    var profileImage: String?
    
    init(_id: String, firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        super.init(_id:_id)
    }
}
