//
//  Memory.swift
//  firstMiniChallenge
//
//  Created by Daniel Moreano on 12/20/17.
//  Copyright © 2017 Vincenzo Aceto. All rights reserved.
//

import Foundation
import UIKit

struct Memory {
    var name: String
    var image: UIImage
    
    static var memories =
        [
            Memory(name: "Colosseum", image: UIImage(named: "colosseum")!),
            Memory(name: "Dome", image: UIImage(named: "dome")!),
            Memory(name: "Rome Church", image: UIImage(named: "rome_church")!),
            Memory(name: "Rome Street", image: UIImage(named: "rome_street")!),
            Memory(name: "Trevi Fountain", image: UIImage(named: "trevi-fountain")!),
            Memory(name: "Vetican Italy", image: UIImage(named: "vetican_italy")!),
            Memory(name: "Vetican Square", image: UIImage(named: "vetican_square")!),
            Memory(name: "brandenburger", image: UIImage(named: "brandenburger")!)
            
    ]
}
