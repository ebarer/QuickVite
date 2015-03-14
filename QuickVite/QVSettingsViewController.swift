//
//  QVGeneralListViewController.swift
//  QuickVite
//
//  Created by Elliot Barer on 2015-03-13.
//  Copyright (c) 2015 Elliot Barer. All rights reserved.
//

import UIKit

class QVSettingsViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.barTintColor = UIColor(red: 63.0/255, green: 195.0/255, blue: 128.0/255, alpha: 1.0)
        self.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}