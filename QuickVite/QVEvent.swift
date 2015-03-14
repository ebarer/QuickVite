//
//  QVEvent.swift
//  QuickVite
//
//  Created by Farzin Faghihi on 2015-03-13.
//  Copyright (c) 2015 Elliot Barer. All rights reserved.
//

import Foundation

class QVEvent: NSObject {
    
    var name: String
    var date: NSDate
    var location: String
    
    
    func getEvent() {
        let urlAsString = "www.inserturlhere.com"
        let url = NSURL(string: urlAsString)!
        let request = NSURLRequest(URL: url)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), { (response, data, error) -> Void in
            
        })
        
    }
    
    func postEvent(data: NSData) {
        let urlAsString = "www.inserturlhere.com"
        let url = NSURL(string: urlAsString)!
        
        let request = NSMutableURLRequest(URL: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.HTTPMethod = "POST"
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(data, options: nil, error: nil)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), { (response, data, error) -> Void in
            
        })
        
    }
}