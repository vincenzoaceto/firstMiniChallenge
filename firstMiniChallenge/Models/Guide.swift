//
//  AgentModel.swift
//  firstMiniChallenge
//
//  Created by Bilal Abdullah on 17/12/2017.
//  Copyright © 2017 Vincenzo Aceto. All rights reserved.
//

import Foundation

// Model stub
class Guide: User {
    var about : String?
    var rating: Float?
    var rate : Money?
    var services: [String]?
    var languages: [Language]?
    var attractions: [Attraction]?
    var memories: [Memory]?
    override init(_id: String, firstName: String, lastName: String) {
        super.init(_id:_id, firstName: firstName, lastName: lastName)
    }
}
