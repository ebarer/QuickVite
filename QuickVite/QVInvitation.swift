//
//  QVInvitation.swift
//  QuickVite
//
//  Created by Gurinder Hans on 3/14/15.
//  Copyright (c) 2015 Elliot Barer. All rights reserved.
//

import UIKit

class QVInvitation {
    
    var userImage:UIImage,
    firstName:String,
    lastName:String,
    type:String,
    when:String
    
    init(userImage:UIImage, firstName:String, lastName:String, type:String, when:String) {
        self.userImage = userImage
        self.firstName = firstName
        self.lastName = lastName
        self.type = type
        self.when = when
    }
    
    class func getInvitations() {
        var names = [AnyObject]()
        let urlAsString = VQ.url + "/invitations"
        let url = NSURL(string: urlAsString)!
        let request = NSURLRequest(URL: url)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response, data, error) -> Void in
            //            var data = NSString(data: data, encoding: NSUTF8StringEncoding)!
            var data = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: nil) as NSDictionary
            if let data = data["people"]! as? [[String:AnyObject]] {
                for i in data {
                    names.append(i)
                }
            }
        })
        
    }
    
    func postInvitation() {
        let urlAsString = VQ.url + "/quickvite/api/createInvitations"
        let url = NSURL(string: urlAsString)!
        var dict = ["firstName": self.firstName, "lastName": self.lastName, "type": self.type, "when": self.when]
        
        let request = NSMutableURLRequest(URL: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.HTTPMethod = "POST"
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(dict, options: nil, error: nil)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response, data, error) -> Void in })
    }
    
}