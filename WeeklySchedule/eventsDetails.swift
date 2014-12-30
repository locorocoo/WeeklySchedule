//
//  eventsDetails.swift
//  WeeklySchedule
//
//  Created by Yi Chen on 12/29/14.
//  Copyright (c) 2014 YC. All rights reserved.
//

import UIKit

class eventsDetails: UIViewController {

    var detailTaskCell:eventsModel!
    
    var indexpaths:NSIndexPath!
    var mainVC:ViewController!
    
    @IBOutlet weak var eventsTitleTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventsTitleTextField.text = detailTaskCell.myEventsTitle
        locationTextField.text = detailTaskCell.myEventsLocation
        descriptionTextField.text = detailTaskCell.myDescription
        datePicker.date = detailTaskCell.myDate
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonPressed(sender: UIBarButtonItem) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

    @IBAction func saveButtonPressed(sender: UIBarButtonItem) {
        var events = eventsModel(myEventsTitle: eventsTitleTextField.text, myEventsLocation: locationTextField.text, myDescription: descriptionTextField.text, myDate: datePicker.date)
        
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
        
        mainVC.allEvents[indexpaths.section].removeAtIndex(indexpaths.row)
        mainVC.tableView.reloadData()
        self.navigationController?.popViewControllerAnimated(true)

    }
}
