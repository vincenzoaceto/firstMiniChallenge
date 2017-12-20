//
//  TravelGuidesCollectionView.swift
//  firstMiniChallenge
//
//  Created by Marcelo Sotomaior Azevedo on 13/12/17.
//  Copyright © 2017 Vincenzo Aceto. All rights reserved.
//

import UIKit

class TravelGuidesCollectionCell: UICollectionViewCell {
    
    
    
//    var guideReviews = ["Name: Paula, 20€/day, Reviews: ","Name: Andrea, 15€/day, Reviews: ","Name: Roberta, 20€/day, Reviews: ","Name: Paulo, 15€/day, Reviews: "]

    
    @IBOutlet weak var guidesImage: UIImageView!
    
    @IBOutlet weak var guidesInfo: UILabel!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.guidesImage.alpha = 0.5
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.guidesImage.alpha = 1.0
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        self.guidesImage.alpha = 1.0
    }
    
//   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//
//        return guideReviews.count
//
//
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TravelGuidesIdentifier", for: indexPath) as! TravelGuidesCollectionView
//        guidesInfo.text = guideReviews[indexPath.row]
//        return cell
//    }
}

 

