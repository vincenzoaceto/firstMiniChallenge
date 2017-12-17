//
//  BaseEntity.swift
//  firstMiniChallenge
//
//  Created by Bilal Abdullah on 17/12/2017.
//  Copyright © 2017 Vincenzo Aceto. All rights reserved.
//

import Foundation

open class BaseEntity: Hashable {
    open var entityId: String
    
    public init(entityId: String) {
        self.entityId = entityId
    }
    
    public static func ==(lhs: BaseEntity, rhs: BaseEntity) -> Bool {
        return lhs.equals(rhs)
    }
    
    open var hashValue: Int {
        get {
            return self.entityId.hashValue
        }
    }
    
    open func equals<T>(_ other: T) -> Bool where T: BaseEntity {
        return self.entityId == other.entityId
    }
}

