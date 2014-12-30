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
        var event = eventsModel(myEventsTitle: eventsTitleTextField.text, myEventsLocation: locationTextField.text, myDescription: descriptionTextField.text, myDate: datePicker.date)
        
        mainVC.allEvents[indexpaths.section][indexpaths.row] = event
        mainVC.tableView.reloadData()
        self.navigationController?.popViewControllerAnimated(true)

    }
}
