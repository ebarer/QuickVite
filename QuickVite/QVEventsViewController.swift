//
//  QVEventsViewController.swift
//  QuickVite
//
//  Created by Elliot Barer on 2015-03-14.
//  Copyright (c) 2015 Elliot Barer. All rights reserved.
//

import UIKit

class QVEventsViewController: UITableViewController {
    
    var newEvent: QVEvent?
    var animationInProgress = false
    
    override func viewDidLoad() {
        
        var myPerson = QVPerson(firstName: "farzin", lastName: "faghihi")
        myPerson.getEvents()
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
