//
//  TimelineTableViewController.swift
//  firstMiniChallenge
//
//  Created by Bilal Abdullah on 19/12/2017.
//  Copyright © 2017 Vincenzo Aceto. All rights reserved.
//

import UIKit

class BookingsTableViewController: UITableViewController {
    let lineColor = UIColor(red:0.00, green:0.38, blue:1.00, alpha:1.0)
    let pointColor = UIColor(red:0.33, green:0.63, blue:0.99, alpha:1.0)
    
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
        
        let timelineTableViewCellNib = UINib(nibName: "TimelineTableViewCell", bundle: Bundle(for: TimelineTableViewCell.self))
        self.tableView.register(timelineTableViewCellNib, forCellReuseIdentifier: "TimelineTableViewCell")
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
        return 50
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  headerCell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as! HeaderTableViewCell

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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineTableViewCell", for: indexPath) as! TimelineTableViewCell
        
        guard let sectionData = data[indexPath.section] else {
            return cell
        }
        
        indexPath.section == 1 ? cell.makeGrey() : cell.makeBlack()
        
        let (name, surname, date, location, profile) = sectionData[indexPath.row]
        var timelineFrontColor = UIColor.clear
        if (indexPath.row > 0) {
            timelineFrontColor = lineColor
        }
        
        cell.timelinePoint = TimelinePoint(color: pointColor, filled: false)
        cell.timeline.frontColor = timelineFrontColor
        cell.timeline.backColor = lineColor
        cell.titleLabel.text = location
        cell.lineInfoLabel.text = nil
        cell.nameLabel.text = name
        cell.surnameLabel.text = surname
        cell.dateLabel.text = date
        cell.profileImageView.image = UIImage(named: profile!)
        cell.illustrationImageView.image = UIImage(named: "airport")
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let sectionData = data[indexPath.section] else {
            return
        }
    
        self.performSegue(withIdentifier: "bookedProfile", sender: self)
        
        print(sectionData[indexPath.row])
    }
}
