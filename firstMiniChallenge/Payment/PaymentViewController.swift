//
//  PaymentViewController.swift
//  firstMiniChallenge
//
//  Created by Daniel Moreano on 12/18/17.
//  Copyright © 2017 Vincenzo Aceto. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {

    public var startDate = ""
    public var endDate = ""
    public var totalCost = 0
    
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var totalCostLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startDateLabel.text = startDate
        endDateLabel.text = endDate
        totalCostLabel.text = String(totalCost) + "€"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
