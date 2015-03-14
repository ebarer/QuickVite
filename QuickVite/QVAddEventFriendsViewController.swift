//
//  QVAddEventFriendsViewController.swift
//  QuickVite
//
//  Created by Elliot Barer on 2015-03-14.
//  Copyright (c) 2015 Elliot Barer. All rights reserved.
//

import UIKit

class QVAddEventFriendsViewController: UIViewController {
    
    var newEvent: QVEvent?
    let friendList:[String]?
    
    @IBOutlet weak var testField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        testField.text = newEvent?.type

        // Do any additional setup after loading the view.
    }
    
    

    
}
