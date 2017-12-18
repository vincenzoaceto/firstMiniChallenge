//
//  Tools.swift
//  firstMiniChallenge
//
//  Created by Vincenzo Aceto on 18/12/2017.
//  Copyright © 2017 Vincenzo Aceto. All rights reserved.
//

import Foundation

struct Tools {
    static func isValidEmail(email:String?) -> Bool {
        
        guard email != nil else { return false }
        
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        return pred.evaluate(with: email)
    }

}
