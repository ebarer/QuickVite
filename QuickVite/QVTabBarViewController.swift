//
//  QVTabBarViewController.swift
//  QuickVite
//
//  Created by Elliot Barer on 2015-03-14.
//  Copyright (c) 2015 Elliot Barer. All rights reserved.
//

import UIKit

struct VQ {
    static let url = "http://206.12.55.70:5000"
}

var fbkLoggedIn: Bool = false

class QVTabBarViewController: UITabBarController, FBLoginViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (FBSession.activeSession().accessTokenData != nil) {
            println("Facebook Session Active")
            fbkLoggedIn = true
            self.selectedIndex = 0
        } else {
            println("Facebook Session Inactive")
            fbkLoggedIn = false
            self.selectedIndex = 3
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
