//
//  QVEventsViewController.swift
//  QuickVite
//
//  Created by Elliot Barer on 2015-03-14.
//  Copyright (c) 2015 Elliot Barer. All rights reserved.
//

import UIKit

class QVEventsViewController: UITableViewController, UITableViewDataSource {
    
    var newEvent: QVEvent?
    var invitees = [QVPerson]()
    var events = [QVEvent]()
    var animationInProgress = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func saveEvents(events: [QVEvent]) {
        self.events = events
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("attendeeCell", forIndexPath: indexPath) as UITableViewCell
        
        if let event = events[indexPath.row] as QVEvent? {
            cell.textLabel?.text = event.type
        }
        
        return cell
    }
    
    override func viewDidAppear(animated: Bool) {
        if animationInProgress {
            performSegueWithIdentifier("moveToEvent", sender: self)
            animationInProgress = false
        }
    }
    
    @IBAction func unwindToEvent(segue: UIStoryboardSegue) {
        animationInProgress = true
        let source = segue.sourceViewController as QVAddEventFriendsViewController
        newEvent = source.newEvent
        for invitee in source.invitees {
            invitee.postInvitation()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "moveToEvent") {
            let VC:QVEventViewController = segue.destinationViewController as QVEventViewController
            if let event = newEvent {
                VC.aEvent = event
                VC.aEvent?.postEvent()
            }
        }
    }
}
