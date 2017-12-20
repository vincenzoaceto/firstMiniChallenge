//
//  HomepageViewController.swift
//  firstMiniChallenge
//
//  Created by Vincenzo Aceto on 11/12/2017.
//  Copyright © 2017 Vincenzo Aceto. All rights reserved.
//

import UIKit
import MapKit

class HomepageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBAction func unwindToHomepage(segue:UIStoryboardSegue)
    {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    
    
    
    
    
    
    
    @IBOutlet weak var tblSearch: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    
    
    
    
    
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
    
    
    
    
    
    
    
    
    
    
    var cityArray = ["Agra", "Rome", "Paris"]
    var guideArray = ["Guide1", "Guide2", "Guide3", "Guide4"]
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 1 {
            performSegue(withIdentifier: cityArray[indexPath.row], sender: nil)
            
            
            
        } else if collectionView.tag == 2{
//            performSegue(withIdentifier:  guideArray[indexPath.row], sender: nil)
            
        }
        
    }
    
    
    
    var isSearch : Bool = false
    var arrCity = ["Agra","Rome","Paris"];
    var arrFilter:[String] = []
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblSearch.isHidden = true
        self.tblSearch.dataSource = self
        self.tblSearch.delegate = self
        self.searchBar.delegate = self
        self.tabBarController?.tabBar.isHidden = false

        
        self.tabBarController?.tabBar.items![2].image = #imageLiteral(resourceName: "avatar")
        self.tabBarController?.tabBar.items![2].selectedImage = #imageLiteral(resourceName: "avatar-selected")
        self.tabBarController?.tabBar.items![2].title = "Profile"
        
        // Do any additional setup after loading the view.
    }
   
   
    
    //MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "goToResult", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    //MARK: UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(isSearch) {
            return arrFilter.count
        }
        return arrCity.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
        configureCell(cell: cell, forRowAtIndexPath: indexPath as NSIndexPath)
        return cell
    }
    
    func configureCell(cell: UITableViewCell, forRowAtIndexPath: NSIndexPath) {
        if(isSearch){
            cell.textLabel?.text = arrFilter[forRowAtIndexPath.row]
        } else {
            cell.textLabel?.text = arrCity[forRowAtIndexPath.row];
        }
    }
    
    
    //MARK: UISearchbar delegate
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.tblSearch.isHidden = false
        searchBar.showsCancelButton = true
        isSearch = true;
        self.tblSearch.reloadData()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.tblSearch.isHidden = true
        searchBar.resignFirstResponder()
        isSearch = false;
        self.tblSearch.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
        isSearch = false;
        self.tblSearch.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearch = false;
        self.tblSearch.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.characters.count == 0 {
            isSearch = false;
            self.tblSearch.reloadData()
            
        } else {
            arrFilter = arrCity.filter({ (text) -> Bool in
                let tmp: NSString = text as NSString
                let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
                return range.location != NSNotFound
            })
            if(arrFilter.count == 0){
                isSearch = false;
            } else {
                isSearch = true;
            }
            self.tblSearch.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            if let resultVC = segue.destination as? ResultViewController {
                let numeroDaCelula = self.tblSearch.indexPathForSelectedRow!.row
                if isSearch {
                    resultVC.citySelected = self.arrFilter[numeroDaCelula] // arrumar isso
                } else {
                    // Fazer o mesmo pra esse caso onde nao esta no modo search
                    return
                }
            }
        }
    }
}

