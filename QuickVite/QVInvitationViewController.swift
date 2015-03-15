//
//  QVInvitationViewController.swift
//  QuickVite
//
//  Created by Gurinder Hans on 3/14/15.
//  Copyright (c) 2015 Elliot Barer. All rights reserved.
//

import UIKit

class QVInvitationViewController: UITableViewController {
    
    var names = [String]()
    var images = [String]()
    
    @IBOutlet var mTableView: UITableView!
    
    //async call for getting event invitations
    func getInvitations() {
        let urlAsString = VQ.url + "/invitations"
        let url = NSURL(string: urlAsString)!
        let request = NSURLRequest(URL: url)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response, data, error) -> Void in
            


            if let data = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as? NSDictionary {
                if let data = data["people"]! as? [[String:AnyObject]] {
                    for i in data {
//                        self.names.append(i["name"])
                    }
                }
                
                self.mTableView.reloadData()
            }
            
        })
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getInvitations()
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.names.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("QVInvitationViewCell") as QVInvitationTableViewCell
        
//        cell.textLabel?.text = self.names[indexPath.row] as String
        
        
        return cell
    }
    
    
}