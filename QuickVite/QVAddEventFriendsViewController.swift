//
//  QVAddEventFriendsViewController.swift
//  QuickVite
//
//  Created by Elliot Barer on 2015-03-14.
//  Copyright (c) 2015 Elliot Barer. All rights reserved.
//

import UIKit

class QVAddEventFriendsViewController: UITableViewController, UINavigationControllerDelegate {
    
    var newEvent:QVEvent?
    var invitees = [QVInvitation]()
    var checkedRows = [Int]()
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
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
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.accessoryType = .Checkmark
        
        if let nameStr = cell?.textLabel?.text {
            var name = split(nameStr) {$0 == " "}
            var nameFirst:String = name[0]
            var nameLast:String = name[1]
            invitees.append(QVInvitation(userImage: nil, firstName: nameFirst, lastName: nameLast, type: newEvent!.type, when: newEvent!.date))
        }
        
        checkedRows.append(indexPath.row)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}