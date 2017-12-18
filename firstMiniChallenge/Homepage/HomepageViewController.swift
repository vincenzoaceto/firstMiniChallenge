//
//  HomepageViewController.swift
//  firstMiniChallenge
//
//  Created by Vincenzo Aceto on 11/12/2017.
//  Copyright © 2017 Vincenzo Aceto. All rights reserved.
//

import UIKit

class HomepageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    override func viewDidLoad() {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    
    @IBOutlet weak var travelGuidesCollectionView: UICollectionView!
    
    
    @IBOutlet weak var CitiesAvailableCollectionView: UICollectionView!
    
    
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
            cell.citiesImageView.image = citiesAvailable[indexPath.row]
            //            cell.event = sentencesForIcons[indexPath.row]
            
            return cell
            
        }else {
           
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TravelGuidesIdentifier", for: indexPath) as! TravelGuidesCollectionView
            
            print(travelGuides.count)
            print(indexPath.row)
            cell.travelGuidesCollectionView.image = travelGuides[indexPath.row]
            
            return cell
            
        }
    }
    
   var cityArray = ["Rome"]
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 1 {
            performSegue(withIdentifier: cityArray[indexPath.row], sender: nil)

        } else if collectionView.tag == 2{
         //   performSegue(withIdentifier: "test", sender: nil)

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


