//
//  QVInvitation.swift
//  QuickVite
//
//  Created by Gurinder Hans on 3/14/15.
//  Copyright (c) 2015 Elliot Barer. All rights reserved.
//

import Foundation

class QVInvitation {
        
    let invTo:String = ""
    let invFrom:String = ""
    let invTime:String = ""
    
<<<<<<< HEAD
    var invName: String?
    var invTime: String?
    
    var people = [String]()

}
=======
    init(invTo: String, invFrom: String, invTime: String) {
        self.invTo = invTo
        self.invFrom = invFrom
        self.invTime = invTime
    }
    
    func getInvitations() {
        //fetch events
        let url = NSURL(string: VQ.url + "/persons")!
        let request = NSURLRequest(URL: url)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response, data, error) -> Void in
            var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options:nil, error: nil) as NSDictionary
            
        })
    }
    
    func createInvitaton(data: NSData) {
        let url = NSURL(string: VQ.url + "/invitation")!
        
        let request = NSMutableURLRequest(URL: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.HTTPMethod = "POST"
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(data, options: nil, error: nil)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response, data, error) -> Void in
            
        })
        
    }
    
    func postEvent() {
        let url = NSURL(string: VQ.url + "/getNames")!
        let request = NSMutableURLRequest(URL: url)
//
//        var dateFormatter = NSDateFormatter()
//        dateFormatter.dateFormat = "YYYY-MM-DD hh:mm" //format style. Browse online to get a format that fits your needs.
//        var dateString = dateFormatter.stringFromDate(self.date!)
//        
//        var dict = ["type": self.type, "date": dateString]
//        
//        //checking if we have a location to had, if not it will crash passing in nil to dictionary
//        if let loc = self.location {
//            dict["location"] = loc
//        }
//        
//        
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.HTTPMethod = "POST"
//        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(dict, options: nil, error: nil)
//        
//        
//        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response, data, error) -> Void in
//            
//        })
    }
}
>>>>>>> gurinderhans
