//
//  BookingsTableViewCell.swift
//  firstMiniChallenge
//
//  Created by Bilal Abdullah on 16/12/2017.
//  Copyright © 2017 Vincenzo Aceto. All rights reserved.
//

import UIKit

class BookingsTableViewCell: UITableViewCell {
    let greyColor = UIColor(red:0.61, green:0.61, blue:0.61, alpha:1.0)
    let blackColor = UIColor.black
    
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func makeGrey() {
        nameLabel.textColor = greyColor
        surnameLabel.textColor = greyColor
        dateLabel.textColor = greyColor
        locationLabel.textColor = greyColor
    }
    
    func makeBlack() {
        nameLabel.textColor = blackColor
        surnameLabel.textColor = blackColor
        dateLabel.textColor = blackColor
        locationLabel.textColor = blackColor
    }
    
    override open func draw(_ rect: CGRect) {
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2;
        profileImage.clipsToBounds = true;
        
        nameLabel.sizeToFit()
        surnameLabel.sizeToFit()
        dateLabel.sizeToFit()
        nameLabel.sizeToFit()
        locationLabel.sizeToFit()
    }
}
