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
    
    @IBOutlet var eventsList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        QVPerson.getEvents(self)
    }
    
    override func viewDidAppear(animated: Bool) {
        if animationInProgress {
            performSegueWithIdentifier("moveToEvent", sender: self)
            animationInProgress = false
        }
        
        //        QVPerson.getEvents(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // Model helper
    func saveEvents(events: [QVEvent]) {
        self.events = events
        eventsList.reloadData()
    }
    
    
    // Table Modification
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("eventListCell", forIndexPath: indexPath) as! UITableViewCell
        
        if let event = events[indexPath.row] as QVEvent? {
            cell.textLabel?.text = event.type
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        newEvent = events[indexPath.row]
    }
    
    
    // Transitions
    @IBAction func unwindToEvent(segue: UIStoryboardSegue) {
        animationInProgress = true
        let source = segue.sourceViewController as! QVAddEventFriendsViewController
        newEvent = source.newEvent
        for invitee in source.invitees {
            invitee.postInvitation()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "moveToEvent") {
            let VC:QVEventViewController = segue.destinationViewController as! QVEventViewController
            if let event = newEvent {
                VC.aEvent = event
            }
        }
        
        if (segue.identifier == "eventsToEvent") {
            let VC:QVEventViewController = segue.destinationViewController as! QVEventViewController
            VC.aEvent = newEvent
        }
    }
}
