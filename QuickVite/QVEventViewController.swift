//
//  QVEventViewController.swift
//  QuickVite
//
//  Created by Elliot Barer on 2015-03-13.
//  Copyright (c) 2015 Elliot Barer. All rights reserved.
//

import UIKit

class QVEventViewController: UIViewController {

    var aEvent: QVEvent?
    @IBOutlet weak var testText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        println(aEvent)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

