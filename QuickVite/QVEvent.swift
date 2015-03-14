//
//  QVEvent.swift
//  QuickVite
//
//  Created by Farzin Faghihi on 2015-03-13.
//  Copyright (c) 2015 Elliot Barer. All rights reserved.
//

import Foundation

class QVEvent: NSObject {
    
    var name: String
    var date: NSDate?
    
    init(name: String, date dateParam: NSDate?) {
        self.name = name
        
        if let newDate = dateParam {
            self.date = newDate
        }
    }
    
}