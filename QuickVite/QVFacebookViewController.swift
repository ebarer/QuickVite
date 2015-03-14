//
//  QVFacebookViewController.swift
//  QuickVite
//
//  Created by Elliot Barer on 2015-03-14.
//  Copyright (c) 2015 Elliot Barer. All rights reserved.
//

import UIKit

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
        var window: UIWindow?
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        var initialViewController = storyboard.instantiateViewControllerWithIdentifier("QVTabBarController") as UITabBarController
        window?.rootViewController = initialViewController
        window?.makeKeyAndVisible()
    }
    
    func loginViewFetchedUserInfo(loginView: FBLoginView!, user: FBGraphUser!) {
        let auth_token = FBSession.activeSession().accessTokenData.accessToken
        let userID = user.objectID
        
        FBRequestConnection.startWithGraphPath("me/taggable_friends", completionHandler: {(connection, result, error) -> Void in
            if let friends = result["data"] as? [[String:AnyObject]] {
                for friend in friends {
                    println(friend["name"])
                }
            }
        })
    }
    
    func loginViewShowingLoggedOutUser(loginView: FBLoginView!) {
        println("User Logged Out")
    }
}