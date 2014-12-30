//
//  ViewController.swift
//  WeeklySchedule
//
//  Created by Yi Chen on 12/29/14.
//  Copyright (c) 2014 YC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var allEvents:[[eventsModel]] = [[],[],[],[],[],[],[]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        allEvents[0].append(eventsModel(myEventsTitle: "CS61B", myEventsLocation: "Evens 5", myDescription: "Learn java with 老头子", myDate: Date.from(day: 8, hour: 1, minutes: 0)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allEvents[section].count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:myCell = tableView.dequeueReusableCellWithIdentifier("myDetailCell") as myCell
        var event = allEvents[indexPath.section][indexPath.row]
        cell.myEvents.text = event.myEventsTitle
        cell.myLocation.text = event.myEventsLocation
        cell.myDate.text = Date.toString(date: event.myDate)
        cell.myDescription = event.myDescription
        return cell
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showTaskDetail" {
            let detailEventsCV:eventsDetails = segue.destinationViewController as eventsDetails
            let indexPath = tableView.indexPathForSelectedRow()
            let events = allEvents[indexPath!.section][indexPath!.row]
            detailEventsCV.indexpaths = indexPath
            detailEventsCV.detailTaskCell = events
            detailEventsCV.mainVC = self
        } else if segue.identifier == "addEventsSeg" {
            let addDetailCV:addEventsController = segue.destinationViewController as addEventsController
            addDetailCV.mainVC = self
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    @IBAction func addButtonPress(sender: UIBarButtonItem) {
        performSegueWithIdentifier("addEventsSeg", sender: self)
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        allEvents[indexPath.section].removeAtIndex(indexPath.row)
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        var empty:String = ""
        if allEvents[section].count == 0 {
            empty = " is Empty 😢"
        }
        if section == 0 {
            return "Monday" + empty
        } else if section == 1 {
            return "Tuesday" + empty
        } else if section == 2 {
            return "Wednesday" + empty
        } else if section == 3 {
            return "Thursday" + empty
        } else if section == 4 {
            return "Friday" + empty
        } else if section == 5 {
            return "Saturday" + empty
        } else {
            return "Sunday" + empty
        }
    }
    
    
    // UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("showTaskDetail", sender: self)
    }
}

