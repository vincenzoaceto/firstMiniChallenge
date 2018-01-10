//
//  Review.swift
//  firstMiniChallenge
//
//  Created by Bilal Abdullah on 10/01/2018.
//  Copyright © 2018 Vincenzo Aceto. All rights reserved.
//

import Foundation

class Review : IdentifiableEntity{
    var subject : String?
    var review: String?
    var rating : Float?
    var date: Date?
    
    override init(_id: String) {
        super.init(_id:_id)
    }
}
