//
//  FirstViewController.swift
//  geoMessenger
//
//  Created by Hong Gao on 10/16/17.
//  Copyright © 2017 Hong Gao. All rights reserved.
//

import UIKit
import MapKit
import Firebase

class FirstViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    var messageNodeRef : DatabaseReference!
    
    
    let initalLocation = CLLocation(latitude: 43.038611, longitude: -87.928759)
    
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    var locationManager = CLLocationManager()
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
        } else {
            locationManager.requestAlwaysAuthorization()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationAuthorizationStatus()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.mapView.delegate = self
        
        let initalLocation = CLLocation(latitude: 43.043914, longitude: -87.917262)
        centerMapOnLocation(location: initalLocation)
        
        messageNodeRef = Database.database().reference().child("messages")
        
        let pinMessageId = "msg-1"
        var pinMessage: Message?
        messageNodeRef.child(pinMessageId).observe(.value, with: { (snapshot: DataSnapshot) in
            
            if let dictionary = snapshot.value as? [String: Any]
            {
                if pinMessage != nil
                {
                    self.mapView.removeAnnotation(pinMessage!)
                }
                
                let pinLat = dictionary["latitude"] as! Double
                let pinLong = dictionary["longitude"] as! Double
                let messageDisabled = dictionary["isDisabled"] as! Bool
                
                let message = Message(title: (dictionary["title"] as? String)!, locationName: (dictionary["locatioName"] as? String)!, username: (dictionary["username"] as? String)!, coordinate: CLLocationCoordinate2D(latitude: pinLat, longitude: pinLong), isDisabled: messageDisabled)
                pinMessage = message
                
                if !message.isDisabled
                {
                    self.mapView.addAnnotation(message)
                }
            }
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

