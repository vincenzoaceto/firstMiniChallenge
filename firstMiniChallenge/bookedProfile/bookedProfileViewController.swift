//
//  bookedProfileViewController.swift
//  firstMiniChallenge
//
//  Created by Daniel Moreano on 12/18/17.
//  Copyright © 2017 Vincenzo Aceto. All rights reserved.
//

import UIKit

class bookedProfileViewController: UIViewController {

    @IBOutlet weak var myPassionsLabel: UILabel!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        var myPassions = ["I love trying new cuisines","Books","Love rock music","Fashionista","Pizza","Still 30","Global trotter"]
        
        var beginPositionX : CGFloat = 0
        var beginPositionY : CGFloat = 0
        var endPositionX : CGFloat = 0
        
        beginPositionX = myPassionsLabel.frame.origin.x
        beginPositionY = myPassionsLabel.frame.origin.y + myPassionsLabel.frame.height + 10
        
        for myPassion in myPassions {
            
            var label = UILabel()
            
            label.text = myPassion
            label.sizeToFit()
            label.frame = CGRect(x:beginPositionX, y: beginPositionY, width: label.frame.width + 15, height: label.frame.height)
            
            endPositionX += label.frame.width + 10
            
            if endPositionX >= myPassionsLabel.frame.width {
                
                beginPositionX = myPassionsLabel.frame.origin.x
                endPositionX = label.frame.width + 10
                beginPositionY += myPassionsLabel.frame.height
                
                label.frame.origin.y = beginPositionY
                label.frame.origin.x = beginPositionX
            }
            
            beginPositionX += label.frame.width + 10
            
            label.layer.borderColor = UIColor.black.cgColor
            label.layer.borderWidth = 0.5
            label.layer.cornerRadius = 10
            label.textAlignment = .center
            
            self.view.addSubview(label)
        }
    }
    
    
    
    @objc
    func test() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
      //  navigationController?.popToRootViewController(animated: true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    

}
