//
//  addEventsController.swift
//  WeeklySchedule
//
//  Created by Yi Chen on 12/30/14.
//  Copyright (c) 2014 YC. All rights reserved.
//

import UIKit

class addEventsController: UIViewController {

    var mainVC: ViewController!
    var myIndexPath:NSIndexPath!
    
    @IBOutlet weak var eventTitle: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var descriptionTextLabel: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonPressed(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saveButtonPressed(sender: UIBarButtonItem) {
        var events = eventsModel(myEventsTitle: eventTitle.text, myEventsLocation: location.text, myDescription: descriptionTextLabel.text, myDate: datePicker.date)
        
        let eventss = NSCalendar(calendarIdentifier: NSGregorianCalendar)!.components(.WeekdayCalendarUnit, fromDate: datePicker.date)
        println(eventss.weekday)

        switch eventss.weekday {
        case 1 :mainVC.allEvents[6].append(events)
        case 2 :mainVC.allEvents[0].append(events)
        case 3 :mainVC.allEvents[1].append(events)
        case 4 :mainVC.allEvents[2].append(events)
        case 5 :mainVC.allEvents[3].append(events)
        case 6 :mainVC.allEvents[4].append(events)
        case 7 :mainVC.allEvents[5].append(events)
        default:println("error \(eventss.weekday)")
        }
        
        mainVC.tableView.reloadData()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
