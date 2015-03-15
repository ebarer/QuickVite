//
//  QVEvent.swift
//  QuickVite
//
//  Created by Farzin Faghihi on 2015-03-13.
//  Copyright (c) 2015 Elliot Barer. All rights reserved.
//

import Foundation

class QVEvent: NSObject {
    
    
    var eventID: String
    var ownerID: String
    var type: String
    var date: NSDate?
    var location: String?
    
    init(ownerID: String, type: String, date dateParam: NSDate?, location locationParam: String?) {
        self.type = type
        self.ownerID = ownerID
        self.eventID = "0"

        if let newDate = dateParam {
            self.date = newDate
        }
        
        if let newLocation = locationParam {
            self.location = newLocation
        }
    }
    
    func getEvent() {
        let urlAsString = VQ.url + "/persons"
        let url = NSURL(string: urlAsString)!
        let request = NSURLRequest(URL: url)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response, data, error) -> Void in
            var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options:nil, error: nil) as NSDictionary

        })
    }
    
    func postEvent() {
        let urlAsString = VQ.url + "/quickvite/api/createEvent"
        let url = NSURL(string: urlAsString)!
        let request = NSMutableURLRequest(URL: url)
        
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-DD hh:mm" //format style. Browse online to get a format that fits your needs.
        var dateString = dateFormatter.stringFromDate(self.date!)
        
        var dict = ["ownerID": self.ownerID, "type": self.type, "date": dateString]
        
        //checking if we have a location to had, if not it will crash passing in nil to dictionary
        if let loc = self.location {
            dict["location"] = loc
        }
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.HTTPMethod = "POST"
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(dict, options: nil, error: nil)
        
        var err: NSError?
        
        // @Farzin: Need to handle optional return
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response, data, error) -> Void in
            if let jsonResult = NSJSONSerialization.JSONObjectWithData(data, options:nil, error:&err) as? NSDictionary {
                // json will parse numbers as integers
                let id = jsonResult["id"] as NSNumber
                self.eventID = id.stringValue
            }
        })
    }

    func getAttendees(controller: QVEventViewController) {
        //fix url to take event ID
        let urlAsString = VQ.url + "/quickvite/api/getEventPeople/1"
        let url = NSURL(string: urlAsString)!
        let request = NSMutableURLRequest(URL: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.HTTPMethod = "GET"
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response, data, error) -> Void in
            if let jsonResult = NSJSONSerialization.JSONObjectWithData(data, options:nil, error:nil) as? NSDictionary {
                var QVPersons = [QVPerson]()
                var persons = jsonResult["persons"] as [NSDictionary]
                for person: NSDictionary in persons {
                    var newQVPerson = QVPerson(firstName: person["firstName"] as String, lastName: person["lastName"] as String)
                    QVPersons.append(newQVPerson)
                }
                controller.saveAttendees(QVPersons);
            }
        })
    }
}