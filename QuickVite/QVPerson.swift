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
    
    func postPerson() {
        var facebookID = NSUserDefaults.standardUserDefaults().objectForKey("facebookID") as String;
        
        let urlAsString = VQ.url + "/quickvite/api/createUser"
        let url = NSURL(string: urlAsString)!
        var dict = ["facebookID": facebookID, "firstName": self.firstName, "lastName": self.lastName]
        
        let request = NSMutableURLRequest(URL: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.HTTPMethod = "POST"
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(dict, options: nil, error: nil)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response, data, error) -> Void in

        })
    }
    
    func getEvents() {
        
        var facebookID = NSUserDefaults.standardUserDefaults().objectForKey("facebookID") as String;

        let urlAsString = VQ.url + "/quickvite/api/getEvents/" + facebookID
        let url = NSURL(string: urlAsString)!
        let request = NSMutableURLRequest(URL: url)

        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.HTTPMethod = "GET"
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response, data, error) -> Void in
            if let jsonResult = NSJSONSerialization.JSONObjectWithData(data, options:nil, error:nil) as? NSDictionary {

            }
        })
    }
}