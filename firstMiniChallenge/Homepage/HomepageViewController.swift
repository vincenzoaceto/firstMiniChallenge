//
//  HomepageViewController.swift
//  firstMiniChallenge
//
//  Created by Vincenzo Aceto on 11/12/2017.
//  Copyright © 2017 Vincenzo Aceto. All rights reserved.
//

import UIKit

class HomepageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    
    @IBOutlet weak var TravelGuidesCollectionView: UICollectionView!
    
    @IBOutlet weak var CitiesAvailableCollectionView: UICollectionView!
    
    @IBOutlet weak var ProfileImage: UIImageView!
    
    var travelGuides = [#imageLiteral(resourceName: "Guide1"),#imageLiteral(resourceName: "Guide2"),#imageLiteral(resourceName: "Guide3"),#imageLiteral(resourceName: "Guide4")]
    var citiesAvailable = [#imageLiteral(resourceName: "brandenburger"),#imageLiteral(resourceName: "Rome"),#imageLiteral(resourceName: "Paris")]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView.tag == 2 {
            return travelGuides.count
        }else {
            //            return emojis.count
            return citiesAvailable.count
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CitiesIdentifier", for: indexPath) as! CitiesCollectionViewCell
            cell.citiesImageView.image = travelGuides[indexPath.row]
            //            cell.event = sentencesForIcons[indexPath.row]
            
            return cell
            
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GuidesIdentifier", for: indexPath) as! TravelGuidesCollectionView
            
            cell.guidesImageView.image = citiesAvailable[indexPath.row]
            
            return cell
        }
    }
}
  /*  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


