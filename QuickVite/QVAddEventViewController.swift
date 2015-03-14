//
//  QVAddEventViewController.swift
//  QuickVite
//
//  Created by Elliot Barer on 2015-03-13.
//  Copyright (c) 2015 Elliot Barer. All rights reserved.
//

import UIKit

class QVAddEventViewController: UITableViewController {
    
    var newEvent: QVEvent?
    
    @IBOutlet weak var nextFriends: UIBarButtonItem!

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
                let cell = tableView.dequeueReusableCellWithIdentifier("addEventType", forIndexPath: indexPath) as! UITableViewCell
                return cell
            case 1:
                tableView.rowHeight = 178
                let cell = tableView.dequeueReusableCellWithIdentifier("addEventTypePicker", forIndexPath: indexPath) as! UITableViewCell
                return cell
            case 2:
                let cell = tableView.dequeueReusableCellWithIdentifier("addEventDate", forIndexPath: indexPath) as! UITableViewCell
                return cell
            case 3:
                tableView.rowHeight = 178
                let cell = tableView.dequeueReusableCellWithIdentifier("addEventDatePicker", forIndexPath: indexPath) as! UITableViewCell
                return cell
            case 4:
                let cell = tableView.dequeueReusableCellWithIdentifier("addEventLocation", forIndexPath: indexPath) as! UITableViewCell
                return cell
            default:
                let cell = tableView.dequeueReusableCellWithIdentifier("addEventType", forIndexPath: indexPath) as! UITableViewCell
                return cell
        }
    }
    
}

