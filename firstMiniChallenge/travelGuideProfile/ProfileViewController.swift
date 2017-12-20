//
//  ProfileViewController.swift
//  firstMiniChallenge
//
//  Created by Daniel Moreano on 12/13/17.
//  Copyright © 2017 Vincenzo Aceto. All rights reserved.
//

import UIKit
import JBDatePicker


class ProfileViewController: UIViewController {

 
    //@IBOutlet weak var testimage: UIImageView!
    @IBOutlet weak var myPassionsLabel: UILabel!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var datePicker: JBDatePickerView!
    @IBOutlet weak var monthCalendarLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!

    public var startDate : Date?
    public var endDate : Date?
    public var travelGuide: TravelGuide = TravelGuide.travelGuides[0]
    
    public var costPerDay = 20
    
    private var isStartDate = true
    public var travelGuideSelectedIndex = 0
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        travelGuide = TravelGuide.travelGuides[travelGuideSelectedIndex]
        self.title = travelGuide.name
        
        
        var beginPositionX : CGFloat = 0
        var beginPositionY : CGFloat = 0
        var endPositionX : CGFloat = 0
        
        beginPositionX = myPassionsLabel.frame.origin.x
        beginPositionY = myPassionsLabel.frame.origin.y + myPassionsLabel.frame.height + 10
        
        var myPassions = ["I love trying new cuisines","Books","Love rock music","Fashionista","Pizza","Still 30","Global trotter"]
        
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
            
            self.subView.addSubview(label)
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource  = self
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        datePicker.delegate = self
        collectionView.delegate = self
        collectionView.dataSource  = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "paymentView"{
            
            
            let calendar = NSCalendar.current
            let startingDate = calendar.startOfDay(for: self.startDate!)
            let endingDate = calendar.startOfDay(for: self.endDate!)
            
            var dateComponents = calendar.dateComponents([.day], from: startingDate, to: endingDate)
            
            if dateComponents.day == 0{
                dateComponents.day = 1
            }else{
                dateComponents.day! += 1
            }
            
            let destinationVC = segue.destination as! PaymentViewController
            
            destinationVC.totalCost = costPerDay * dateComponents.day!
            destinationVC.startDate = startDateLabel.text!
            destinationVC.endDate = endDateLabel.text!
            
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == "paymentView" {
            
            if startDateLabel.text == "Select a date" ||
               endDateLabel.text == "Select a date" {
                
                let alert = UIAlertController(title: "Error", message: "You have to set the start and the end Date, before do the booking", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
                return false
            }else{
                return true
            }
            
        }
        
        return true
    }
    
    
}
extension ProfileViewController: UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return Memory.memories.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemoryCell", for: indexPath) as! MemoryCell
        
        cell.memoryImageView.image = Memory.memories[indexPath.row].image
        
        return cell
    }
    
}
extension ProfileViewController: JBDatePickerViewDelegate{
    
    ///Determines if a month should also show the dates of the previous and next month. Defaults to true.
    var shouldShowMonthOutDates: Bool { return true }
    
    
    func didSelectDay(_ dayView: JBDatePickerDayView) {
        
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: dayView.date!)
        let month = calendar.component(.month, from: dayView.date!)
        let day = calendar.component(.day, from: dayView.date!)
        
        
        
        if isStartDate{
            startDate = dayView.date
            endDateLabel.textColor = UIColor(red:0.13, green:0.59, blue:0.95, alpha:1.0)
            startDateLabel.textColor = UIColor.black
            startDateLabel.text = "\(day)/\(month)/\(year)"
            isStartDate = !isStartDate
        }else{
            
            endDate = dayView.date
            let calendar = NSCalendar.current
            let startingDate = calendar.startOfDay(for: self.startDate!)
            let endingDate = calendar.startOfDay(for: self.endDate!)
            
            var dateComponents = calendar.dateComponents([.day], from: startingDate, to: endingDate)
            
            if dateComponents.day! >= 0 {
                //endDate = dayView.date
                startDateLabel.textColor = UIColor(red:0.13, green:0.59, blue:0.95, alpha:1.0)
                endDateLabel.textColor = UIColor.black
                endDateLabel.text = "\(day)/\(month)/\(year)"
                isStartDate = !isStartDate
                
            }else{
                let alertController = UIAlertController(title: "The end date cannot be before the start date", message: "", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                self.present(alertController, animated: true, completion: nil)
            }
            
        }
    }
    
    func didPresentOtherMonth(_ monthView: JBDatePickerMonthView) {
        monthCalendarLabel.text = monthView.monthDescription
    }
    
    func shouldAllowSelectionOfDay(_ date: Date?) -> Bool {
        
        guard let date = date else {return true}
        let comparison = NSCalendar.current.compare(date, to: Date(), toGranularity: .day)
        
        if comparison == .orderedAscending {
            return false
        }
        return true
    }
    
    
    var colorForWeekDaysViewBackground: UIColor {
        return UIColor(red:0.13, green:0.59, blue:0.95, alpha:1.0)
    }
    
    var colorForSelectionCircleForToday: UIColor{
        return UIColor(red:0.13, green:0.59, blue:0.95, alpha:1.0)
    }
    var colorForSelectionCircleForOtherDate: UIColor{
        return UIColor(red:0.13, green:0.59, blue:0.95, alpha:1.0)
    }

}
