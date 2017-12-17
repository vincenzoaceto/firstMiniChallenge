//
//  BookingModel.swift
//  firstMiniChallenge
//
//  Created by Bilal Abdullah on 17/12/2017.
//  Copyright © 2017 Vincenzo Aceto. All rights reserved.
//

import Foundation

class Booking : BaseEntity{
    let dateFrom: Date
    let dateTo: Date
    let cost: NSDecimalNumber
    let agent: Agent
    let client: Client
    
    init(dateFrom: Date, dateTo: Date, cost: NSDecimalNumber, agent: Agent, client: Client) {
        self.dateFrom = dateFrom
        self.dateTo = dateTo
        self.cost = cost
        self.agent = agent
        self.client = client
        
        super.init(entityId: NSUUID().uuidString)
    }
}
