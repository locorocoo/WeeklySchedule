//
//  myCell.swift
//  WeeklySchedule
//
//  Created by Yi Chen on 12/29/14.
//  Copyright (c) 2014 YC. All rights reserved.
//

import UIKit

class myCell: UITableViewCell {

    @IBOutlet weak var myEvents: UILabel!
    @IBOutlet weak var myDate: UILabel!
    @IBOutlet weak var myLocation: UILabel!
    var myDescription:String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
