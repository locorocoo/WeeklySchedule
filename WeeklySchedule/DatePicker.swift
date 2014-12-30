//
//  DatePicker.swift
//  WeeklySchedule
//
//  Created by Yi Chen on 12/30/14.
//  Copyright (c) 2014 YC. All rights reserved.
//

import Foundation

class Date {
    class func from (#day:Int, hour:Int, minutes:Int) -> NSDate{
        
        var component = NSDateComponents()
        component.day = day
        component.hour = hour
        component.minute = minutes
        
        var gergorainCalander = NSCalendar(identifier: NSGregorianCalendar)!
        
        var date = gergorainCalander.dateFromComponents(component)
        
        return date!
    }
    
    class func toString(#date: NSDate) ->String {
        let dateFormater = NSDateFormatter()
        dateFormater.dateFormat = "hh:mm a"
        let dateString = dateFormater.stringFromDate(date)
        return dateString
    }
}