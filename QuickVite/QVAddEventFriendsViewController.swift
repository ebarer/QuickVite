//
//  QVAddEventFriendsViewController.swift
//  QuickVite
//
//  Created by Elliot Barer on 2015-03-14.
//  Copyright (c) 2015 Elliot Barer. All rights reserved.
//

import UIKit

class QVAddEventFriendsViewController: UITableViewController, UINavigationControllerDelegate {
    
    var newEvent: QVEvent?
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("friendCell", forIndexPath: indexPath) as UITableViewCell
        let item = friendList[indexPath.row]
        cell.textLabel?.text = item
        
//      cell.accessoryType = .Checkmark
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "eventCreateSegue") {
            self.newEvent?.postEvent()
            dismissViewControllerAnimated(true, completion: nil)

            var eventVC:QVEventViewController = segue.destinationViewController as QVEventViewController
        }
    }
    
}