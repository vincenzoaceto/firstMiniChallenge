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
    
    
 /*    static var memories =
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
   */
    static func fillData() -> [Memory] {
        
        var memories = [Memory]()
        
        memories.append(Memory(name: "Colosseum", image: UIImage(named: "colosseum")!))
        memories.append(Memory(name: "Dome", image: UIImage(named: "dome")!))
        memories.append(Memory(name: "Rome Church", image: UIImage(named: "rome_church")!))
        memories.append(Memory(name: "Rome Street", image: UIImage(named: "rome_street")!))
        memories.append(Memory(name: "Trevi Fountain", image: UIImage(named: "trevi-fountain")!))
        memories.append(Memory(name: "Vetican Italy", image: UIImage(named: "vetican_italy")!))
        memories.append(Memory(name: "Vetican Square", image: UIImage(named: "vetican_square")!))
        memories.append(Memory(name: "brandenburger", image: UIImage(named: "brandenburger")!))
        
        return memories
    }
    
    public static func memories() -> [Memory]{
        
        var memories = Memory.fillData()
        var shuffled = [Memory]();
        
        for i in 0 ..< memories.count
        {
            let rand = Int(arc4random_uniform(UInt32(memories.count)))
            
            shuffled.append(memories[rand])
            memories.remove(at: rand)
            
        }
        return shuffled
    }
}


