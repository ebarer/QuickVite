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
        self.title = "Settings"
        self.tabBarController?.tabBar.hidden = false
        if (fbkLoggedIn != true) {
            fbkLoggedIn = true
            self.tabBarController?.selectedIndex = 0
        }
    }
    
    func loginViewShowingLoggedOutUser(loginView: FBLoginView!) {
        self.title = "QuickVite"
        self.tabBarController?.tabBar.hidden = true
        if (fbkLoggedIn != false) {
            fbkLoggedIn = false
            self.tabBarController?.selectedIndex = 2
        }
    }
}
