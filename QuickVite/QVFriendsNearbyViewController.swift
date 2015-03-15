//
//  QVFriendsNearbyViewController.swift
//  QuickVite
//
//  Created by Elliot Barer on 2015-03-14.
//  Copyright (c) 2015 Elliot Barer. All rights reserved.
//

import UIKit

class QVFriendsNearbyViewController: UITableViewController, UINavigationControllerDelegate {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("nearbyFriendCell", forIndexPath: indexPath) as UITableViewCell
        let item = friendList[indexPath.row]
        cell.textLabel?.text = item
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}