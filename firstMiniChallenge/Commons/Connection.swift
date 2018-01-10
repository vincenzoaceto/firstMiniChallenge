//
//  Connection.swift
//  firstMiniChallenge
//
//  Created by Vincenzo Aceto on 09/01/2018.
//  Copyright © 2018 Vincenzo Aceto. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Connection {
    func getActractions(completion: @escaping (_ attractions: [Attraction]) -> Void) {
        Alamofire.request(Constants.BASEPATH+Constants.ACTRACTIONS).responseData { (resData) -> Void in
            print(resData.result.value!)
            if let json = String(data : resData.result.value!, encoding : String.Encoding.utf8) {
                let attractions = [Attraction](json: json)
                completion(attractions)
            }
            
        }
    }
    
    func getClients(completion: @escaping (_ attractions: [Client]) -> Void) {
        Alamofire.request(Constants.BASEPATH+Constants.CLIENTS).responseData { (resData) -> Void in
            print(resData.result.value!)
            if let json = String(data : resData.result.value!, encoding : String.Encoding.utf8) {
                let clients = [Client](json: json)
                completion(clients)
            }
        }
    }
    
    func getBookings(completion: @escaping (_ attractions: [Booking]) -> Void) {
        Alamofire.request(Constants.BASEPATH+Constants.BOOKINGS).responseData { (resData) -> Void in
            print(resData.result.value!)
            if let json = String(data : resData.result.value!, encoding : String.Encoding.utf8) {
                let bookings = [Booking](json: json)
                completion(bookings)
            }
        }
    }
    
    func getGuides(completion: @escaping (_ attractions: [Guide]) -> Void) {
        Alamofire.request(Constants.BASEPATH+Constants.GUIDES).responseData { (resData) -> Void in
            print(resData.result.value!)
            if let json = String(data : resData.result.value!, encoding : String.Encoding.utf8) {
                let guides = [Guide](json: json)
                completion(guides)
            }
        }
    }
}
