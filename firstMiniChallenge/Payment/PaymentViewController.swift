//
//  PaymentViewController.swift
//  firstMiniChallenge
//
//  Created by Daniel Moreano on 12/18/17.
//  Copyright © 2017 Vincenzo Aceto. All rights reserved.
//

import UIKit
import EventKit

class PaymentViewController: UIViewController {

    public var startDate = ""
    public var endDate = ""
    public var totalCost = 0
    
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var totalCostLabel: UILabel!
    
    private let store: EKEventStore = EKEventStore()
    private var userDidGivePermission: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startDateLabel.text = startDate
        endDateLabel.text = endDate
        totalCostLabel.text = String(totalCost) + "€"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "bookedTravelGuideProfile" {
            createEventinTheCalendar(with: "XploreEasy: Travel to Agria", forDate: Date(), toDate: Date())
        }
    }
    
    
    
    
    
    func createEventinTheCalendar(with title:String, forDate eventStartDate:Date, toDate eventEndDate:Date) {
        
        //Verify if we have permission to add an event to the calendar
        store.requestAccess(to: .event) { (success, error) in
            
            if  error == nil {
                
                //Create an event
                let event = EKEvent.init(eventStore: self.store)
                
                //Assign a title, calendar and specify if is all day or not
                event.title = title
                event.calendar = self.store.defaultCalendarForNewEvents
                event.isAllDay = true
                
                
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd/MM/yyyy"
                
                guard let eventStartDate = dateFormatter.date(from: self.startDate),
                    let eventEndDate = dateFormatter.date(from: self.endDate) else {
                    fatalError("ERROR: Date conversion failed due to mismatched format.")
                }
                
                let date = Date()
                var dateComponents = DateComponents()
                
                event.startDate = eventStartDate
                event.endDate = eventEndDate
                
                let alarm = EKAlarm.init()
                event.addAlarm(alarm)
                
                do {
                    try self.store.save(event, span: .thisEvent)
                    
                    let alertController = UIAlertController(title: "The Booking was added to your calendar", message: "", preferredStyle: UIAlertControllerStyle.alert)
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                    self.present(alertController, animated: true, completion: nil)
                    
                } catch let error as NSError {
                    print("failed to save event with error : \(error)")
                    self.userDidGivePermission = false
                }
                
            } else {
                self.userDidGivePermission = false
            }
            
            
            if  self.userDidGivePermission == false {
                
                let alert = UIAlertController(title: "Settings", message: "Give permission to add the booking to your calendar", preferredStyle: UIAlertControllerStyle.alert)
                self.present(alert, animated: true, completion: nil)
                alert.addAction(UIAlertAction(title: "Go to settings", style: .default, handler: { action in
                    switch action.style{
                    case .default: UIApplication.shared.openURL(URL(string: UIApplicationOpenSettingsURLString)!)
                    case .cancel:
                        print("Cancel")
                    case .destructive:
                        print("destructivet")
                    }
                }))
            }
        }
        
    }

}
