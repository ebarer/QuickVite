//
//  QVLoginViewController.swift
//  QuickVite
//
//  Created by Farzin Faghihi on 2015-03-14.
//  Copyright (c) 2015 Elliot Barer. All rights reserved.
//

import UIKit

class QVLoginViewController: UIViewController, FBLoginViewDelegate {
    
    @IBOutlet var fbLoginView: FBLoginView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.fbLoginView.delegate = self
        
        self.fbLoginView.readPermissions = ["public_profile", "email", "user_friends"]
        
        self.fbLoginView.loginBehavior = FBSessionLoginBehavior.UseSystemAccountIfPresent
        
        if (FBSession.activeSession().accessTokenData != nil) {
            println("session is active, logged in")
        } else {
            println("no session found, logged out")
        }
    }
    
    func loginViewShowingLoggedInUser(loginView: FBLoginView!) {
        println("logged in")
    }
    
    func loginViewShowingLoggedOutUser(loginView: FBLoginView!) {
        println("logged out")
    }
    
    func loginViewFetchedUserInfo(loginView: FBLoginView!, user: FBGraphUser!) {
        var auth_token = FBSession.activeSession().accessTokenData.accessToken
        
        let user_id = user.objectID
        
        FBRequestConnection.startWithGraphPath("me/taggable_friends", completionHandler: { (connection, result, error) -> Void in
            if let friends = result["data"] as? [[String: AnyObject]] {
                println(friends.count)
                for friend in friends {
                    println(friend["name"])
                }
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}