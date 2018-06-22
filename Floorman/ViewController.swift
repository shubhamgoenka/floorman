//
//  ViewController.swift
//  Floorman
//
//  Created by Shubham Goenka on 21/06/18.
//  Copyright © 2018 shubham. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    // Location Manager
    var currLocation    : CLLocation!
    var locationManager = CLLocationManager()
    
    // UI Elements
    var altLabel          : UILabel!
    var floorLabel        : UILabel!
    var horizontalAccLabel: UILabel!
    var latLabel          : UILabel!
    var longLabel         : UILabel!
    var verticalAccLabel  : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupUI()
        setupLocationDelegate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // UI Functions --------------------------------------------------------------------------------

    func setupUI() {
        view.backgroundColor = .white
        
        setupLatLabel()
        setupLongLabel()
        setupAltLabel()
        setupFloorLabel()
        setupHorizontalAccLabel()
        setupVerticalAccLabel()
    }
    
    func setupAltLabel() {
        altLabel = UILabel(frame: CGRect(
            x     : 50,
            y     : longLabel.frame.maxY + 10,
            width : self.view.frame.width - 100,
            height: 40
        ))
        altLabel.adjustsFontSizeToFitWidth = true
        altLabel.numberOfLines = 1
        altLabel.textAlignment = .left
        altLabel.textColor = .black
        altLabel.text = "alt shows here"
        view.addSubview(altLabel)
    }
    
    func setupFloorLabel() {
        floorLabel = UILabel(frame: CGRect(
            x     : 50,
            y     : altLabel.frame.maxY + 10,
            width : self.view.frame.width - 100,
            height: 40
        ))
        floorLabel.adjustsFontSizeToFitWidth = true
        floorLabel.numberOfLines = 1
        floorLabel.textAlignment = .left
        floorLabel.textColor = .black
        floorLabel.text = "floor level shows here"
        view.addSubview(floorLabel)
    }
    
    func setupHorizontalAccLabel() {
        horizontalAccLabel = UILabel(frame: CGRect(
            x     : 50,
            y     : floorLabel.frame.maxY + 40,
            width : self.view.frame.width - 100,
            height: 40
        ))
        horizontalAccLabel.adjustsFontSizeToFitWidth = true
        horizontalAccLabel.numberOfLines = 1
        horizontalAccLabel.textAlignment = .left
        horizontalAccLabel.textColor = .black
        horizontalAccLabel.text = "horizontal accuracy shows here"
        view.addSubview(horizontalAccLabel)
    }
    
    func setupLatLabel() {
        latLabel = UILabel(frame: CGRect(
            x     : 50,
            y     : 50,
            width : self.view.frame.width - 100,
            height: 40
        ))
        latLabel.adjustsFontSizeToFitWidth = true
        latLabel.numberOfLines = 1
        latLabel.textAlignment = .left
        latLabel.textColor = .black
        latLabel.text = "lat shows here"
        view.addSubview(latLabel)
    }
    
    func setupLongLabel() {
        longLabel = UILabel(frame: CGRect(
            x     : 50,
            y     : latLabel.frame.maxY + 10,
            width : self.view.frame.width - 100,
            height: 40
        ))
        longLabel.adjustsFontSizeToFitWidth = true
        longLabel.numberOfLines = 1
        longLabel.textAlignment = .left
        longLabel.textColor = .black
        longLabel.text = "long shows here"
        view.addSubview(longLabel)
    }
    
    func setupVerticalAccLabel() {
        verticalAccLabel = UILabel(frame: CGRect(
            x     : 50,
            y     : horizontalAccLabel.frame.maxY + 10,
            width : self.view.frame.width - 100,
            height: 40
        ))
        verticalAccLabel.adjustsFontSizeToFitWidth = true
        verticalAccLabel.numberOfLines = 1
        verticalAccLabel.textAlignment = .left
        verticalAccLabel.textColor = .black
        verticalAccLabel.text = "vertical accuracy shows here"
        view.addSubview(verticalAccLabel)
    }
    
    // END OF UI Functions -------------------------------------------------------------------------
    
    
    
    // Location Functions --------------------------------------------------------------------------
    
    func setupLocationDelegate() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func updateLocationLabels() {
        altLabel          .text = "Altitude: \(currLocation.altitude)"
        floorLabel        .text = "Floor Level: \(String(describing: currLocation.floor))"
        horizontalAccLabel.text = "Horizontal Accuracy: \(currLocation.horizontalAccuracy)m"
        latLabel          .text = "Latitude: \(currLocation.coordinate.latitude)"
        longLabel         .text = "Longitude: \(currLocation.coordinate.longitude)"
        verticalAccLabel  .text = "Vertical Accuracy: \(currLocation.verticalAccuracy)m"
    }
    
    // END OF Location Functions -------------------------------------------------------------------
}




// MARK: Location Methods ----------------------------------------------------------------------

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("hello")
        if let location = locations.first {
            print("hi")
            currLocation = location
            updateLocationLabels()
        }
    }
}
