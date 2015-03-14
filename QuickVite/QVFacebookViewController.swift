//
//  QVFacebookViewController.swift
//  QuickVite
//
//  Created by Elliot Barer on 2015-03-14.
//  Copyright (c) 2015 Elliot Barer. All rights reserved.
//

import UIKit

var friendList = [String]()

class QVFacebookViewController: UIViewController, FBLoginViewDelegate {
    
    @IBOutlet var fbLoginView: FBLoginView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fbLoginView.delegate = self
        self.fbLoginView.readPermissions = ["public_profile", "email", "user_friends"]
        self.fbLoginView.loginBehavior = FBSessionLoginBehavior.UseSystemAccountIfPresent
    }
    
    // Figure out how to switch viewcontroller when logging in/out
    func loginViewShowingLoggedInUser(loginView: FBLoginView!) {
        self.tabBarController?.tabBar.hidden = false
        if (fbkLoggedIn != true) {
            fbkLoggedIn = true
            self.tabBarController?.selectedIndex = 0
        }
    }
    
    func loginViewFetchedUserInfo(loginView: FBLoginView!, user: FBGraphUser!) {
        let auth_token = FBSession.activeSession().accessTokenData.accessToken
        let userID = user.objectID
        
        FBRequestConnection.startWithGraphPath("me/taggable_friends", completionHandler: {(connection, result, error) -> Void in
            if let friends = result["data"] as? [[String:AnyObject]] {
                for friend in friends {
                    let name = friend["name"] as String
                    friendList.append(name)
                }
                
                var descriptor: NSSortDescriptor = NSSortDescriptor(key: "name", ascending: true, selector: "localizedStandardCompare:")
                friendList = friendList.sorted{$0.localizedCaseInsensitiveCompare($1) == NSComparisonResult.OrderedAscending}
            }
        })
    }
    
    func loginViewShowingLoggedOutUser(loginView: FBLoginView!) {
        self.tabBarController?.tabBar.hidden = true
        if (fbkLoggedIn != false) {
            fbkLoggedIn = false
            self.tabBarController?.selectedIndex = 3
        }
    }
}
