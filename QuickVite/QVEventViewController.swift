//
//  QVEventViewController.swift
//  QuickVite
//
//  Created by Elliot Barer on 2015-03-13.
//  Copyright (c) 2015 Elliot Barer. All rights reserved.
//

import UIKit

class QVEventViewController: UIViewController, UITableViewDataSource {
    
    var attendees:[QVPerson]?
    var aEvent: QVEvent?
    
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventLocation: UILabel!
    @IBOutlet weak var bgPhoto: UIImageView!
    
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
            eventDate.text = dateFormatter.stringFromDate(event.date!)
            
            eventLocation.text = event.location
            
            aEvent?.getAttendees(self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let ppl = attendees {
            return ppl.count
        } else {
            return 10
        }
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("attendeeCell", forIndexPath: indexPath) as UITableViewCell
//        cell.textLabel?.text = "\(attendees[indexPath.row].firstName) \(attendees[indexPath.row].lastName)"
        cell.textLabel?.text = "Attendee"
        return cell
    }
    
    func saveAttendees(persons: [QVPerson]) {
        println(persons[0].firstName);
    }
}

