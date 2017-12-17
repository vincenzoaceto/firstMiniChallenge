//
//  BookingDAO.swift
//  firstMiniChallenge
//
//  Created by Bilal Abdullah on 17/12/2017.
//  Copyright © 2017 Vincenzo Aceto. All rights reserved.
//

import Foundation
import Firebase

class BookingDAO : DAO<Booking> {
    var ref: DatabaseReference!
    
    override public init() {
        ref = Database.database().reference()
        super.init()
    }
    
    override func persist(_ booking: Booking) throws {
        let bookingRef = ref.child("bookings").child(booking.entityId)
        bookingRef.setValue(["dateFrom": booking.dateFrom.description])
        bookingRef.setValue(["dateTo": booking.dateTo.description])
        bookingRef.setValue(["cost": booking.cost])
    }
    
    override func persist(_ bookings: [Booking]) throws {
        for booking in bookings {
            try self.persist(booking)
        }
    }
}
