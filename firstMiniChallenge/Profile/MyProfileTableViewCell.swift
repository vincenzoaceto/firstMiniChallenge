//
//  MyProfileTableViewCell.swift
//  firstMiniChallenge
//
//  Created by Matteo vena on 19/12/17.
//  Copyright © 2017 Vincenzo Aceto. All rights reserved.
//

import UIKit

class MyProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var informazioni: UILabel!
    @IBOutlet weak var titolo: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
