//
//  BookingModel.swift
//  firstMiniChallenge
//
//  Created by Bilal Abdullah on 17/12/2017.
//  Copyright © 2017 Vincenzo Aceto. All rights reserved.
//

import Foundation

class Booking : BaseEntity{
    var client: Client?
    var guide: Guide?
    var period: Period?
    var cost: Money?
    var reviews: [Review]?
}

