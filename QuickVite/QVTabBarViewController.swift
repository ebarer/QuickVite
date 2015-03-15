//
//  QVTabBarViewController.swift
//  QuickVite
//
//  Created by Elliot Barer on 2015-03-14.
//  Copyright (c) 2015 Elliot Barer. All rights reserved.
//

import UIKit

struct VQ {
    static let url = "http://206.12.54.216:8080"
}

var fbkLoggedIn: Bool = false
var friendList = [String]()
var friendListID = [String]()
let locManager = CLLocationManager()

class QVTabBarViewController: UITabBarController, FBLoginViewDelegate {
    
    var fbLoginView = FBLoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (FBSession.activeSession().accessTokenData != nil) {
            println("Facebook Session Active")
            fbkLoggedIn = true
            self.selectedIndex = 0
        } else {
            println("Facebook Session Inactive")
            fbkLoggedIn = false
            self.selectedIndex = 2
        }
        
        fbLoginView.delegate = self
        fbLoginView.readPermissions = ["public_profile", "email", "user_friends"]
        fbLoginView.loginBehavior = FBSessionLoginBehavior.UseSystemAccountIfPresent
        
        locManager.requestWhenInUseAuthorization()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginViewFetchedUserInfo(loginView: FBLoginView!, user: FBGraphUser!) {
        let auth_token = FBSession.activeSession().accessTokenData.accessToken
        let userID = user.objectID
        NSUserDefaults.standardUserDefaults().setObject(userID, forKey: "facebookID");
        
        FBRequestConnection.startWithGraphPath("me/taggable_friends", completionHandler: {(connection, result, error) -> Void in
            if let friends = result["data"] as? [[String:AnyObject]] {
                // Establish fbk friendlist, and IDs
                for friend in friends {
                    let name = friend["name"] as String
                    friendList.append(name)
                    
                    let fbkid = friend["id"] as String
                    friendListID.append(fbkid)
                }
                
                var descriptor: NSSortDescriptor = NSSortDescriptor(key: "name", ascending: true, selector: "localizedStandardCompare:")
//                friendList = friendList.sorted{$0.localizedCaseInsensitiveCompare($1) == NSComparisonResult.OrderedAscending}
            }
        })
        
        FBRequestConnection.startWithGraphPath("me", completionHandler: {(connection, result, error) -> Void in
            var newQVPerson = QVPerson(firstName: result.first_name, lastName: result.last_name)
            newQVPerson.postPerson()
        })
    }

}
