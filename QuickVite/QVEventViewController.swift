//
//  QVEventViewController.swift
//  QuickVite
//
//  Created by Elliot Barer on 2015-03-13.
//  Copyright (c) 2015 Elliot Barer. All rights reserved.
//

import UIKit

class QVEventViewController: UIViewController, UITableViewDataSource {
    
    var aEvent:QVEvent?
    var attendees = [QVPerson]()
    
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventLocation: UILabel!
    @IBOutlet weak var bgPhoto: UIImageView!
    @IBOutlet weak var attendeeList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let event = aEvent {
            self.title = event.type
            eventName.text = event.type
            
            switch event.type {
                case "Coffee":
                    bgPhoto.image = UIImage(named: "Coffee")
                case "Movies":
                    bgPhoto.image = UIImage(named: "Movies")
                default:
                    bgPhoto.image = UIImage(named: "Other")
            }
            
            self.navigationController?.navigationBar.barStyle = UIBarStyle.BlackTranslucent;
            
            var dateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
            dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
            eventDate.text = dateFormatter.stringFromDate(event.date)
            
            eventLocation.text = event.location
            
            event.getAttendees(self)
        }
    }
    
    func saveAttendees(persons: [QVPerson]) {
        attendees = persons
        attendeeList.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return attendees.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("attendeeCell", forIndexPath: indexPath) as UITableViewCell
        
        if let person = attendees[indexPath.row] as QVPerson? {
            cell.textLabel?.text = person.firstName + " " + person.lastName
        }
        
        return cell
    }
}

