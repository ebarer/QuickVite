//
//  QVEventTableViewController.swift
//  QuickVite
//
//  Created by Elliot Barer on 2015-03-14.
//  Copyright (c) 2015 Elliot Barer. All rights reserved.
//

import UIKit

class QVEventTableViewController: UITableViewController {
    
    var animationInProgress = false
    
    override func viewDidAppear(animated: Bool) {
        if animationInProgress {
            performSegueWithIdentifier("moveToEvent", sender: self)
            animationInProgress = false
        }
    }
    
    @IBAction func unwindToEvent(segue: UIStoryboardSegue) {
        animationInProgress = true
    }
    
}
