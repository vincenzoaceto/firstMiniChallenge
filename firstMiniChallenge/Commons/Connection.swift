//
//  Connection.swift
//  firstMiniChallenge
//
//  Created by Vincenzo Aceto on 09/01/2018.
//  Copyright © 2018 Vincenzo Aceto. All rights reserved.
//

import Foundation
import Alamofire

class Connection {
    
    func getActractions(){
        Alamofire.request(Constants.BASEPATH+Constants.ACTRACTIONS).responseJSON { response in
            debugPrint(response)
            
            if let json = response.result.value {
                print("JSON: \(json)")
            }
        }
    }
    
    func getClients(){
        Alamofire.request(Constants.BASEPATH+Constants.CLIENTS).responseJSON { response in
            debugPrint(response)
            
            if let json = response.result.value {
                print("JSON: \(json)")
            }
        }
    }
    
    func getBookings(){
        Alamofire.request(Constants.BASEPATH+Constants.BOOKINGS).responseJSON { response in
            debugPrint(response)
            
            if let json = response.result.value {
                print("JSON: \(json)")
            }
        }
    }
    
    func getGuides(){
        Alamofire.request(Constants.BASEPATH+Constants.GUIDES).responseJSON { response in
            debugPrint(response)
            
            if let json = response.result.value {
                print("JSON: \(json)")
            }
        }
    }
    
}
