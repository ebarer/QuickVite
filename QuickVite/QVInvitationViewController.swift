//
//  QVInvitationViewController.swift
//  QuickVite
//
//  Created by Gurinder Hans on 3/14/15.
//  Copyright (c) 2015 Elliot Barer. All rights reserved.
//

import UIKit

class QVInvitationViewController: UITableViewController {
    
    let KEY_NAME = "name"
    let KEY_TIME = "time"
    let KEY_IMG = "imgLink"
    let KEY_ETYPES = "type"
    let KEY_EVENTS = "people"
    
    var names = [String]()
    var imgLinks = [String]()
    var time = [String]()
    var eTypes = [String]()
    
    @IBOutlet var mTableView: UITableView!
    
    //async call for getting event invitations
    func getInvitations() {
        
        let urlAsString = VQ.url + "/invitations"
        let url = NSURL(string: urlAsString)!
        let request = NSURLRequest(URL: url)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response, data, error) -> Void in

            if error == nil && data != nil {
                //
                if let jsonData = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as? NSDictionary {
                    
//                    println(jsonData)
                    
                    var dataArr: [NSDictionary] = jsonData[self.KEY_EVENTS] as [NSDictionary]
                    
                    for i in dataArr {
                        self.names.append(i[self.KEY_NAME]! as String)
                        self.imgLinks.append(i[self.KEY_IMG]! as String)
                        self.time.append(i[self.KEY_TIME]! as String)
                        self.eTypes.append(i[self.KEY_ETYPES]! as String)
                    }
                    
                    self.mTableView.reloadData()
                }
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
        cell.hostName?.text = self.names[indexPath.row] as String
        cell.eventDate?.text = self.time[indexPath.row] as String
        cell.eventType?.text = self.eTypes[indexPath.row] as String
        
        println(self.eTypes[indexPath.row])
        
        
        let urlAsString = self.imgLinks[indexPath.row] as String
        let url = NSURL(string: urlAsString)!
        let request = NSURLRequest(URL: url)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response, data, error) -> Void in
            
            cell.profileImage.image = UIImage(data: data)
        })

        return cell
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
}