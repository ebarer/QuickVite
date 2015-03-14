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
    var typePickerIndex: NSIndexPath?
    var datePickerIndex: NSIndexPath?

    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DoneItem"{

        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        tableView.rowHeight = 43
        switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCellWithIdentifier("addEventType", forIndexPath: indexPath) as UITableViewCell
                return cell
            case 1:
                let cell = tableView.dequeueReusableCellWithIdentifier("addEventTypePicker", forIndexPath: indexPath) as UITableViewCell
                tableView.rowHeight = 0
                typePickerIndex = indexPath
                return cell
            case 2:
                let cell = tableView.dequeueReusableCellWithIdentifier("addEventDate", forIndexPath: indexPath) as UITableViewCell
                return cell
            case 3:
                let cell = tableView.dequeueReusableCellWithIdentifier("addEventDatePicker", forIndexPath: indexPath) as UITableViewCell
                tableView.rowHeight = 0
                datePickerIndex = indexPath
                return cell
            case 4:
                let cell = tableView.dequeueReusableCellWithIdentifier("addEventLocation", forIndexPath: indexPath) as UITableViewCell
                return cell
            default:
                let cell = tableView.dequeueReusableCellWithIdentifier("addEventType", forIndexPath: indexPath) as UITableViewCell
                return cell
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("addEventTypePicker", forIndexPath: typePickerIndex!) as UITableViewCell
            tableView.rowHeight = 164
        case 2:
            let cell = tableView.dequeueReusableCellWithIdentifier("addEventDate", forIndexPath: datePickerIndex!) as UITableViewCell
            tableView.rowHeight = 164
        default:
            return
        }

    }
    
}

