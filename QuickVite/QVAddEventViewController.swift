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
    
    @IBOutlet weak var eventType: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateValue: UILabel!
    @IBOutlet weak var eventLocation: UILabel!
    
    @IBOutlet weak var nextEvent: UIBarButtonItem!

    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        eventType.resignFirstResponder()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "addEventNext") {
            newEvent = QVEvent(type: eventType.text, date: datePicker.date, location: eventLocation.text)
            let VC:QVAddEventFriendsViewController = segue.destinationViewController as QVAddEventFriendsViewController
            VC.newEvent = newEvent
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
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        eventType.resignFirstResponder()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

