//
//  BaseEntity.swift
//  firstMiniChallenge
//
//  Created by Bilal Abdullah on 17/12/2017.
//  Copyright © 2017 Vincenzo Aceto. All rights reserved.
//

import Foundation

open class IdentifiableEntity: Hashable {
    open var _id: String
    
    public init(_id: String) {
        self._id = _id
    }
    
    public static func ==(lhs: IdentifiableEntity, rhs: IdentifiableEntity) -> Bool {
        return lhs.equals(rhs)
    }
    
    open var hashValue: Int {
        get {
            return self._id.hashValue
        }
    }
    
    open func equals<T>(_ other: T) -> Bool where T: IdentifiableEntity {
        return self._id == other._id
    }
}

