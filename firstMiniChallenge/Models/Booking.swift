//
//  BookingModel.swift
//  firstMiniChallenge
//
//  Created by Bilal Abdullah on 17/12/2017.
//  Copyright © 2017 Vincenzo Aceto. All rights reserved.
//

import Foundation

class Booking {
    let datefrom: Date
    let dateTo: Date
    let cost: NSDecimalNumber
    let agent: Agent
    let client: Client
    
    init(datefrom: Date, dateTo: Date, cost: NSDecimalNumber, agent: Agent, client: Client) {
        self.datefrom = datefrom
        self.dateTo = dateTo
        self.cost = cost
        self.agent = agent
        self.client = client
    }
}
