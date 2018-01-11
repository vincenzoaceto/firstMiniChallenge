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
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var placeSelectedIndex = 0
    var travelGuideSelectedIndex = 0
    var memories = [Memory]()
    
    
    @IBAction func goBackToHomepageWhenTapped(_ sender: Any)
    {
        performSegue(withIdentifier: "unwindToHomepage", sender: self)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        memories = Memory.memories()
        
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
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    

}
extension bookedProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return memories.count
        }
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemoryCell", for: indexPath) as! MemoryCell
            
            cell.memoryImageView.image = memories[indexPath.row].image
            
            return cell
        }
    
    
    
}
