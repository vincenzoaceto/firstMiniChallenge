//
//  BookingsTableViewController.swift
//  firstMiniChallenge
//
//  Created by Bilal Abdullah on 16/12/2017.
//  Copyright © 2017 Vincenzo Aceto. All rights reserved.
//

import UIKit
import Firebase

class BookingsTableViewController: UITableViewController {
    // Name, Surname, Date, Location, Profile Image
    let data:[Int: [(String, String, String?, String?, String?)]] = [0:[
        ("Maria", "Corsa", "10/11/17", "Milan", "Guide1"),
        ("Maria", "Corsa", "10/11/17", "Milan", "Guide1"),
        ("Maria", "Corsa", "10/11/17", "Milan", "Guide1"),
        ("Maria", "Corsa", "10/11/17", "Milan", "Guide1")
        ], 1:[
            ("Maria", "Corsa", "10/11/17", "Milan", "Guide1"),
            ("Maria", "Corsa", "10/11/17", "Milan", "Guide1"),
            ("Maria", "Corsa", "10/11/17", "Milan", "Guide1"),
            ("Maria", "Corsa", "10/11/17", "Milan", "Guide1"),
            ("Maria", "Corsa", "10/11/17", "Milan", "Guide1"),
            ("Maria", "Corsa", "10/11/17", "Milan", "Guide1"),
            ("Maria", "Corsa", "10/11/17", "Milan", "Guide1"),
            ("Maria", "Corsa", "10/11/17", "Milan", "Guide1"),
            ("Maria", "Corsa", "10/11/17", "Milan", "Guide1"),
            ("Maria", "Corsa", "10/11/17", "Milan", "Guide1"),
            ("Maria", "Corsa", "10/11/17", "Milan", "Guide1")
        ]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionData = data[section] else {
            return 0
        }
        return sectionData.count
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  headerCell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as! BookingsTableViewHeaderCell
        
        switch (section) {
        case 0:
            headerCell.headerLabel.text = "Upcoming";
        case 1:
            headerCell.headerLabel.text = "Completed";
            headerCell.headerLabel.textColor = UIColor(red:0.29, green:0.29, blue:0.29, alpha:1.0)
        default:
            headerCell.headerLabel.text = "Completed";
        }
        
        return headerCell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Upcoming" : "Completed"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookingsTableViewCell", for: indexPath) as! BookingsTableViewCell
        
        guard let sectionData = data[indexPath.section] else {
            return cell
        }
        
        indexPath.section == 1 ? cell.makeGrey() : cell.makeBlack()
        
        let (name, surname, date, location, profile) = sectionData[indexPath.row]
        
        cell.nameLabel.text = name
        cell.surnameLabel.text = surname
        cell.dateLabel.text = date
        cell.locationLabel.text = location
        cell.profileImage.image = UIImage(named: profile!)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let sectionData = data[indexPath.section] else {
            return
        }

        print(sectionData[indexPath.row])
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

}
