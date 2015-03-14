//
//  QVInvitationViewController.swift
//  QuickVite
//
//  Created by Gurinder Hans on 3/14/15.
//  Copyright (c) 2015 Elliot Barer. All rights reserved.
//

import UIKit

class QVInvitationViewController: UITableViewController {
    var itemList = ["Cat", "Bird", "Brick"]
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell", forIndexPath: indexPath) as UITableViewCell
        
        let item = itemList[indexPath.row]
        
        cell.textLabel?.text = item.name
    }
}
