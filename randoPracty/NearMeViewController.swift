//
//  NearMeViewController.swift
//  randoPracty
//
//  Created by Avery Bentz on 2015-08-05.
//  Copyright (c) 2015 Avery Bentz. All rights reserved.
//

import UIKit

class NearMeViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var mapView: GMSMapView!
    @IBOutlet weak var mapCenterPinImage: UIImageView!
    @IBOutlet weak var pinImageVerticalConstraint: NSLayoutConstraint!
     
     let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     
     //Change nav bar colour
     self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.78039216, green: 0.81960784, blue: 0.84705882, alpha: 1)
     
     locationManager.delegate = self
     locationManager.requestWhenInUseAuthorization()
     
     //Display user's current location on the map
     locationManager.startUpdatingLocation()

    }
     
    @IBAction func mapTypesSegmentPressed(sender: AnyObject) {
     let segmentedControl = sender as! UISegmentedControl
     switch segmentedControl.selectedSegmentIndex {
     case 0:
          mapView.mapType = kGMSTypeNormal
     case 1:
          mapView.mapType = kGMSTypeSatellite
     case 2:
          mapView.mapType = kGMSTypeHybrid
     default:
          mapView.mapType = mapView.mapType
     }
     
    }
     
     func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
          
          if status == .AuthorizedWhenInUse {
               
               //Once permissions have been established, ask the location manager for updates on the user’s location
               locationManager.startUpdatingLocation()
               
               //GMSMapView has two features concerning the user’s location: myLocationEnabled draws a light blue dot where the user is located, while myLocationButton adds a button to the map that centers the user’s location when tapped
               mapView.myLocationEnabled = true
               mapView.settings.myLocationButton = true
          }
          
     }
     
     func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
          
          if let location = locations.first as CLLocation! {
               
               //This updates the map’s camera to center around the user’s current location. The GMSCameraPosition class aggregates all camera position parameters and passes them to the map for display.
               mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
               
               //Tell locationManager you’re no longer interested in updates; you don’t want to follow a user around as their initial location is enough for you to work with.
               locationManager.stopUpdatingLocation()
          }
     }
     
}
