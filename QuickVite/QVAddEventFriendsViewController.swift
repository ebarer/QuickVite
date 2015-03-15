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
    
    var checkedRows = [Int]()
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Fetch Item
        
        let cell = tableView.dequeueReusableCellWithIdentifier("friendCell", forIndexPath: indexPath) as UITableViewCell
        let item = friendList[indexPath.row]
        cell.textLabel?.text = item
        
        if contains(checkedRows, indexPath.row) {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println(indexPath)
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.accessoryType = .Checkmark
        checkedRows.append(indexPath.row)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func doneEventCreation(sender: UIBarButtonItem) {
        self.newEvent?.postEvent()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}