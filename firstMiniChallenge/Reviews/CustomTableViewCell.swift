//
//  CustomTableViewCell.swift
//  firstMiniChallenge
//
//  Created by Baldev Ghelani on 12/15/17.
//  Copyright © 2017 Vincenzo Aceto. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameOfTheReviewer: UILabel!
    @IBOutlet weak var starRatings: CosmosView!
    @IBOutlet weak var reviewBody: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        starRatings.fillMode =  3
        starRatings.updateOnTouch = false
        
        userImage.layer.cornerRadius = userImage.frame.height/2
        userImage.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
