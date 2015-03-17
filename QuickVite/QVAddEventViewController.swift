//
//  QVAddEventViewController.swift
//  QuickVite
//
//  Created by Elliot Barer on 2015-03-13.
//  Copyright (c) 2015 Elliot Barer. All rights reserved.
//

import UIKit

class QVAddEventViewController: UITableViewController, UITextFieldDelegate {
    
    var newEvent: QVEvent?
    
    @IBOutlet var fbLoginView: FBLoginView!
    @IBOutlet weak var eventType: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateValue: UILabel!
    @IBOutlet weak var eventLocation: UILabel!
    
    @IBOutlet weak var nextEvent: UIBarButtonItem!

    @IBAction func cancel(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
        eventType.resignFirstResponder()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var facebookID = NSUserDefaults.standardUserDefaults().objectForKey("facebookID") as! String;
        
        if (segue.identifier == "addEventNext") {
            newEvent = QVEvent(ownerID: facebookID, type: eventType.text, date: datePicker.date, location: eventLocation.text!)
            let VC:QVAddEventFriendsViewController = segue.destinationViewController as! QVAddEventFriendsViewController
            VC.newEvent = newEvent
            VC.newEvent?.postEvent()
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func viewDidLoad() {
        datePicker.minimumDate = NSDate()
        
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        
        datePicker.date = NSDate()
        dateValue.text = dateFormatter.stringFromDate(datePicker.date)
        
        eventType.becomeFirstResponder()
        
        nextEvent.enabled = false
    }
    
    @IBAction func setDate(datePicker:UIDatePicker) {
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        dateValue.text = dateFormatter.stringFromDate(datePicker.date)
    }
    
    @IBAction func setType(textField:UITextField) {
        if (textField.text.isEmpty) {
            nextEvent.enabled = false
        } else {
            nextEvent.enabled = true
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

