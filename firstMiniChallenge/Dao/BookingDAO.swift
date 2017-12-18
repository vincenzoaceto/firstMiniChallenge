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
    let tblName: String = "bookings"
    let costName: String = "cost"
    let dateToName: String = "dateTo"
    let dateFromName: String = "dateFrom"
    var ref: DatabaseReference!
    
    override public init() {
        ref = Database.database().reference()
        super.init()
    }
    
    override func persist(_ booking: Booking) throws {
        let bookingRef = ref.child(tblName).child(booking.entityId)
        bookingRef.setValue([dateFromName: booking.dateFrom.description])
        bookingRef.setValue([dateToName: booking.dateTo.description])
        bookingRef.setValue([costName: booking.cost])
    }
    
    override func persist(_ bookings: [Booking]) throws {
        for booking in bookings {
            try self.persist(booking)
        }
    }
    
    override func read(_ entityId: String) -> Booking? {
        var booking : Booking?
        ref.child(tblName).child(entityId).observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let dateFrom = value?[self.dateFromName] as? String ?? ""
            let dateTo = value?[self.dateToName] as? String ?? ""
            let cost = value?[self.costName] as? NSDecimalNumber ?? 0.0
            booking = Booking(self.dateFromString(dateFrom), self.dateFromString(dateTo), cost, nil, nil)
        }) { (error) in
            print(error.localizedDescription)
        }
        
        return booking
    }
    
    override func readAll() -> [Booking] {
        var bookings : [Booking] = []
        ref.child(tblName).observe(.childAdded) { snapshot in
            for child in snapshot.children {
                let value = snapshot.value as? NSDictionary
                let dateFrom = value?[self.dateFromName] as? String ?? ""
                let dateTo = value?[self.dateToName] as? String ?? ""
                let cost = value?[self.costName] as? NSDecimalNumber ?? 0.0
                let booking = Booking(self.dateFromString(dateFrom), self.dateFromString(dateTo), cost, nil, nil)
                bookings.append(booking)
            }
        }
        return bookings
    }
    
    func dateFromString(_ dateStr:String) -> Date {
        let dateFormatter = DateFormatter()
        guard let date = dateFormatter.date(from: dateStr) else {
            fatalError("ERROR: Date conversion failed due to mismatched format.")
        }
        
        return date
    }
}
