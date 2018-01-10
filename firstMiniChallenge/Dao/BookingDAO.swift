////
////  BookingDAO.swift
////  firstMiniChallenge
////
////  Created by Bilal Abdullah on 17/12/2017.
////  Copyright © 2017 Vincenzo Aceto. All rights reserved.
////
//
//import Foundation
//import Firebase
//
//class BookingDAO : DAO<Booking> {
//    static let sharedInstance = BookingDAO()
//    var bookings: [Booking]
//    
//    override private init() {
//        bookings = []
//        super.init()
//    }
//    
//    override func persist(_ booking: Booking) throws {
//        bookings.append(booking)
//    }
//    
//    override func persist(_ bookings: [Booking]) throws {
//        for booking in bookings {
//            try self.persist(booking)
//        }
//    }
//    
//    override func read(_ entityId: String) -> Booking? {
//        for booking in bookings {
//            if booking.entityId == entityId {
//                return booking
//            }
//        }
//        return nil
//    }
//    
//    override func readAll() -> [Booking] {
//        return bookings
//    }
//}

