//
//  QVAddEventViewController.swift
//  QuickVite
//
//  Created by Elliot Barer on 2015-03-13.
//  Copyright (c) 2015 Elliot Barer. All rights reserved.
//

import UIKit

class QVAddEventViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {
    
    var newEvent: QVEvent?

    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateValue: UILabel!
    
    
    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DoneItem"{

        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func viewDidLoad() {
        datePicker.minimumDate = NSDate()
        
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        dateValue.text = dateFormatter.stringFromDate(datePicker.date)
    }
    
    @IBAction func setDate(datePicker:UIDatePicker) {
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        dateValue.text = dateFormatter.stringFromDate(datePicker.date)
    }
    
}

