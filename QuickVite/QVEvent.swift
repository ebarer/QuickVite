//
//  QVEvent.swift
//  QuickVite
//
//  Created by Farzin Faghihi on 2015-03-13.
//  Copyright (c) 2015 Elliot Barer. All rights reserved.
//

import Foundation

class QVEvent: NSObject {
    
    var type: String
    var date: NSDate?
    var location: String?
    
    init(type: String, date dateParam: NSDate?, location locationParam: String?) {
        self.type = type
        
        if let newDate = dateParam {
            self.date = newDate
        }
        
        if let newLocation = locationParam {
            self.location = newLocation
        }
    }
    
    func getEvent() {
        let urlAsString = "http://206.12.55.70:5000/persons"
        let url = NSURL(string: urlAsString)!
        let request = NSURLRequest(URL: url)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response, data, error) -> Void in
            var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options:nil, error: nil) as NSDictionary

        })
        
    }
    
    func postEvent() {
        let urlAsString = "http://206.12.55.70:5000/getNames"
        let url = NSURL(string: urlAsString)!
        let request = NSMutableURLRequest(URL: url)
        
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-DD hh:mm" //format style. Browse online to get a format that fits your needs.
        var dateString = dateFormatter.stringFromDate(self.date!)
        
        var dict = ["type": self.type, "date": dateString]
        
        //checking if we have a location to had, if not it will crash passing in nil to dictionary
        if let loc = self.location {
            dict["location"] = loc
        }

        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.HTTPMethod = "POST"
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(dict, options: nil, error: nil)
        
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response, data, error) -> Void in
            
        })
    }

}