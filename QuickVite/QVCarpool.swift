//
//  QVCarpool.swift
//  QuickVite
//
//  Created by Farzin Faghihi on 2015-03-14.
//  Copyright (c) 2015 Elliot Barer. All rights reserved.
//

import Foundation

class QVCarpool: NSObject {
    
    var eventID: String
    var owner: String
    var passengers: NSMutableArray
    
    init(eventID: String, owner: String, passengers: NSMutableArray) {
        self.eventID = eventID
        self.owner = owner
        self.passengers = passengers
    }
    
    func getCar() {
        let urlAsString = "http://206.12.55.70:5000/persons"
        let url = NSURL(string: urlAsString)!
        let request = NSURLRequest(URL: url)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response, data, error) -> Void in
            var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options:nil, error: nil) as! NSDictionary
            
        })
        
    }

    func postCar(data: NSData) {
        let urlAsString = "www.inserturlhere.com"
        let url = NSURL(string: urlAsString)!
        
        let request = NSMutableURLRequest(URL: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.HTTPMethod = "POST"
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(data, options: nil, error: nil)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response, data, error) -> Void in
            
        })
        
    }
}