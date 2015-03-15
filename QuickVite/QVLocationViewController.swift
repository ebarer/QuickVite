//
//  QVLocationViewController.swift
//  QuickVite
//
//  Created by Elliot Barer on 2015-03-15.
//  Copyright (c) 2015 Elliot Barer. All rights reserved.
//

import UIKit
import MapKit

class QVLocationViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var eventMap: MKMapView!
    
    override func viewDidLoad() {
        eventMap.showsUserLocation = true
        
//        let lat = CLLocationDistance(30)
//        let lon = CLLocationDistance(30)
//
//        let startCoordinate = CLLocationCoordinate2D(latitude: <#CLLocationDegrees#>, longitude: <#CLLocationDegrees#>)
//        let coordinateSpan = MKCoordinateRegionMakeWithDistance(startCoordinate, lat, lon)
//        
//        let startRegion = MKCoordinateRegion(center: startCoordinate, span: startCoordinateSpan)
//        eventMap.setRegion(startRegion, animated: true)
        
    }
}
