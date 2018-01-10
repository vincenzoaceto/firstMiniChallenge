//
//  Memory.swift
//  firstMiniChallenge
//
//  Created by Daniel Moreano on 12/20/17.
//  Copyright © 2017 Vincenzo Aceto. All rights reserved.
//

import Foundation
import UIKit

class Memory : IdentifiableEntity{
    var name: String
    var image: UIImage
    var images: [String]?
    
    init(_id: String, name: String, image: UIImage, images: [String]?) {
        self.name = name
        self.image = image
        super.init(_id:_id)
    }
    
    static var memories =
        [
            Memory(_id: "1", name: "Colosseum", image: UIImage(named: "colosseum")!, images:nil),
            Memory(_id: "2", name: "Dome", image: UIImage(named: "dome")!, images:nil),
            Memory(_id: "3", name: "Rome Church", image: UIImage(named: "rome_church")!, images:nil),
            Memory(_id: "4", name: "Rome Street", image: UIImage(named: "rome_street")!, images:nil),
            Memory(_id: "5", name: "Trevi Fountain", image: UIImage(named: "trevi-fountain")!, images:nil),
            Memory(_id: "6", name: "Vetican Italy", image: UIImage(named: "vetican_italy")!, images:nil),
            Memory(_id: "7", name: "Vetican Square", image: UIImage(named: "vetican_square")!, images:nil),
            Memory(_id: "8", name: "brandenburger", image: UIImage(named: "brandenburger")!, images:nil)
            
    ]
}
