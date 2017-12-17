//
//  DAO.swift
//  firstMiniChallenge
//
//  Created by Bilal Abdullah on 17/12/2017.
//  Copyright © 2017 Vincenzo Aceto. All rights reserved.
//

import Foundation

open class DAO<Entity: BaseEntity> {
    open func persist(_ entity: Entity) throws {
        preconditionFailure()
    }
    
    open func persist(_ entities: [Entity]) throws {
        preconditionFailure()
    }
    
    open func read(_ entityId: String) -> Entity? {
        preconditionFailure()
    }
    
    open func read(predicatedBy predicate: NSPredicate?) -> [Entity] {
        preconditionFailure()
    }
    
    open func read(orderedBy field: String?, ascending: Bool) -> [Entity] {
        preconditionFailure()
    }
    
    open func read(predicatedBy predicate: NSPredicate?, orderedBy field: String?,
                   ascending: Bool) -> [Entity] {
        preconditionFailure()
    }

    open func erase(_ entityId: String) throws {
        preconditionFailure()
    }
}
