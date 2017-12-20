//
//  CitiesCollectionViewCell.swift
//  firstMiniChallenge
//
//  Created by Marcelo Sotomaior Azevedo on 12/12/17.
//  Copyright © 2017 Vincenzo Aceto. All rights reserved.
//

import UIKit

class CitiesCollectionViewCell: UICollectionViewCell {
 

    @IBOutlet weak var citiesImageView: UIImageView!
    
    @IBOutlet weak var citiesLabel: UILabel!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.citiesImageView.alpha = 0.5
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.citiesImageView.alpha = 1.0
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        self.citiesImageView.alpha = 1.0
    }
}
