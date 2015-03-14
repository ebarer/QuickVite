//
//  QVPerson.swift
//  QuickVite
//
//  Created by Farzin Faghihi on 2015-03-14.
//  Copyright (c) 2015 Elliot Barer. All rights reserved.
//

import Foundation

class QVPerson: NSObject {
    
    var firstName: String
    var lastName: String
    var car: QVCarpool?
    var hasCar: Bool {
        get {
            return car != nil
        }
        
    }
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func getPerson() {
        let urlAsString = VQ.url + "/persons"
        let url = NSURL(string: urlAsString)!
        let request = NSURLRequest(URL: url)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response, data, error) -> Void in
            var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options:nil, error: nil) as NSDictionary
            var persons = jsonResult["persons"]! as [[String : AnyObject]]
            
            self.firstName = persons[0]["name"]! as String
            self.lastName = persons[0]["name"]! as String
        })
    }
    
    func postPerson(data: AnyObject) {
        let urlAsString = VQ.url + "/getNames"
        let url = NSURL(string: urlAsString)!
        
        let request = NSMutableURLRequest(URL: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.HTTPMethod = "POST"
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(data, options: nil, error: nil)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response, data, error) -> Void in

        })
    }
    
}