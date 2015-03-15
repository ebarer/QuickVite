//
//  QVLocationViewController.swift
//  QuickVite
//
//  Created by Elliot Barer on 2015-03-15.
//  Copyright (c) 2015 Elliot Barer. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class QVLocationViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var eventMap: MKMapView!
    
    override func viewDidLoad() {
        
        locationManager.requestWhenInUseAuthorization()
        eventMap.showsUserLocation = true
    }
    
    func mapView(mapView: MKMapView!, didUpdateUserLocation userLocation: MKUserLocation!) {
        let region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800)
        eventMap.setRegion(region, animated: true)
    }
    
    func locationManager(_manager: CLLocationManager!,didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.AuthorizedWhenInUse {

        }
    }
}
